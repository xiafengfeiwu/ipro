package com.pro.service;

import java.util.List;

import com.pro.entity.Menu;
import com.pro.exception.DaoException;

public interface MenuService {

	List<Menu> findAll();

	Menu findById(long menuId);

	void save(Menu menu) throws DaoException;

	void update(Menu menu);

	void delete(long menuId) throws DaoException;
}
