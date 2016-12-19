package com.pro.service;

import java.util.List;

import com.pro.entity.Jurisdiction;
import com.pro.entity.Menu;
import com.pro.entity.Role;
import com.pro.entity.RoleJurisdictionKey;
import com.pro.entity.RoleMenu;
import com.pro.entity.RoleMenuKey;

public interface RoleService {

	// 通过ID获取角色
	Role getById(Long roleId);

	// 创建角色
	void create(Role role);

	// 更新角色
	void update(Role role);

	// 删除角色
	void delete(Long roleId);

	// 获取所有角色
	List<Role> findAll(String searchWord, String field, String order);

	// 获取所有非系统角色
	List<Role> findNoSystemRole(String searchWord, String field, String order);

	// 获取角色所有权限字
	List<Jurisdiction> findRoleJurisdictions(Long roleId);

	// 检查角色权限字是否存在
	boolean checkRoleJurisdiction(Long roleId, Long jurisdictionId);

	// 检查角色权限字是否存在
	boolean checkRoleMenu(Long roleId, Long menuId);

	// 获取角色所有菜单
	List<Menu> findRoleMenus(Long roleId);

	// 增加角色菜单关联
	void addRoleMenu(RoleMenu roleMenu);

	// 移除角色菜单关联
	void removeRoleMenu(RoleMenuKey roleMenuKey);

	// 增加角色权限字关联
	void addRoleJurisdiction(RoleJurisdictionKey jurisdictionKey);

	// 移除角色权限字关联
	void removeRoleJurisdiction(RoleJurisdictionKey jurisdictionKey);
}
