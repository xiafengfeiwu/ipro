package com.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pro.service.MenuService;
import com.pro.service.WebSystemService;
import com.pro.util.PublicUtil;

@Controller
public class MainController {

	@Autowired
	MenuService menuService;
	@Autowired
	WebSystemService webSystemService;

	@RequestMapping("index")
	public ModelAndView indexPage() {
		ModelAndView modelAndView = new ModelAndView("index");

		modelAndView.addObject("menuHtml", PublicUtil.initMenuHtml(menuService.findAll()));
		modelAndView.addObject("systemInfo", webSystemService.findInfo());

		return modelAndView;
	}

	@RequestMapping("menu/{menuId}")
	public ModelAndView menu(@PathVariable(value = "menuId") Long menuId) {
		ModelAndView modelAndView = new ModelAndView();
		if (menuId == null) {
			modelAndView.setViewName("error");
		} else {
			modelAndView.setViewName("default");
			modelAndView.addObject("menuId", menuId);
		}
		return modelAndView;
	}

	@RequestMapping("resume")
	public ModelAndView resumePage() {
		ModelAndView modelAndView = new ModelAndView("resume");
		return modelAndView;
	}

}