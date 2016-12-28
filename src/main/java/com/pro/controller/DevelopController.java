package com.pro.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pro.service.MenuService;
import com.pro.util.PoiUtil;
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

	@RequestMapping("poi")
	public void poi(HttpServletRequest request, HttpServletResponse response) {
		String[] rowName = { "ID", "时间", "值", "字段1", "字段2", "字段3" };
		List<Object[]> dataList = new ArrayList<>();
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		for (int i = 0; i < 10; i++) {
			Object[] e = { i + 1, dateFormat.format(new Date()), Math.random(), Math.random(), Math.random(), Math.random() };
			dataList.add(e);
		}
		try {
			PoiUtil.downloadXlsFile(response, "统计信息表", rowName, dataList);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			System.out.println("生成失败！");
		}
	}

}
