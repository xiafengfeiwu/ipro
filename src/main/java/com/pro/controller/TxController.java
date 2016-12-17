package com.pro.controller;

import java.util.Map;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pro.annotation.FormToken;
import com.pro.entity.User;
import com.pro.service.RoleService;
import com.pro.service.UserService;
import com.pro.service.WebSystemService;
import com.pro.util.PublicUtil;

@Controller
public class TxController {
	@Autowired
	WebSystemService webSystemService;
	@Autowired
	UserService userService;
	@Autowired
	RoleService roleService;

	@RequiresAuthentication
	@RequestMapping("index")
	public ModelAndView indexPage() {
		ModelAndView modelAndView = new ModelAndView("index");
		User user = userService.findById(PublicUtil.sessionUid());
		modelAndView.addObject("user", user);
		modelAndView.addObject("userRole", PublicUtil.sessionUserRole());
		modelAndView.addObject("systemInfo", webSystemService.findInfo());
		modelAndView.addObject("menuHtml", PublicUtil.initMenuHtml(roleService.findRoleMenus(user.getRoleId())));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("welcome")
	public ModelAndView welcomePage() {
		ModelAndView modelAndView = new ModelAndView("welcome");
		return modelAndView;
	}

	@RequestMapping("login")
	public ModelAndView loginPage() {
		ModelAndView modelAndView = new ModelAndView("login");
		modelAndView.addObject("systemInfo", webSystemService.findInfo());
		return modelAndView;
	}

	@RequestMapping("loginInvalid")
	public ModelAndView loginInvalidPage() {
		ModelAndView modelAndView = new ModelAndView("login_invalid");
		return modelAndView;
	}

	@ResponseBody
	@RequestMapping("loginAction")
	public Map<String, Object> loginAction(String username, String password) {
		Map<String, Object> data = PublicUtil.initMap();
		if (PublicUtil.isEmpty(username)) {
			data.put("message", "请输入登录名");
			return data;
		}
		if (PublicUtil.isEmpty(password)) {
			data.put("message", "请输入密码");
			return data;
		}
		UsernamePasswordToken token = new UsernamePasswordToken(username, PublicUtil.sha1(password));
		token.setRememberMe(true);
		Subject subject = SecurityUtils.getSubject();
		try {
			subject.login(token);
		} catch (UnknownAccountException uae) {
			data.put("message", "输入的账户不存在");
			return data;
		} catch (IncorrectCredentialsException ice) {
			data.put("message", "密码和账户不匹配");
			return data;
		} catch (DisabledAccountException dae) {
			data.put("message", "当前账户已被禁用");
			return data;
		}
		data.put("success", true);
		return data;
	}

	@RequiresAuthentication
	@RequestMapping("logout")
	public String logoutAction() {
		Subject subject = SecurityUtils.getSubject();
		subject.getSession().removeAttribute("userId");
		subject.logout();
		return "redirect:/login.jspx";
	}

	/**
	* jquery_treetable
	* 
	* 2016-12-08
	* 
	* @author SiZhongXia
	* @return
	*/
	@RequestMapping("jquery_treetable")
	public ModelAndView jqueryTreetable() {
		ModelAndView modelAndView = new ModelAndView("plugins/jquery_treetable");
		return modelAndView;
	}

	@RequestMapping("id")
	@FormToken(init = true)
	public ModelAndView idPage() {
		ModelAndView modelAndView = new ModelAndView("ids");
		modelAndView.addObject("id", PublicUtil.initId());
		return modelAndView;
	}
}