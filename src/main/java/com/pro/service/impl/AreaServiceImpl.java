package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.AreaMapper;
import com.pro.entity.Area;
import com.pro.entity.AreaExample;
import com.pro.service.AreaService;

@Service
public class AreaServiceImpl implements AreaService {

	@Autowired
	AreaMapper areaMapper;

	@Override
	public List<Area> findRoots() {
		AreaExample example = new AreaExample();
		example.createCriteria().andAreaParentCodeIsNull();
		return areaMapper.selectByExample(example);
	}

	@Override
	public List<Area> findChilds(String pcode) {
		AreaExample example = new AreaExample();
		example.createCriteria().andAreaParentCodeEqualTo(pcode);
		return areaMapper.selectByExample(example);
	}

}
