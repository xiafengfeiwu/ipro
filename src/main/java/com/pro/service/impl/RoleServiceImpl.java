package com.pro.service.impl;

import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.JurisdictionMapper;
import com.pro.dao.MenuMapper;
import com.pro.dao.RoleJurisdictionMapper;
import com.pro.dao.RoleMapper;
import com.pro.dao.RoleMenuMapper;
import com.pro.entity.Jurisdiction;
import com.pro.entity.JurisdictionExample;
import com.pro.entity.Menu;
import com.pro.entity.MenuExample;
import com.pro.entity.Role;
import com.pro.entity.RoleExample;
import com.pro.entity.RoleJurisdictionExample;
import com.pro.entity.RoleJurisdictionKey;
import com.pro.entity.RoleMenu;
import com.pro.entity.RoleMenuExample;
import com.pro.entity.RoleMenuKey;
import com.pro.service.RoleService;
import com.pro.util.PublicUtil;

@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	RoleMapper roleMapper;
	@Autowired
	RoleMenuMapper roleMenuMapper;
	@Autowired
	MenuMapper menuMapper;
	@Autowired
	RoleJurisdictionMapper roleJurisdictionMapper;
	@Autowired
	JurisdictionMapper jurisdictionMapper;

	@Override
	public Role getById(Long roleId) {
		return roleMapper.selectByPrimaryKey(roleId);
	}

	@Override
	public void create(Role role) {
		roleMapper.insert(role);
	}

	@Override
	public void update(Role role) {
		roleMapper.updateByPrimaryKey(role);
	}

	@Override
	public void delete(Long roleId) {
		roleMapper.deleteByPrimaryKey(roleId);
	}

	@Override
	public List<Role> findAll(String searchWord, String field, String order) {
		RoleExample example = new RoleExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			example.createCriteria().andRoleNameLike("%" + searchWord + "%");
		}
		if (PublicUtil.isNotEmpty(field) && PublicUtil.isNotEmpty(order)) {
			example.setOrderByClause(field + " " + order);
		}
		return roleMapper.selectByExample(example);
	}

	@Override
	public List<Role> findNoSystemRole(String searchWord, String field, String order) {
		RoleExample example = new RoleExample();
		com.pro.entity.RoleExample.Criteria criteria = example.createCriteria().andSystemRoleEqualTo(false);
		if (PublicUtil.isNotEmpty(searchWord)) {
			criteria.andRoleNameLike("%" + searchWord + "%");
		}
		if (PublicUtil.isNotEmpty(field) && PublicUtil.isNotEmpty(order)) {
			example.setOrderByClause(field + " " + order);
		}
		return roleMapper.selectByExample(example);
	}

	@Override
	public List<Jurisdiction> findRoleJurisdictions(Long roleId) {
		RoleJurisdictionExample example = new RoleJurisdictionExample();
		example.createCriteria().andRoleIdEqualTo(roleId);
		List<RoleJurisdictionKey> jurisdictions = roleJurisdictionMapper.selectByExample(example);
		if (PublicUtil.isEmpty(jurisdictions)) {
			return null;
		}
		List<Long> juids = new LinkedList<>();
		for (RoleJurisdictionKey key : jurisdictions) {
			juids.add(key.getJurisdictionId());
		}
		JurisdictionExample example2 = new JurisdictionExample();
		example2.createCriteria().andJurisdictionIdIn(juids);
		List<Jurisdiction> list = jurisdictionMapper.selectByExample(example2);
		return list;
	}

	@Override
	public boolean checkRoleJurisdiction(Long roleId, Long jurisdictionId) {
		RoleJurisdictionExample example = new RoleJurisdictionExample();
		example.createCriteria().andJurisdictionIdEqualTo(jurisdictionId).andRoleIdEqualTo(roleId);
		List<RoleJurisdictionKey> roleJurisdictions = roleJurisdictionMapper.selectByExample(example);
		return PublicUtil.isNotEmpty(roleJurisdictions);
	}

	@Override
	public boolean checkRoleMenu(Long roleId, Long menuId) {
		RoleMenuKey key = new RoleMenuKey();
		key.setRoleId(roleId);
		key.setMenuId(menuId);
		return null != roleMenuMapper.selectByPrimaryKey(key);
	}

	@Override
	public List<Menu> findRoleMenus(Long roleId) {
		RoleMenuExample example = new RoleMenuExample();
		example.createCriteria().andRoleIdEqualTo(roleId);
		List<RoleMenu> menus = roleMenuMapper.selectByExample(example);
		if (PublicUtil.isEmpty(menus)) {
			return null;
		}
		List<Long> menuids = new LinkedList<>();
		for (RoleMenu key : menus) {
			menuids.add(key.getMenuId());
			menuids.add(key.getMenuPid());
		}
		MenuExample example2 = new MenuExample();
		example2.createCriteria().andMenuIdIn(menuids);
		return menuMapper.selectByExample(example2);
	}

	@Override
	public void addRoleMenu(RoleMenu roleMenu) {
		roleMenuMapper.insert(roleMenu);
	}

	@Override
	public void removeRoleMenu(RoleMenuKey roleMenuKey) {
		roleMenuMapper.deleteByPrimaryKey(roleMenuKey);
	}

	@Override
	public void addRoleJurisdiction(RoleJurisdictionKey jurisdictionKey) {
		roleJurisdictionMapper.insert(jurisdictionKey);
	}

	@Override
	public void removeRoleJurisdiction(RoleJurisdictionKey jurisdictionKey) {
		roleJurisdictionMapper.deleteByPrimaryKey(jurisdictionKey);
	}

}
