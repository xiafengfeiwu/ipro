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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.Device;
import com.pro.entity.DeviceVender;
import com.pro.model.RequestPage;
import com.pro.service.DeviceService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("device")
public class DeviceController {

	@Autowired
	DeviceService deviceService;

	@RequiresAuthentication
	@RequestMapping("list")
	public ModelAndView listPage() {
		ModelAndView modelAndView = new ModelAndView("device_list");
		return modelAndView;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping("listData")
	public Map<String, Object> listData(RequestPage reqPage) {
		Map<String, Object> data = new HashMap<>();
		if (reqPage == null) {
			reqPage = new RequestPage();
		}
		data.put("reqPage", reqPage);
		long count = deviceService.getDeviceCount(reqPage.getSearchWord());
		if (count > 0) {
			data.put("totalPages", (int) ((count + reqPage.getLength() - 1) / reqPage.getLength()));
			List<Device> list = deviceService.getDeviceData(reqPage.getSearchWord(), reqPage.getField(), reqPage.getOrder(), reqPage.getPage(), reqPage.getLength());
			List<Map<String, Object>> listData = new LinkedList<>();
			for (Device device : list) {
				Map<String, Object> deviceData = new HashMap<>();
				deviceData.put("deviceId", device.getDeviceId().toString());
				deviceData.put("deviceSn", device.getDeviceSn());
				deviceData.put("deviceName", device.getDeviceName());
				deviceData.put("deviceModel", device.getDeviceModel());
				deviceData.put("deviceType", device.getDeviceType());
				deviceData.put("deviceVenderCode", device.getDeviceVenderCode());
				deviceData.put("createTime", device.getCreateTime());
				listData.add(deviceData);
			}
			data.put("data", listData);
			data.put("success", true);
		} else {
			data.put("success", false);
		}
		return data;
	}

	@RequiresAuthentication
	@RequestMapping("detail")
	public ModelAndView detailPage(Long deviceId) {
		ModelAndView modelAndView = new ModelAndView("device_detail");
		Device device = deviceService.findById(deviceId);
		modelAndView.addObject("device", device);
		modelAndView.addObject("deviceVender", deviceService.findVenderByCode(device.getDeviceVenderCode()));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("create")
	@RequiresPermissions("CreateDevice")
	public ModelAndView createPage() {
		ModelAndView modelAndView = new ModelAndView("device_create");
		modelAndView.addObject("venders", deviceService.findAllVenders());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createAction")
	@RequiresPermissions("CreateDevice")
	public String createAction(Device device, RedirectAttributes attr) {
		String view = "redirect:/device/create.jspx";
		attr.addFlashAttribute("status", "danger");
		if (device == null) {
			attr.addFlashAttribute("message", "无效的数据");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceVenderCode())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请选择一个供应商");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceType())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请选择一个设备类型");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceName())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请输入设备名称");
			return view;
		} else {
			device.setDeviceName(device.getDeviceName().trim());
		}
		if (PublicUtil.isEmpty(device.getDeviceSn())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请输入设备序列号");
			return view;
		} else {
			device.setDeviceSn(device.getDeviceSn().trim());
		}
		if (deviceService.findBySn(device.getDeviceSn()) != null) {
			device.setDeviceSn("");
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "当前设备序列号已存在");
			return view;
		}
		device.setDeviceId(PublicUtil.initId());
		device.setCreateTime(new Date());
		device.setCreatorId(PublicUtil.sessionUid());
		device.setModifyTime(new Date());
		try {
			deviceService.save(device);
		} catch (Exception e) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "新增成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("update")
	@RequiresPermissions("UpdateDevice")
	public ModelAndView updatePage(Long deviceId) {
		ModelAndView modelAndView = new ModelAndView("device_update");
		modelAndView.addObject("device", deviceService.findById(deviceId));
		modelAndView.addObject("venders", deviceService.findAllVenders());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateAction")
	@RequiresPermissions("UpdateDevice")
	public String updateAction(Device device, RedirectAttributes attr) {
		String view = "redirect:/device/update.jspx?deviceId=" + device.getDeviceId();
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(device.getDeviceVenderCode())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请选择一个供应商");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceType())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请选择一个设备类型");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceName())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请输入设备名称");
			return view;
		} else {
			device.setDeviceName(device.getDeviceName().trim());
		}
		if (PublicUtil.isEmpty(device.getDeviceSn())) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "请输入设备序列号");
			return view;
		} else {
			device.setDeviceSn(device.getDeviceSn().trim());
		}
		Device ds = deviceService.findBySn(device.getDeviceSn());
		if (ds != null && !ds.getDeviceId().equals(device.getDeviceId())) {
			device.setDeviceSn("");
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "当前设备序列号已存在");
			return view;
		}
		ds = deviceService.findById(device.getDeviceId());
		ds.setDeviceSn(device.getDeviceSn());
		ds.setDeviceName(device.getDeviceName());
		ds.setDeviceModel(device.getDeviceModel());
		ds.setDeviceVenderCode(device.getDeviceVenderCode());
		ds.setDeviceType(device.getDeviceType());
		ds.setModifyTime(new Date());
		try {
			deviceService.update(ds);
		} catch (Exception e) {
			attr.addFlashAttribute("device", device);
			attr.addFlashAttribute("message", "更新失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "更新成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("delete")
	@RequiresPermissions("DeleteDevice")
	public ModelAndView deletePage(Long deviceId) {
		ModelAndView modelAndView = new ModelAndView("device_delete");
		Device device = deviceService.findById(deviceId);
		if (device != null) {
			modelAndView.addObject("device", device);
		} else {
			modelAndView.addObject("status", "success");
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteAction")
	@RequiresPermissions("DeleteDevice")
	public String deleteAction(Long deviceId, RedirectAttributes attr) {
		String view = "redirect:/device/delete.jspx?deviceId=" + deviceId;
		attr.addFlashAttribute("status", "danger");
		Device device = deviceService.findById(deviceId);
		try {
			if (device != null) {
				deviceService.delete(deviceId);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "删除失败，可能已被采集点关联！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("vender/list")
	public ModelAndView venderListPage() {
		ModelAndView modelAndView = new ModelAndView("device_vender_list");
		modelAndView.addObject("venders", deviceService.findAllVenders());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createVender")
	@RequiresPermissions("CreateDeviceVender")
	public ModelAndView createVenderPage() {
		ModelAndView modelAndView = new ModelAndView("device_create_vender");
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createVenderAction")
	@RequiresPermissions("CreateDeviceVender")
	public String createVenderAction(DeviceVender vender, RedirectAttributes attr) {
		String view = "redirect:/device/createVender.jspx";
		attr.addFlashAttribute("status", "danger");
		if (vender == null) {
			attr.addFlashAttribute("message", "无效的数据");
			return view;
		}
		if (PublicUtil.isEmpty(vender.getVenderName())) {
			attr.addFlashAttribute("vender", vender);
			attr.addFlashAttribute("message", "请输入供应商名称");
			return view;
		} else {
			vender.setVenderName(vender.getVenderName().trim());
		}
		if (PublicUtil.isEmpty(vender.getVenderCode())) {
			attr.addFlashAttribute("vender", vender);
			attr.addFlashAttribute("message", "请输入供应商代码");
			return view;
		} else {
			vender.setVenderCode(vender.getVenderCode().trim());
		}
		if (!PublicUtil.isPhoneNo(vender.getVenderContactsTel())) {
			attr.addFlashAttribute("vender", vender);
			attr.addFlashAttribute("message", "无效的手机号");
			return view;
		}
		if (deviceService.findVenderByCode(vender.getVenderCode()) != null) {
			vender.setVenderCode("");
			attr.addFlashAttribute("vender", vender);
			attr.addFlashAttribute("message", "当前供应商编码已存在");
			return view;
		}
		vender.setVenderId(PublicUtil.initId());
		vender.setCreateTime(new Date());
		vender.setCreatorId(PublicUtil.sessionUid());
		try {
			deviceService.createVender(vender);
		} catch (Exception e) {
			attr.addFlashAttribute("vender", vender);
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "新增成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("updateVender")
	@RequiresPermissions("UpdateDeviceVender")
	public ModelAndView updateVenderPage(Long venderId) {
		ModelAndView modelAndView = new ModelAndView("device_update_vender");
		modelAndView.addObject("vender", deviceService.findVenderById(venderId));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateVenderAction")
	@RequiresPermissions("UpdateDeviceVender")
	public String updateVenderAction(DeviceVender vender, RedirectAttributes attr) {
		String view = "redirect:/device/updateVender.jspx?venderId=" + vender.getVenderId();
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(vender.getVenderName())) {
			attr.addFlashAttribute("message", "请输入供应商名称");
			return view;
		} else {
			vender.setVenderName(vender.getVenderName().trim());
		}
		if (PublicUtil.isEmpty(vender.getVenderCode())) {
			attr.addFlashAttribute("message", "请输入供应商代码");
			return view;
		} else {
			vender.setVenderCode(vender.getVenderCode().trim());
		}
		if (!PublicUtil.isPhoneNo(vender.getVenderContactsTel())) {
			attr.addFlashAttribute("message", "无效的手机号");
			return view;
		}
		DeviceVender dv = deviceService.findVenderByCode(vender.getVenderCode());
		if (dv != null && !dv.getVenderId().equals(vender.getVenderId())) {
			attr.addFlashAttribute("message", "当前供应商编码已存在");
			return view;
		}
		dv = deviceService.findVenderById(vender.getVenderId());
		dv.setVenderAddress(vender.getVenderAddress());
		dv.setVenderCode(vender.getVenderCode());
		dv.setVenderName(vender.getVenderName());
		dv.setVenderContacts(vender.getVenderContacts());
		dv.setVenderContactsTel(vender.getVenderContactsTel());
		try {
			deviceService.updateVender(dv);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "更新失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "更新成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("deleteVender")
	@RequiresPermissions("DeleteDeviceVender")
	public ModelAndView deleteVenderPage(Long venderId) {
		ModelAndView modelAndView = new ModelAndView("device_vender_delete");
		DeviceVender vender = deviceService.findVenderById(venderId);
		if (vender != null) {
			modelAndView.addObject("vender", vender);
		} else {
			modelAndView.addObject("status", "success");
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteVenderAction")
	@RequiresPermissions("DeleteDeviceVender")
	public String deleteVenderAction(Long venderId, RedirectAttributes attr) {
		String view = "redirect:/device/deleteVender.jspx?venderId=" + venderId;
		attr.addFlashAttribute("status", "danger");
		DeviceVender vender = deviceService.findVenderById(venderId);
		try {
			if (vender != null) {
				deviceService.deleteVender(venderId);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "删除失败，可能已被设备关联！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功");
		return view;
	}

}
