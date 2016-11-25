package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.pro.dao.MenuMapper;
import com.pro.entity.Menu;
import com.pro.entity.MenuExample;
import com.pro.exception.DaoException;
import com.pro.service.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	MenuMapper menuMapper;

	@Override
	public Menu findById(long menuId) {
		MenuExample me = new MenuExample();
		me.createCriteria().andMenuIdEqualTo(menuId);
		List<Menu> menus = menuMapper.selectByExample(me);
		if (menus == null || menus.isEmpty()) {
			return null;
		}
		return menus.get(0);
	}

	@Override
	public List<Menu> findAll() {
		MenuExample me = new MenuExample();
		me.setOrderByClause("menu_order asc");
		return menuMapper.selectByExample(me);
	}

	@Transactional
	@Override
	public void save(Menu menu) throws DaoException {
		if (menu.getMenuPid() == null) {
			menu.setIsRoot(true);
		} else {
			Menu pmenu = findById(menu.getMenuPid());
			if (pmenu == null) {
				throw new DaoException("无效的父级菜单id");
			}
			if (!pmenu.getHasChild()) {
				pmenu.setHasChild(true);
				update(pmenu);
			}
			menu.setIsRoot(false);
		}
		menu.setHasChild(false);
		menuMapper.insert(menu);
	}

	@Override
	public void update(Menu menu) {
		menuMapper.updateByPrimaryKey(menu);
	}

	@Transactional
	@Override
	public void delete(long menuId) throws DaoException {
		Menu menu = findById(menuId);
		if (menu == null) {
			return;
		}
		if (menu.getHasChild()) {
			throw new DaoException("不能删除存在有子级菜单的菜单");
		}
		if (menu.getMenuPid() != null) {
			Menu pmenu = findById(menu.getMenuPid());
			if (pmenu == null) {
				throw new DaoException("无效的父级菜单id");
			}
			MenuExample me = new MenuExample();
			me.createCriteria().andMenuPidEqualTo(pmenu.getMenuId());
			List<Menu> menus = menuMapper.selectByExample(me);
			if (menus.size() == 1) {
				pmenu.setHasChild(false);
				menuMapper.updateByPrimaryKey(pmenu);
			}
		}
		menuMapper.deleteByPrimaryKey(menuId);
	}

}
