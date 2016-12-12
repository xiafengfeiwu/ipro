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

}
