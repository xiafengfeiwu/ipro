package com.pro.service;

import java.util.List;

import com.pro.entity.Menu;

public interface MenuService {
	// 获取所有菜单
	List<Menu> findAll();
}
