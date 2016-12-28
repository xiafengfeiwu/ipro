package com.pro.controller;

import java.util.Date;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.WarnGroup;
import com.pro.entity.WarnGroupItem;
import com.pro.service.WarnConfigService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("warn")
public class WarnController {

	@Autowired
	WarnConfigService warnConfigService;

	@RequiresAuthentication
	@RequestMapping("list")
	public ModelAndView listPage() {
		ModelAndView modelAndView = new ModelAndView("warn_group_list");
		modelAndView.addObject("warnGroups", warnConfigService.findAllWarnGroup());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createGroup")
	@RequiresPermissions("CreateWarnGroup")
	public ModelAndView createGroupPage() {
		ModelAndView modelAndView = new ModelAndView("warn_group_create");
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("saveWarnGroupAction")
	@RequiresPermissions("CreateWarnGroup")
	public String saveWarnGroupAction(WarnGroup warnGroup, RedirectAttributes attr) {
		String view = "redirect:/warn/createGroup.jspx";
		attr.addFlashAttribute("status", "danger");
		if (warnGroup == null) {
			attr.addFlashAttribute("message", "无效的数据");
			return view;
		}
		if (PublicUtil.isEmpty(warnGroup.getGroupName())) {
			attr.addFlashAttribute("warnGroup", warnGroup);
			attr.addFlashAttribute("message", "请输入告警组名称");
			return view;
		} else {
			warnGroup.setGroupName(warnGroup.getGroupName().trim());
		}
		warnGroup.setGroupId(PublicUtil.initId());
		warnGroup.setCreateTime(new Date());
		warnGroup.setCreatorId(PublicUtil.sessionUid());
		try {
			warnConfigService.createWarnGroup(warnGroup);
		} catch (Exception e) {
			attr.addFlashAttribute("warnGroup", warnGroup);
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "新增成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("updateGroup")
	@RequiresPermissions("UpdateWarnGroup")
	public ModelAndView updateGroupPage(Long warnGroupId) {
		ModelAndView modelAndView = new ModelAndView("warn_group_update");
		modelAndView.addObject("warnGroup", warnConfigService.findWarnGroupById(warnGroupId));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateWarnGroupAction")
	@RequiresPermissions("UpdateWarnGroup")
	public String updateWarnGroupAction(WarnGroup warnGroup, RedirectAttributes attr) {
		String view = "redirect:/warn/updateGroup.jspx?warnGroupId=" + warnGroup.getGroupId();
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(warnGroup.getGroupName())) {
			attr.addFlashAttribute("message", "请输入告警组名称");
			return view;
		} else {
			warnGroup.setGroupName(warnGroup.getGroupName().trim());
		}
		WarnGroup wg = warnConfigService.findWarnGroupById(warnGroup.getGroupId());
		wg.setGroupName(warnGroup.getGroupName());
		wg.setGroupDescript(warnGroup.getGroupDescript());
		try {
			warnConfigService.updateWarnGroup(wg);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "更新失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "更新成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("deleteGroup")
	@RequiresPermissions("DeleteWarnGroup")
	public ModelAndView deleteGroupPage(Long warnGroupId) {
		ModelAndView modelAndView = new ModelAndView("warn_group_delete");
		WarnGroup warnGroup = warnConfigService.findWarnGroupById(warnGroupId);
		if (warnGroup != null) {
			modelAndView.addObject("warnGroup", warnGroup);
		} else {
			modelAndView.addObject("status", "success");
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteWarnGroupAction")
	@RequiresPermissions("DeleteWarnGroup")
	public String deleteWarnGroupAction(Long warnGroupId, RedirectAttributes attr) {
		String view = "redirect:/warn/deleteGroup.jspx?warnGroupId=" + warnGroupId;
		attr.addFlashAttribute("status", "danger");
		WarnGroup warnGroup = warnConfigService.findWarnGroupById(warnGroupId);
		try {
			if (warnGroup != null) {
				warnConfigService.deleteWarnGroup(warnGroupId);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "删除失败，可能已被项目关联！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("groupItemList")
	public ModelAndView groupItemListPage(Long warnGroupId) {
		ModelAndView modelAndView = new ModelAndView("warn_item_list");
		modelAndView.addObject("warnGroup", warnConfigService.findWarnGroupById(warnGroupId));
		modelAndView.addObject("warnItems", warnConfigService.findAllWarnItem(warnGroupId));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createItem")
	@RequiresPermissions("CreateWarnItem")
	public ModelAndView createItemPage(Long warnGroupId) {
		ModelAndView modelAndView = new ModelAndView("warn_item_create");
		modelAndView.addObject("warnGroupId", warnGroupId);
		modelAndView.addObject("warnMonitorItems", warnConfigService.findAllWarnMonitorItem());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("saveWarnItemAction")
	@RequiresPermissions("CreateWarnItem")
	public String saveWarnItemAction(WarnGroupItem warnItem, RedirectAttributes attr) {
		String view = "redirect:/warn/createItem.jspx?warnGroupId=" + warnItem.getWarnGroupId();
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(warnItem.getItemName())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "请选择要监控的告警项");
			return view;
		}
		if (PublicUtil.isEmpty(warnItem.getItemOperators())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "请选择告警项操作符");
			return view;
		}
		if (PublicUtil.isEmpty(warnItem.getItemThreshold())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "请输入监控阀值");
			return view;
		}
		if (!PublicUtil.isNumber(warnItem.getItemThreshold())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "无效的监控阀值");
			return view;
		}
		if (PublicUtil.isEmpty(warnItem.getWarnCode())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "请输入告警代码");
			return view;
		} else {
			warnItem.setWarnCode(warnItem.getWarnCode().trim());
		}
		if (PublicUtil.isEmpty(warnItem.getWarnLevel())) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "请选择告警级别");
			return view;
		}
		if (null != warnConfigService.findWarnItemByCode(warnItem.getWarnCode())) {
			warnItem.setWarnCode("");
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "告警代码已存在");
			return view;
		}
		warnItem.setItemId(PublicUtil.initId());
		warnItem.setCreateTime(new Date());
		warnItem.setCreatorId(PublicUtil.sessionUid());
		try {
			warnConfigService.createWarnItem(warnItem);
		} catch (Exception e) {
			attr.addFlashAttribute("warnItem", warnItem);
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "新增成功");
		return view;
	}
}
