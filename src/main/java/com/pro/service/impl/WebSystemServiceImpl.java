package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.WebSystemMapper;
import com.pro.entity.WebSystem;
import com.pro.entity.WebSystemExample;
import com.pro.service.WebSystemService;

@Service
public class WebSystemServiceImpl implements WebSystemService {

	@Autowired
	WebSystemMapper webSystemMapper;

	@Override
	public WebSystem findInfo() {
		List<WebSystem> systems = webSystemMapper.selectByExample(new WebSystemExample());
		if (systems == null || systems.isEmpty()) {
			return new WebSystem();
		}
		return systems.get(0);
	}

	@Override
	public void update(WebSystem webSystem) {
		webSystemMapper.updateByExampleSelective(webSystem, new WebSystemExample());
	}

}
