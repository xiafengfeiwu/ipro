package com.pro.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("report")
public class ReportController {

	@RequestMapping("demo")
	public ModelAndView demoPage() {
		ModelAndView modelAndView = new ModelAndView("develop/report_demo");
		return modelAndView;
	}

}
