package com.pro.controller;

import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pro.entity.User;
import com.pro.service.UserServcie;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("data")
public class DataController {

	@Autowired
	UserServcie userServcie;

	@ResponseBody
	@RequestMapping("findUserTop5")
	public Map<String, Object> findUsersTop5(String query) {
		Map<String, Object> map = new HashMap<>();
		List<User> users = userServcie.getTop5BySearchWord(query);
		List<Map<String, Object>> list = new LinkedList<>();
		if (PublicUtil.isNotEmpty(users)) {
			for (User user : users) {
				Map<String, Object> data = new HashMap<>();
				data.put("value", user.getUserName() + " (" + user.getUserPhone() + ")");
				data.put("data", user.getUserId());
				list.add(data);
			}
		}
		map.put("query", query);
		map.put("suggestions", list);
		return map;
	}

}