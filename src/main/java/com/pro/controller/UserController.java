package com.pro.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.User;
import com.pro.model.RequestPage;
import com.pro.service.RoleService;
import com.pro.service.UserService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	@RequiresAuthentication
	@RequestMapping("list")
	public ModelAndView listPage() {
		ModelAndView modelAndView = new ModelAndView("user_list");
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
		long count = userService.getUserCount(reqPage.getSearchWord());
		data.put("count", count);
		if (count > 0) {
			List<User> list = userService.getUserData(reqPage.getSearchWord(), reqPage.getField(), reqPage.getOrder(), reqPage.getPage(), reqPage.getLength());
			data.put("data", list);
		}
		return data;
	}

	@RequiresAuthentication
	@RequestMapping("me")
	public ModelAndView userSelfPage() {
		ModelAndView modelAndView = new ModelAndView("user_me");
		User user = userService.findById(PublicUtil.sessionUid());
		modelAndView.addObject("user", user);
		modelAndView.addObject("userRole", PublicUtil.sessionUserRole());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelf")
	public ModelAndView changeSelfPage() {
		ModelAndView modelAndView = new ModelAndView("user_change_self");
		User user = userService.findById(PublicUtil.sessionUid());
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelfAction")
	public String changeSelfAction(@ModelAttribute("user") User user, RedirectAttributes attr) {
		String view = "redirect:/user/changeSelf.jspx";
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(user.getUserName()) || user.getUserName().length() > 20) {
			attr.addFlashAttribute("message", "无效的用户名称");
			return view;
		}
		if (!PublicUtil.isLoginName(user.getUserLoginName())) {
			attr.addFlashAttribute("message", "无效的登录账号");
			return view;
		}
		if (!PublicUtil.isPhoneNo(user.getUserPhone())) {
			attr.addFlashAttribute("message", "无效的手机号码");
			return view;
		}
		Long currentUserId = PublicUtil.sessionUid();
		User qU = userService.findByLoginName(user.getUserLoginName());
		if (qU != null && !qU.getUserId().equals(currentUserId)) {
			attr.addFlashAttribute("message", "当前登录账号已存在");
			return view;
		}
		qU = userService.findByPhoneNo(user.getUserPhone());
		if (qU != null && !qU.getUserId().equals(currentUserId)) {
			attr.addFlashAttribute("message", "当前手机号码已存在");
			return view;
		}
		if (qU == null) {
			qU = userService.findById(currentUserId);
		}
		qU.setUserName(user.getUserName().trim());
		qU.setUserNamePy(PublicUtil.getStringPy(qU.getUserName()));
		qU.setUserLoginName(user.getUserLoginName().trim());
		qU.setUserPhone(user.getUserPhone().trim());
		qU.setUserModifyTime(new Date());
		try {
			userService.update(qU);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "修改失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "修改成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelfPwd")
	public ModelAndView changeSelfPwdPage() {
		ModelAndView modelAndView = new ModelAndView("user_change_self_pwd");
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelfPwdAction")
	public String changeSelfPwdAction(@ModelAttribute("userYsPwd") String userYsPwd, @ModelAttribute("userNewPwd") String userNewPwd, @ModelAttribute("userReNewPwd") String userReNewPwd, RedirectAttributes attr) {
		String view = "redirect:/user/changeSelfPwd.jspx";
		attr.addFlashAttribute("status", "danger");
		if (!PublicUtil.isPassword(userYsPwd)) {
			attr.addFlashAttribute("message", "无效的原密码");
			return view;
		}
		if (!PublicUtil.isPassword(userNewPwd)) {
			attr.addFlashAttribute("message", "无效的新密码");
			return view;
		}
		if (!userNewPwd.equals(userReNewPwd)) {
			attr.addFlashAttribute("message", "新密码两次输入不一致");
			return view;
		}
		User user = userService.findById(PublicUtil.sessionUid());
		if (!user.getUserPassword().equals(PublicUtil.sha1(userYsPwd))) {
			attr.addFlashAttribute("message", "原密码输入不正确");
			return view;
		}
		user.setUserPassword(PublicUtil.sha1(userNewPwd));
		user.setUserModifyTime(new Date());
		try {
			userService.update(user);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "修改失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "修改成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelfHeadPic")
	public ModelAndView changeSelfHeadPicPage() {
		ModelAndView modelAndView = new ModelAndView("user_change_self_headpic");
		User user = userService.findById(PublicUtil.sessionUid());
		modelAndView.addObject("userHeadPic", user.getUserPortraitPath());
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("changeSelfHeadPicAction")
	public String changeSelfHeadPicAction(HttpServletRequest request, @RequestParam("file") CommonsMultipartFile file, RedirectAttributes attr) throws Exception {
		String view = "redirect:/user/changeSelfHeadPic.jspx";
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
		User user = userService.findById(PublicUtil.sessionUid());
		user.setUserPortraitPath("upload/" + dateFormat.format(new Date()) + "/" + name);
		user.setUserModifyTime(new Date());
		try {
			userService.update(user);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "修改失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "上传成功");
		return view;
	}

}
