package com.pro.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;

import com.github.stuxuhai.jpinyin.PinyinException;
import com.github.stuxuhai.jpinyin.PinyinFormat;
import com.github.stuxuhai.jpinyin.PinyinHelper;
import com.pro.entity.Menu;

public class PublicUtil {
	final static _Sequence sequence = new _Sequence(0, 0);

	// 初始化ID
	public static long initId() {
		return sequence.nextId();
	}

	// 初始化MAP
	public static Map<String, Object> initMap() {
		Map<String, Object> map = new HashMap<>();
		map.put("success", false);
		return map;
	}

	// 获取Session用户ID
	public static Long sessionUid() {
		Subject subject = SecurityUtils.getSubject();
		Object userId = subject.getSession().getAttribute("userId");
		if (userId == null) {
			return null;
		}
		return new Long(userId.toString());
	}

	// 获取Session用户角色名称
	public static String sessionUserRole() {
		Subject subject = SecurityUtils.getSubject();
		Object userRole = subject.getSession().getAttribute("userRole");
		if (userRole == null) {
			return null;
		}
		return userRole.toString();
	}

	// 判断对象是否为空
	public static boolean isEmpty(Object obj) {
		if (obj == null) {
			return true;
		}
		if (obj instanceof String) {
			if ("".equals(((String) obj).trim())) {
				return true;
			}
		}
		if (obj instanceof Collection<?>) {
			return ((Collection<?>) obj).isEmpty();
		}
		return false;
	}

	// 判断对象是否不为空
	public static boolean isNotEmpty(Object obj) {
		return !isEmpty(obj);
	}

	// 获取访问者IP地址
	public static String getIP(HttpServletRequest request) {
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("PRoxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip)) {
			ip = request.getRemoteAddr();
		}
		return ip;
	}

	// 判断是否是登录名称
	public static boolean isLoginName(String loginName) {
		if (isEmpty(loginName)) {
			return false;
		}
		Pattern regex = Pattern.compile("^\\w{2,20}$");
		Matcher matcher = regex.matcher(loginName);
		return matcher.matches();
	}

	// 判断是否是手机号
	public static boolean isPhoneNo(String phoneNo) {
		if (isEmpty(phoneNo)) {
			return false;
		}
		Pattern regex = Pattern.compile("^1\\d{10}$");
		Matcher matcher = regex.matcher(phoneNo);
		return matcher.matches();
	}

	// 判断是否是密码
	public static boolean isPassword(String password) {
		if (isEmpty(password)) {
			return false;
		}
		Pattern regex = Pattern.compile("^\\w{6,20}$");
		Matcher matcher = regex.matcher(password);
		return matcher.matches();
	}

	// 初始化菜单HTML
	public static String initMenuHtml(List<Menu> menus) {
		if (PublicUtil.isEmpty(menus)) {
			return "<!--  没有菜单数据  -->";
		}
		StringBuffer buffer = new StringBuffer();
		for (Menu menu : menus) {
			// 根节点
			if (menu.getIsRoot()) {
				buffer.append("<li>");
				// 有子节点
				if (menu.getHasChild()) {
					buffer.append("<a href=\"javascript:;\"><i class=\"" + menu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + menu.getMenuName() + "</span><span class=\"fa arrow\"></span></a>");
					buffer.append("<ul class=\"nav nav-second-level\">");
					for (Menu rootChildMenu : menus) {
						// 子节点
						if (menu.getMenuId().equals(rootChildMenu.getMenuPid())) {
							// 有三级节点
							if (rootChildMenu.getHasChild()) {
								buffer.append("<li><a href=\"javascript:;\"><i class=\"" + rootChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + rootChildMenu.getMenuName() + "</span><span class=\"fa arrow\"></span></a><ul class=\"nav nav-third-level\">");
								for (Menu secondChildMenu : menus) {
									// 三级节点
									if (rootChildMenu.getMenuId().equals(secondChildMenu.getMenuPid())) {
										buffer.append("<li><a href=\"" + secondChildMenu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + secondChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + secondChildMenu.getMenuName() + "</span></a></li>");
									}
								}
								buffer.append("</ul></li>");
							} else {
								buffer.append("<li><a href=\"" + rootChildMenu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + rootChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + rootChildMenu.getMenuName() + "</span></a></li>");
							}
						}
					}
					buffer.append("</ul>");
				} else {
					buffer.append("<a href=\"" + menu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + menu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + menu.getMenuName() + "</span></a>");
				}
			}
			buffer.append("</li>");
		}
		return buffer.toString();
	}

	public static String initMenuNestableHtml(List<Menu> menus) {
		if (PublicUtil.isEmpty(menus)) {
			return "<!--  没有菜单数据  -->";
		}
		StringBuffer buffer = new StringBuffer("<div class=\"dd\" id=\"menu-nestable\"><ol class=\"dd-list\">");
		for (Menu menu : menus) {
			// 根节点
			if (menu.getIsRoot()) {
				buffer.append("<li class=\"dd-item\" data-id=\"" + menu.getMenuId() + "\"><div class=\"dd-handle\"><span class=\"label label-info\"><i class=\"" + menu.getMenuIcon() + "\"></i></span> " + menu.getMenuName() + " </div>");
				// 有子节点
				if (menu.getHasChild()) {
					buffer.append("<ol class=\"dd-list\">");
					for (Menu rootChildMenu : menus) {
						// 子节点
						if (menu.getMenuId().equals(rootChildMenu.getMenuPid())) {
							// 有三级节点
							if (rootChildMenu.getHasChild()) {
								buffer.append("<li class=\"dd-item\" data-id=\"" + rootChildMenu.getMenuId() + "\"><div class=\"dd-handle\"><span class=\"label label-info\"><i class=\"" + rootChildMenu.getMenuIcon() + "\"></i></span> " + rootChildMenu.getMenuName() + " </div>");
								for (Menu secondChildMenu : menus) {
									buffer.append("<ol class=\"dd-list\">");
									// 三级节点
									if (rootChildMenu.getMenuId().equals(secondChildMenu.getMenuPid())) {
										buffer.append("<li class=\"dd-item\" data-id=\"" + secondChildMenu.getMenuId() + "\"><div class=\"dd-handle\"><span class=\"label label-info\"><i class=\"" + secondChildMenu.getMenuIcon() + "\"></i></span> " + secondChildMenu.getMenuName() + " </div></li>");
									}
									buffer.append("</ol>");
								}
								buffer.append("</li>");
							}
						}
					}
					buffer.append("</ol>");
				}
				buffer.append("</li>");
			}
		}
		buffer.append("</ol></div>");
		return buffer.toString();
	}

	// SHA1加密
	public static String sha1(String decript) {
		MessageDigest digest = null;
		try {
			digest = MessageDigest.getInstance("SHA-1");
		} catch (NoSuchAlgorithmException e) {
			return null;
		}
		digest.update(decript.getBytes());
		byte messageDigest[] = digest.digest();
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < messageDigest.length; i++) {
			String shaHex = Integer.toHexString(messageDigest[i] & 0xFF);
			if (shaHex.length() < 2)
				hexString.append(0);
			hexString.append(shaHex);
		}
		return hexString.toString();
	}

	public static String getStringPy(String str) {
		if (isEmpty(str)) {
			return "";
		}
		try {
			String all = PinyinHelper.convertToPinyinString(str, "", PinyinFormat.WITHOUT_TONE);
			String jp = PinyinHelper.getShortPinyin(str);
			return jp + ";" + all;
		} catch (PinyinException e) {
			return "";
		}
	}

	public static boolean isNumber(String str) {
		if (isEmpty(str)) {
			return false;
		}
		Pattern regex = Pattern.compile("^(-?\\d+)(\\.\\d+)?$");
		Matcher matcher = regex.matcher(str);
		return matcher.matches();
	}

	public static void main(String[] args) {
		// while (true) {
		// System.out.println(initId());
		// try {
		// Thread.sleep(13411);
		// } catch (InterruptedException e) {
		// // TODO Auto-generated catch block
		// e.printStackTrace();
		// }
		// }
		System.out.println(isNumber("太行山hang"));
		System.out.println(isNumber("11.23"));
		System.out.println(isNumber("-120.23"));
		System.out.println(isNumber("0"));
	}
}