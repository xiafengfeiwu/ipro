package com.pro.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.Role;
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
		if (count > 0) {
			data.put("totalPages", (int) ((count + reqPage.getLength() - 1) / reqPage.getLength()));
			List<User> list = userService.getUserData(reqPage.getSearchWord(), reqPage.getField(), reqPage.getOrder(), reqPage.getPage(), reqPage.getLength());
			List<Map<String, Object>> listData = new LinkedList<>();
			for (User user : list) {
				Map<String, Object> userData = new HashMap<>();
				userData.put("userId", user.getUserId().toString());
				userData.put("userLoginName", user.getUserLoginName());
				userData.put("userName", user.getUserName());
				userData.put("userPhone", user.getUserPhone());
				userData.put("userHeadPic", user.getUserPortraitPath());
				userData.put("userDisableStatus", user.getUserDisableStatus());
				userData.put("userRegistTime", user.getUserRegistTime());
				listData.add(userData);
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
	@RequiresPermissions("CreateUser")
	public ModelAndView createPage() {
		ModelAndView modelAndView = new ModelAndView("user_create");
		List<Role> roles = roleService.findAll(null, null, null);
		Subject subject = SecurityUtils.getSubject();
		if (!subject.isPermitted("AllotAllRole")) {
			Role removeRole = null;
			for (Role r : roles) {
				// Administrator
				if (r.getRoleId().equals(809601566439899136l)) {
					removeRole = r;
					break;
				}
			}
			roles.remove(removeRole);
		}
		modelAndView.addObject("roles", roles);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("createAction")
	@RequiresPermissions("CreateUser")
	public String createAction(User user, RedirectAttributes attr) {
		String view = "redirect:/user/create.jspx";
		attr.addFlashAttribute("status", "danger");
		if (user == null) {
			attr.addFlashAttribute("message", "无效的数据");
			return view;
		}
		if (PublicUtil.isEmpty(user.getUserName())) {
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "无效的用户名称");
			return view;
		} else {
			user.setUserName(user.getUserName().trim());
		}
		if (!PublicUtil.isLoginName(user.getUserLoginName())) {
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "无效的登录名");
			return view;
		}
		if (!PublicUtil.isPhoneNo(user.getUserPhone())) {
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "无效的手机号");
			return view;
		}
		if (user.getRoleId() == null || user.getRoleId() == 0l) {
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "请选择一个的用户角色");
			return view;
		}
		if (userService.findByLoginName(user.getUserLoginName()) != null) {
			user.setUserLoginName("");
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "当前登录名称已存在");
			return view;
		}
		if (userService.findByPhoneNo(user.getUserPhone()) != null) {
			user.setUserPhone("");
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "当前手机号已存在");
			return view;
		}
		user.setUserId(PublicUtil.initId());
		user.setUserNamePy(PublicUtil.getStringPy(user.getUserName()));
		user.setUserDisableStatus(false);
		user.setUserPassword(PublicUtil.sha1("123456"));
		user.setUserPortraitPath("resources/img/default_head_124x124.png");
		user.setUserWxOpenId(null);
		user.setUserRegistTime(new Date());
		user.setUserModifyTime(new Date());
		try {
			userService.regist(user);
		} catch (Exception e) {
			attr.addFlashAttribute("user", user);
			attr.addFlashAttribute("message", "新增失败，请稍候重试！");
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "新增成功");
		return view;
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
	@RequestMapping("detail")
	public ModelAndView detailPage(Long userId) {
		ModelAndView modelAndView = new ModelAndView("user_detail");
		User user = userService.findById(userId);
		if (user == null) {
			return modelAndView;
		}
		Role role = roleService.getById(user.getRoleId());
		if (!"Administrator".equals(role.getRoleName())) {
			modelAndView.addObject("showDelBtn", true);
		}
		modelAndView.addObject("roleName", role.getRoleName());
		modelAndView.addObject("user", user);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserPw")
	@RequiresPermissions("ReSetUserPwd")
	public ModelAndView resetUserPwPage(Long userId) {
		ModelAndView modelAndView = new ModelAndView("user_reset_password");
		User user = userService.findById(userId);
		if (user != null) {
			modelAndView.addObject("userName", user.getUserName());
			modelAndView.addObject("userPhone", user.getUserPhone());
			modelAndView.addObject("userId", userId);
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserPwAction")
	@RequiresPermissions("ReSetUserPwd")
	public String resetUserPwAction(Long userId, RedirectAttributes attr) {
		String view = "redirect:/user/resetUserPw.jspx?userId=" + userId;
		attr.addFlashAttribute("status", "danger");
		User user = userService.findById(userId);
		user.setUserPassword(PublicUtil.sha1("123456"));
		user.setUserModifyTime(new Date());
		try {
			userService.update(user);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "密码重设成功。");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("delete")
	@RequiresPermissions("DeleteUser")
	public ModelAndView deletePage(Long userId) {
		ModelAndView modelAndView = new ModelAndView("user_delete");
		User user = userService.findById(userId);
		if (user != null) {
			modelAndView.addObject("userName", user.getUserName());
			modelAndView.addObject("userPhone", user.getUserPhone());
			modelAndView.addObject("userId", userId);
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteAction")
	@RequiresPermissions("DeleteUser")
	public String deleteAction(Long userId, RedirectAttributes attr) {
		String view = "redirect:/user/delete.jspx?userId=" + userId;
		attr.addFlashAttribute("status", "danger");
		try {
			userService.delete(userId);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "删除失败，可能用户有关联数据，建议禁用账号！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功。");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserStatus")
	@RequiresPermissions("UpdateUser")
	public ModelAndView resetUserStatusPage(Long userId) {
		ModelAndView modelAndView = new ModelAndView("user_reset_status");
		User user = userService.findById(userId);
		if (user != null) {
			modelAndView.addObject("userName", user.getUserName());
			modelAndView.addObject("userPhone", user.getUserPhone());
			modelAndView.addObject("statusText", user.getUserDisableStatus() ? "启用" : "禁用");
			modelAndView.addObject("userId", userId);
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserStatusAction")
	@RequiresPermissions("UpdateUser")
	public String resetUserStatusAction(Long userId, RedirectAttributes attr) {
		String view = "redirect:/user/resetUserStatus.jspx?userId=" + userId;
		attr.addFlashAttribute("status", "danger");
		User user = userService.findById(userId);
		user.setUserDisableStatus(!user.getUserDisableStatus());
		user.setUserModifyTime(new Date());
		try {
			userService.update(user);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", (!user.getUserDisableStatus() ? "启用" : "禁用") + " 账号操作成功。");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserRole")
	@RequiresPermissions("UserRoleAuth")
	public ModelAndView resetUserRolePage(Long userId) {
		ModelAndView modelAndView = new ModelAndView("user_reset_role");
		User user = userService.findById(userId);
		if (user != null) {
			List<Role> roles = roleService.findAll(null, null, null);
			Subject subject = SecurityUtils.getSubject();
			if (!subject.isPermitted("AllotAllRole")) {
				Role removeRole = null;
				for (Role r : roles) {
					// Administrator
					if (r.getRoleId().equals(809601566439899136l)) {
						removeRole = r;
						break;
					}
				}
				roles.remove(removeRole);
			}
			modelAndView.addObject("roles", roles);
			modelAndView.addObject("userName", user.getUserName());
			modelAndView.addObject("userPhone", user.getUserPhone());
			modelAndView.addObject("userId", userId);
			modelAndView.addObject("currentRoleId", user.getRoleId());
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("resetUserRoleAction")
	@RequiresPermissions("UserRoleAuth")
	public String resetUserRoleAction(Long userId, Long roleId, RedirectAttributes attr) {
		String view = "redirect:/user/resetUserRole.jspx?userId=" + userId;
		attr.addFlashAttribute("status", "danger");
		User user = userService.findById(userId);
		user.setRoleId(roleId);
		user.setUserModifyTime(new Date());
		try {
			userService.update(user);
		} catch (Exception e) {
			attr.addFlashAttribute("message", "操作失败，请稍候重试！");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "更改用户角色成功。");
		return view;
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
