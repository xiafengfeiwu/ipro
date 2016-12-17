package com.pro.controller;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("user")
public class UserController {

	@RequiresAuthentication
	@RequestMapping("me")
	public ModelAndView userSelfPage() {
		ModelAndView modelAndView = new ModelAndView("user_me");
		return modelAndView;
	}
	
}
