package com.pro.service;

import com.pro.entity.WebSystem;

public interface WebSystemService {
	// 获取系统描述
	WebSystem findInfo();
	// 更新系统描述
	void update(WebSystem webSystem);
}
