package com.pro.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pro.annotation.FormToken;
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

	@RequestMapping("welcome")
	public ModelAndView resumePage() {
		ModelAndView modelAndView = new ModelAndView("welcome");
		return modelAndView;
	}

	@RequestMapping("form")
	@FormToken(init = true)
	public ModelAndView formPage() {
		ModelAndView modelAndView = new ModelAndView("form");
		return modelAndView;
	}

	@RequestMapping(value = "dealwith", method = RequestMethod.POST)
	@FormToken(check = true)
	public String dealwithAction(String username) {
		System.out.println(username);
		return "redirect:/form.jspx";
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
}