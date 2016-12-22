package com.pro.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.dao.WeatherAlarmMapper;
import com.pro.dao.WeatherCityMapper;
import com.pro.dao.WeatherDataMapper;
import com.pro.entity.WeatherAlarm;
import com.pro.entity.WeatherCityExample;
import com.pro.entity.WeatherData;
import com.pro.entity.WeatherDataExample;
import com.pro.model.Page;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("weather")
public class WeatherController {

	@Autowired
	WeatherCityMapper weatherCityMapper;
	@Autowired
	WeatherAlarmMapper weatherAlarmMapper;
	@Autowired
	WeatherDataMapper weatherDataMapper;

	@RequiresAuthentication
	@RequestMapping("info")
	public ModelAndView infoPage() {
		ModelAndView modelAndView = new ModelAndView("weather_info");
		WeatherCityExample example = new WeatherCityExample();
		example.setOrderByClause("spell asc");
		modelAndView.addObject("citys", weatherCityMapper.selectByExample(example));
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("releaseWarningAction")
	@RequiresPermissions("ReleaseWarning")
	public String releaseWarningAction(WeatherAlarm alarm, RedirectAttributes attr) {
		String view = "redirect:/weather/info.jspx";
		attr.addFlashAttribute("status", "danger");
		if (alarm == null) {
			attr.addFlashAttribute("message", "无效的数据");
			return view;
		}
		if (PublicUtil.isEmpty(alarm.getWeatherCityCode())) {
			attr.addFlashAttribute("message", "请选择一个城市");
			return view;
		}
		if (PublicUtil.isEmpty(alarm.getEarlyWarnLevel())) {
			attr.addFlashAttribute("message", "请选择一个预警级别");
			return view;
		}
		if (PublicUtil.isEmpty(alarm.getEarlyWarnType())) {
			attr.addFlashAttribute("message", "请选择一个预警类别");
			return view;
		}
		if (PublicUtil.isEmpty(alarm.getEarlyWarnTitle())) {
			attr.addFlashAttribute("message", "请输入预警标题");
			return view;
		} else {
			alarm.setEarlyWarnTitle(alarm.getEarlyWarnTitle().trim());
		}
		if (PublicUtil.isEmpty(alarm.getEarlyWarnTxt())) {
			attr.addFlashAttribute("message", "请输入预警内容描述");
			return view;
		} else {
			alarm.setEarlyWarnTxt(alarm.getEarlyWarnTxt().trim());
		}
		alarm.setEarlyWarnStat("预警中");
		alarm.setEarlyWarnTime(new Date());
		try {
			WeatherAlarm wa = weatherAlarmMapper.selectByPrimaryKey(alarm.getWeatherCityCode());
			if (wa == null) {
				weatherAlarmMapper.insert(alarm);
			} else {
				weatherAlarmMapper.updateByPrimaryKey(alarm);
			}
		} catch (Exception e) {
			attr.addFlashAttribute("message", "发布预警失败，请稍后重试");
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "发布预警成功");
		return view;
	}

	@ResponseBody
	@RequiresAuthentication
	@RequestMapping("weatherDataAction")
	public Map<String, Object> weatherDataAction(String cityCode) {
		Map<String, Object> data = new HashMap<>();
		WeatherDataExample example = new WeatherDataExample();
		example.createCriteria().andWeatherCityCodeEqualTo(cityCode);
		example.setOrderByClause("collect_date desc");
		example.setPage(new Page(1, 1));
		List<WeatherData> wds = weatherDataMapper.selectByExample(example);
		if (PublicUtil.isNotEmpty(wds)) {
			data.put("weather", wds.get(0));
		}
		data.put("alarm", weatherAlarmMapper.selectByPrimaryKey(cityCode));
		return data;
	}

}
