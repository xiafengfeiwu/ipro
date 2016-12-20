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
	@RequestMapping("create")
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
			attr.addFlashAttribute("message", "请选择一个供应商");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceType())) {
			attr.addFlashAttribute("message", "请选择一个设备类型");
			return view;
		}
		if (PublicUtil.isEmpty(device.getDeviceName())) {
			attr.addFlashAttribute("message", "请输入设备名称");
			return view;
		} else {
			device.setDeviceName(device.getDeviceName().trim());
		}
		if (PublicUtil.isEmpty(device.getDeviceSn())) {
			attr.addFlashAttribute("message", "请输入设备序列号");
			return view;
		} else {
			device.setDeviceSn(device.getDeviceSn().trim());
		}
		if (deviceService.findBySn(device.getDeviceSn()) != null) {
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
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("createVender")
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
		if (deviceService.findVenderByCode(vender.getVenderCode()) != null) {
			attr.addFlashAttribute("message", "当前供应商编码已存在");
			return view;
		}
		vender.setVenderId(PublicUtil.initId());
		vender.setCreateTime(new Date());
		vender.setCreatorId(PublicUtil.sessionUid());
		try {
			deviceService.createVender(vender);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		return "redirect:/device/create.jspx";
	}
}
