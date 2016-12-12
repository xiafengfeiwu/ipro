package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.MenuMapper;
import com.pro.entity.Menu;
import com.pro.entity.MenuExample;
import com.pro.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;

	@Override
	public List<Menu> findAll() {
		MenuExample me = new MenuExample();
		me.setOrderByClause("menu_order asc");
		return menuMapper.selectByExample(me);
	}

}
