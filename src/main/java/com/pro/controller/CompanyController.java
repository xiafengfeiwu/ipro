package com.pro.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.WebSystem;
import com.pro.service.WebSystemService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("company")
public class CompanyController {
	@Autowired
	WebSystemService webSystemService;

	@RequiresAuthentication
	@RequestMapping("info")
	public ModelAndView infoPage() {
		ModelAndView modelAndView = new ModelAndView("company_info");
		modelAndView.addObject("webSystem", webSystemService.findInfo());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateAction")
	@RequiresPermissions("UpdateCompany")
	public String resetUserStatusAction(WebSystem info, RedirectAttributes attr) {
		String view = "redirect:/company/info.jspx";
		attr.addFlashAttribute("status", "danger");
		if (info == null) {
			attr.addFlashAttribute("message", "无效的信息");
			return view;
		}
		if (PublicUtil.isEmpty(info.getSystemTitle())) {
			attr.addFlashAttribute("message", "请输入网站标题");
			return view;
		}
		if (PublicUtil.isEmpty(info.getSystemJianPin())) {
			attr.addFlashAttribute("message", "请输入网站标题简拼");
			return view;
		}
		if (PublicUtil.isEmpty(info.getSystemTechnicalSupport())) {
			attr.addFlashAttribute("message", "请输入网站技术支持");
			return view;
		}
		WebSystem webSystem = webSystemService.findInfo();
		webSystem.setSystemJianPin(info.getSystemJianPin());
		webSystem.setSystemTitle(info.getSystemTitle());
		webSystem.setSystemTechnicalSupport(info.getSystemTechnicalSupport());
		webSystem.setSystemModifyTime(new Date());
		try {
			webSystemService.update(webSystem);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "修改操作成功。");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("uploadLogo")
	@RequiresPermissions("UpdateCompany")
	public ModelAndView uploadLogoPage() {
		ModelAndView modelAndView = new ModelAndView("company_upload_logo");
		modelAndView.addObject("logoPath", webSystemService.findInfo().getSystemLogoUrl());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("uploadLogoAction")
	@RequiresPermissions("UpdateCompany")
	public String uploadLogoAction(HttpServletRequest request, @RequestParam("file") CommonsMultipartFile file, RedirectAttributes attr) throws Exception {
		String view = "redirect:/company/uploadLogo.jspx";
		attr.addFlashAttribute("status", "danger");
		if (file == null || file.getFileItem() == null || file.isEmpty()) {
			attr.addFlashAttribute("message", "未选择文件");
			return view;
		}
		if (file.getSize() > 1024 * 1024 * 1) {
			attr.addFlashAttribute("message", "图片太大了，不能超过1M");
			return view;
		}
		String fileName = file.getOriginalFilename();
		String[] f = fileName.split("[.]");
		String type = f[f.length - 1].toLowerCase();
		if (!"png".equals(type) && !"jpg".equals(type)) {
			attr.addFlashAttribute("message", "无效的图片类型");
			return view;
		}
		String name = PublicUtil.initId() + "." + type;
		String basePath = request.getSession().getServletContext().getRealPath("/") + "upload";
		DateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");
		basePath = basePath + File.separator + dateFormat.format(new Date()) + File.separator;
		File nF = new File(basePath);
		if (!nF.exists()) {
			nF.mkdirs();
		}
		BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(new File(basePath + name)));
		stream.write(file.getBytes());
		stream.close();
		WebSystem webSystem = webSystemService.findInfo();
		webSystem.setSystemLogoUrl("upload/" + dateFormat.format(new Date()) + "/" + name);
		webSystem.setSystemModifyTime(new Date());
		try {
			webSystemService.update(webSystem);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "修改失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "上传成功");
		return view;
	}
}