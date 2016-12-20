package com.pro.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.dao.JurisdictionGroupMapper;
import com.pro.dao.JurisdictionMapper;
import com.pro.entity.Jurisdiction;
import com.pro.entity.JurisdictionExample;
import com.pro.entity.JurisdictionGroup;
import com.pro.entity.JurisdictionGroupExample;
import com.pro.entity.Menu;
import com.pro.entity.Role;
import com.pro.entity.RoleJurisdictionKey;
import com.pro.entity.RoleMenu;
import com.pro.entity.RoleMenuKey;
import com.pro.service.MenuService;
import com.pro.service.RoleService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	RoleService roleService;
	@Autowired
	JurisdictionGroupMapper jurisdictionGroupMapper;
	@Autowired
	JurisdictionMapper jurisdictionMapper;
	@Autowired
	MenuService menuService;

	@RequiresAuthentication
	@RequestMapping("list")
	public ModelAndView listPage(String searchWord, String field, String order) {
		ModelAndView modelAndView = new ModelAndView("role_list");
		List<Role> roles = roleService.findAll(searchWord, field, order);
		modelAndView.addObject("roles", roles);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("create")
	@RequiresPermissions("CreateRole")
	public ModelAndView createPage() {
		ModelAndView modelAndView = new ModelAndView("role_create");
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("saveAction")
	@RequiresPermissions("CreateRole")
	public String saveAction(String roleName, RedirectAttributes attr) {
		String view = "redirect:/role/create.jspx";
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(roleName) || roleName.length() > 20) {
			attr.addFlashAttribute("message", "无效的角色名称");
			return view;
		}
		Role role = new Role();
		role.setRoleId(PublicUtil.initId());
		role.setRoleName(roleName);
		role.setSystemRole(false);
		role.setRoleCreateTime(new Date());
		role.setRoleModifyTime(new Date());
		try {
			roleService.create(role);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "新增失败，请稍后重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "创建成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("change")
	@RequiresPermissions("UpdateRole")
	public ModelAndView changePage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_change");
		Role role = roleService.getById(roleId);
		modelAndView.addObject("role", role);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateAction")
	@RequiresPermissions("UpdateRole")
	public String updateAction(Role role, RedirectAttributes attr) {
		String view = "redirect:/role/change.jspx?roleId=" + role.getRoleId();
		attr.addFlashAttribute("status", "danger");
		if (role.getRoleId() == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (PublicUtil.isEmpty(role.getRoleName()) || role.getRoleName().length() > 20) {
			attr.addFlashAttribute("message", "无效的角色名称");
			return view;
		}
		Role nRole = roleService.getById(role.getRoleId());
		if (nRole == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (nRole.getSystemRole()) {
			attr.addFlashAttribute("message", "系统角色不允许修改");
			return view;
		}
		nRole.setRoleName(role.getRoleName().trim());
		nRole.setRoleModifyTime(new Date());
		try {
			roleService.update(nRole);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "修改失败，请稍后重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "修改成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("delete")
	@RequiresPermissions("DeleteRole")
	public ModelAndView deletePage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_delete");
		Role role = roleService.getById(roleId);
		if (role != null) {
			modelAndView.addObject("role", role);
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteAction")
	@RequiresPermissions("DeleteRole")
	public String deleteAction(Long roleId, RedirectAttributes attr) {
		String view = "redirect:/role/delete.jspx?roleId=" + roleId;
		attr.addFlashAttribute("status", "danger");
		Role nRole = roleService.getById(roleId);
		if (nRole == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (nRole.getSystemRole()) {
			attr.addFlashAttribute("message", "系统角色不允许删除");
			return view;
		}
		try {
			roleService.delete(roleId);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "删除失败，角色存在关联不允许删除！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("authorize")
	@RequiresPermissions("RoleAuth")
	public ModelAndView authPage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_authorize");
		List<Jurisdiction> roleJurisdictions = roleService.findRoleJurisdictions(roleId);
		JurisdictionGroupExample jGMExample = new JurisdictionGroupExample();
		jGMExample.setOrderByClause("group_id desc");
		List<JurisdictionGroup> jurisdictionGroups = jurisdictionGroupMapper.selectByExample(jGMExample);
		Map<String, List<Map<String, Object>>> data = new HashMap<>();
		if (PublicUtil.isNotEmpty(jurisdictionGroups)) {
			for (JurisdictionGroup jurisdictionGroup : jurisdictionGroups) {
				JurisdictionExample jMexample = new JurisdictionExample();
				jGMExample.setOrderByClause("jurisdiction_id asc");
				jMexample.createCriteria().andGroupIdEqualTo(jurisdictionGroup.getGroupId());
				List<Jurisdiction> jurisdictions = jurisdictionMapper.selectByExample(jMexample);
				if (PublicUtil.isNotEmpty(jurisdictions)) {
					List<Map<String, Object>> list = new LinkedList<>();
					for (Jurisdiction jurisdiction : jurisdictions) {
						Map<String, Object> map = new HashMap<>();
						map.put("jurisdictionId", jurisdiction.getJurisdictionId());
						map.put("jurisdictionName", jurisdiction.getJurisdictionName());
						map.put("jurisdictionDescript", jurisdiction.getJurisdictionDescript());
						map.put("hasJurisdiction", "fa-square-o");
						if (PublicUtil.isNotEmpty(roleJurisdictions)) {
							for (Jurisdiction rj : roleJurisdictions) {
								if (rj.getJurisdictionId().equals(jurisdiction.getJurisdictionId())) {
									map.put("hasJurisdiction", "fa-check-square-o");
									break;
								}
							}
						}
						list.add(map);
					}
					data.put(jurisdictionGroup.getGroupName(), list);
				}
			}
		}
		modelAndView.addObject("data", data);
		modelAndView.addObject("roleId", roleId);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("authorizeAction")
	@RequiresPermissions("RoleAuth")
	public String authAction(Long roleId, Long jurisdictionId, RedirectAttributes attr) {
		String view = "redirect:/role/authorize.jspx?roleId=" + roleId;
		attr.addFlashAttribute("status", "danger");
		RoleJurisdictionKey jurisdictionKey = new RoleJurisdictionKey();
		jurisdictionKey.setRoleId(roleId);
		jurisdictionKey.setJurisdictionId(jurisdictionId);
		try {
			if (roleService.checkRoleJurisdiction(roleId, jurisdictionId)) {
				roleService.removeRoleJurisdiction(jurisdictionKey);
			} else {
				roleService.addRoleJurisdiction(jurisdictionKey);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "操作成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("menu")
	@RequiresPermissions("RoleAuth")
	public ModelAndView menuPage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_menu");
		List<Menu> hadMenus = roleService.findRoleMenus(roleId);
		List<Menu> menus = menuService.findAll();
		Map<String, List<Map<String, Object>>> data = new HashMap<>();
		if (PublicUtil.isNotEmpty(menus)) {
			for (Menu menu : menus) {
				if (menu.getIsRoot()) {
					List<Map<String, Object>> list = new LinkedList<>();
					for (Menu cmenu : menus) {
						if (menu.getMenuId().equals(cmenu.getMenuPid())) {
							Map<String, Object> map = new HashMap<>();
							map.put("menuId", cmenu.getMenuId());
							map.put("menuPid", cmenu.getMenuPid());
							map.put("menuName", cmenu.getMenuName());
							map.put("hasMenu", "fa-square-o");
							if (PublicUtil.isNotEmpty(hadMenus)) {
								for (Menu hm : hadMenus) {
									if (hm.getMenuId().equals(cmenu.getMenuId())) {
										map.put("hasMenu", "fa-check-square-o");
										break;
									}
								}
							}
							list.add(map);
						}
					}
					data.put(menu.getMenuName(), list);
				}
			}
		}
		modelAndView.addObject("data", data);
		modelAndView.addObject("roleId", roleId);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("menuAction")
	@RequiresPermissions("RoleAuth")
	public String menuAction(Long roleId, Long menuId, Long menuPid, RedirectAttributes attr) {
		String view = "redirect:/role/menu.jspx?roleId=" + roleId;
		attr.addFlashAttribute("status", "danger");
		try {
			if (roleService.checkRoleMenu(roleId, menuId)) {
				RoleMenuKey roleMenuKey = new RoleMenuKey();
				roleMenuKey.setRoleId(roleId);
				roleMenuKey.setMenuId(menuId);
				roleService.removeRoleMenu(roleMenuKey);
			} else {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setMenuPid(menuPid);
				roleMenu.setMenuId(menuId);
				roleMenu.setRoleId(roleId);
				roleService.addRoleMenu(roleMenu);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "操作成功");
		return view;
	}

}
