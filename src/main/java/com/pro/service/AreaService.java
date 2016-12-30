package com.pro.service;

import java.util.List;

import com.pro.entity.Area;

public interface AreaService {
	
	// 获取根区域
	List<Area> findRoots();
	
	// 获取子区域
	List<Area> findChilds(String pcode);
}
