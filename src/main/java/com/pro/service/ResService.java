package com.pro.service;

import java.util.List;

import com.pro.entity.Res;

public interface ResService {

	// 新增资源
	void insert(Res res);

	// 新增图片
	void update(Res res);

	// 删除资源
	void delete(Long resId);

	// 通过GroupId获取所有资源
	List<Res> findResByGroupId(Long groupId);

	// 通过GroupId获取默认路径
	Res findDefaultByGroup(Long groupId);

}
