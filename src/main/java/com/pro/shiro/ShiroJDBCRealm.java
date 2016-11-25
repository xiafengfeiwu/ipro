package com.pro.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

public class ShiroJDBCRealm extends AuthorizingRealm {

	private static final String OR_OPERATOR = " or ";
	private static final String AND_OPERATOR = " and ";
	private static final String NOT_OPERATOR = "not ";

	/**
	 * 支持or and not 关键词 不支持and or混用
	 * 
	 * @param principals
	 * @param permission
	 * @return
	 */
	public boolean isPermitted(PrincipalCollection principals, String permission) {
		if (permission.contains(OR_OPERATOR)) {
			String[] permissions = permission.split(OR_OPERATOR);
			for (String orPermission : permissions) {
				if (isPermittedWithNotOperator(principals, orPermission)) {
					return true;
				}
			}
			return false;
		} else if (permission.contains(AND_OPERATOR)) {
			String[] permissions = permission.split(AND_OPERATOR);
			for (String orPermission : permissions) {
				if (!isPermittedWithNotOperator(principals, orPermission)) {
					return false;
				}
			}
			return true;
		} else {
			return isPermittedWithNotOperator(principals, permission);
		}
	}

	private boolean isPermittedWithNotOperator(PrincipalCollection principals, String permission) {
		if (permission.startsWith(NOT_OPERATOR)) {
			return !super.isPermitted(principals, permission.substring(NOT_OPERATOR.length()));
		} else {
			return super.isPermitted(principals, permission);
		}
	}

	/** 为当限前登录的用户授予角色和权限 */
	@Override
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
		SimpleAuthorizationInfo authorizationInfo = new SimpleAuthorizationInfo();
		return authorizationInfo;
	}

	/** 验证当前登录的用户 */
	@Override
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
		// String account = (String) token.getPrincipal();

		return null;
	}
}
