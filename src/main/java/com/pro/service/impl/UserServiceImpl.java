package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.UserMapper;
import com.pro.entity.User;
import com.pro.entity.UserExample;
import com.pro.model.Page;
import com.pro.service.UserService;
import com.pro.util.PublicUtil;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public User findByLoginName(String loginName) {
		UserExample example = new UserExample();
		example.createCriteria().andUserLoginNameEqualTo(loginName);
		List<User> users = userMapper.selectByExample(example);
		if (users == null || users.isEmpty()) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public User findByPhoneNo(String phoneNo) {
		UserExample example = new UserExample();
		example.createCriteria().andUserPhoneEqualTo(phoneNo);
		List<User> users = userMapper.selectByExample(example);
		if (users == null || users.isEmpty()) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public User findById(Long userId) {
		return userMapper.selectByPrimaryKey(userId);
	}

	@Override
	public User findUserByWxOpenId(String openId) {
		UserExample example = new UserExample();
		example.createCriteria().andUserWxOpenIdEqualTo(openId);
		List<User> users = userMapper.selectByExample(example);
		if (users == null || users.isEmpty()) {
			return null;
		}
		return users.get(0);
	}

	@Override
	public List<User> getTop5BySearchWord(String searchWord) {
		UserExample example = new UserExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andUserNameLike(searchWord);
			example.or().andUserLoginNameLike(searchWord);
			example.or().andUserNamePyLike(searchWord);
			example.or().andUserPhoneLike(searchWord);
		}
		example.setOrderByClause("user_name asc");
		example.setPage(new Page(1, 5));
		return userMapper.selectByExample(example);
	}

	@Override
	public Long getUserCount(String searchWord) {
		UserExample example = new UserExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andUserNameLike(searchWord);
			example.or().andUserLoginNameLike(searchWord);
			example.or().andUserNamePyLike(searchWord);
			example.or().andUserPhoneLike(searchWord);
		}
		return userMapper.countByExample(example);
	}

	@Override
	public List<User> getUserData(String searchWord, String field, String order, int page, int length) {
		UserExample example = new UserExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andUserNameLike(searchWord);
			example.or().andUserLoginNameLike(searchWord);
			example.or().andUserNamePyLike(searchWord);
			example.or().andUserPhoneLike(searchWord);
		}
		if (PublicUtil.isNotEmpty(field) && PublicUtil.isNotEmpty(order)) {
			example.setOrderByClause(field + " " + order);
		}
		example.setPage(new Page(page, length));
		return userMapper.selectByExample(example);
	}

	@Override
	public void regist(User user) {
		userMapper.insert(user);
	}

	@Override
	public void update(User user) {
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public void delete(Long userId) {
		userMapper.deleteByPrimaryKey(userId);
	}

}
