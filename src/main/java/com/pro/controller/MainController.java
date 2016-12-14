package com.pro.controller;

import java.util.LinkedHashMap;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.pro.annotation.FormToken;
import com.pro.dao.WeatherCityMapper;
import com.pro.entity.WeatherCity;
import com.pro.entity.WeatherCityExample;
import com.pro.service.MenuService;
import com.pro.service.WebSystemService;
import com.pro.util.PublicUtil;

@Controller
public class MainController {

	@Autowired
	MenuService menuService;
	@Autowired
	WebSystemService webSystemService;
	@Autowired
	WeatherCityMapper weatherCityMapper;

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

		WeatherCityExample example = new WeatherCityExample();
		example.setOrderByClause("code asc");
		List<WeatherCity> cities = weatherCityMapper.selectByExample(example);

		Set<String> s1s = new LinkedHashSet<>();

		for (WeatherCity wc : cities) {
			s1s.add(wc.getProvince());
		}
		Map<String, Set<String>> m1s = new LinkedHashMap<>();
		for (String s : s1s) {
			Set<String> s2s = new LinkedHashSet<>();
			for (WeatherCity wc : cities) {
				if (wc.getProvince().equals(s)) {
					s2s.add(wc.getCity());
				}
			}
			m1s.put(s, s2s);
		}

		Set<Map<String, String>> s3s = new LinkedHashSet<>();
		StringBuffer sb = new StringBuffer();
		for (String s : m1s.keySet()) {
			sb.append( s + ":{");
			for (String k : m1s.get(s)) {
				sb.append( k + ":\"");
				StringBuffer s1 = new StringBuffer();
				for (WeatherCity wc : cities) {
					if (wc.getProvince().equals(s) && wc.getCity().equals(k)) {
						Map<String, String> map = new LinkedHashMap<>();
						map.put(wc.getCode(), wc.getCounty());
						s1.append(wc.getCounty() + "|" + wc.getCode()+",");
						s3s.add(map);
					}
				}
				sb.append(s1);
				sb.append("\",");
			}
			sb.append("},");
		}
		System.out.println(sb.toString().replaceAll(",\"", "\"").replaceAll(",}", "}"));
		return modelAndView;
	}

	@RequestMapping("default")
	@FormToken(init = true)
	public ModelAndView defaultPage() {
		ModelAndView modelAndView = new ModelAndView("default");
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