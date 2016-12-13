package com.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pro.service.MenuService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("develop")
public class DevelopController {

	@Autowired
	MenuService menuService;

	@RequestMapping("index")
	public ModelAndView indexPage() {
		ModelAndView modelAndView = new ModelAndView("develop/index");
		modelAndView.addObject("menuNestableHtml", PublicUtil.initMenuNestableHtml(menuService.findAll()));
		return modelAndView;
	}

	@RequestMapping("subject")
	public ModelAndView subjectPage() {
		ModelAndView modelAndView = new ModelAndView("develop/subject");
		return modelAndView;
	}

	@RequestMapping("subject/create")
	public ModelAndView subjectCreatePage() {
		ModelAndView modelAndView = new ModelAndView("develop/subject_create");
		return modelAndView;
	}

	@RequestMapping("subject/detail")
	public ModelAndView subjectDetailPage() {
		ModelAndView modelAndView = new ModelAndView("develop/subject_detail");
		return modelAndView;
	}

	@RequestMapping("device")
	public ModelAndView devicePage() {
		ModelAndView modelAndView = new ModelAndView("develop/device");
		return modelAndView;
	}

	@RequestMapping("report")
	public ModelAndView reportPage() {
		ModelAndView modelAndView = new ModelAndView("develop/report");
		return modelAndView;
	}

	@RequestMapping("enterprise")
	public ModelAndView enterprisePage() {
		ModelAndView modelAndView = new ModelAndView("develop/enterprise");
		return modelAndView;
	}

	@RequestMapping("user")
	public ModelAndView userPage() {
		ModelAndView modelAndView = new ModelAndView("develop/user");
		return modelAndView;
	}

	@RequestMapping("user/create")
	public ModelAndView userCreatePage() {
		ModelAndView modelAndView = new ModelAndView("develop/user_create");
		return modelAndView;
	}

	@RequestMapping("role")
	public ModelAndView rolePage() {
		ModelAndView modelAndView = new ModelAndView("develop/role");
		return modelAndView;
	}

	@RequestMapping("role/authorize")
	public ModelAndView roleAuthorizePage() {
		ModelAndView modelAndView = new ModelAndView("develop/role_authorize");
		return modelAndView;
	}

	@RequestMapping("map")
	public ModelAndView mapPage() {
		ModelAndView modelAndView = new ModelAndView("develop/map");
		return modelAndView;
	}

	@RequestMapping("data")
	public ModelAndView dataPage() {
		ModelAndView modelAndView = new ModelAndView("develop/data");
		return modelAndView;
	}

	@RequestMapping("warn")
	public ModelAndView warnPage() {
		ModelAndView modelAndView = new ModelAndView("develop/warn");
		return modelAndView;
	}

	@RequestMapping("trend")
	public ModelAndView trendPage() {
		ModelAndView modelAndView = new ModelAndView("develop/trend");
		return modelAndView;
	}

	@RequestMapping("setup")
	public ModelAndView setupPage() {
		ModelAndView modelAndView = new ModelAndView("develop/setup");
		return modelAndView;
	}

}
