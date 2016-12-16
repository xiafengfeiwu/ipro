package com.pro.service;

import java.util.List;

import com.pro.entity.User;

public interface UserService {
	// 通过登录名查询用户
	User findByLoginName(String loginName);

	// 通过手机号查询用户
	User findByPhoneNo(String phoneNo);

	// 通过用户ID获取用户
	User findById(Long userId);

	// 通过微信OpenId获取用户
	User findUserByWxOpenId(String openId);
	
	// 分页获取用户数据
	List<User> getTop5BySearchWord(String searchWord);

	// 通过查询条件关键字获取用户数量
	Long getUserCount(String searchWord);

	// 分页获取用户数据
	List<User> getUserData(String searchWord, String field, String order, int page, int length);

	// 注册用户（新增用户）
	void regist(User user);

	// 更新用户
	void update(User user);

	// 删除用户
	void delete(Long userId);
}
