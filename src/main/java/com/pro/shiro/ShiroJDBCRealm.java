package com.pro.shiro;

import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro.entity.Jurisdiction;
import com.pro.entity.Role;
import com.pro.entity.User;
import com.pro.service.RoleService;
import com.pro.service.UserService;
import com.pro.util.PublicUtil;

public class ShiroJDBCRealm extends AuthorizingRealm {

	@Autowired
	UserService userServcie;
	@Autowired
	RoleService roleService;

	/** 为当限前登录的用户授予角色和权限 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		User user = userServcie.findByLoginName(principals.getPrimaryPrincipal().toString());
		if (user == null) {
			return authorizationInfo;
		}
		Role role = roleService.getById(user.getRoleId());
		if (role == null) {
			return authorizationInfo;
		}
		Set<String> roles = new LinkedHashSet<>();
		roles.add(role.getRoleName());
		authorizationInfo.setRoles(roles);
		Set<String> permissions = new LinkedHashSet<>();
		List<Jurisdiction> jurisdictions = roleService.findRoleJurisdictions(role.getRoleId());
		if (PublicUtil.isNotEmpty(jurisdictions)) {
			for (Jurisdiction jurisdiction : jurisdictions) {
				permissions.add(jurisdiction.getJurisdictionCode());
			}
		}
		authorizationInfo.setStringPermissions(permissions);
		return authorizationInfo;
	}

	/** 验证当前登录的用户 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		String loginName = (String) token.getPrincipal();
		User user = userServcie.findByLoginName(loginName);
		if (user == null) {
			throw new UnknownAccountException();
		}
		if (user.getUserDisableStatus()) {
			throw new DisabledAccountException();
		}
		Role role = roleService.getById(user.getRoleId());
		if (role == null) {
			throw new DisabledAccountException();
		}
		AuthenticationInfo authcInfo = new SimpleAuthenticationInfo(loginName, user.getUserPassword(), user.getUserName());
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		session.setAttribute("userId", user.getUserId());
		session.setAttribute("userRole", role.getRoleName());
		return authcInfo;
	}
}
