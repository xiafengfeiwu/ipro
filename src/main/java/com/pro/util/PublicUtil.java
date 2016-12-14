package com.pro.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Collection;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.pro.entity.Menu;

public class PublicUtil {
	final static _Sequence sequence = new _Sequence(0, 0);

	// 初始化ID
	public static long initId() {
		return sequence.nextId();
	}

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

	// 初始化菜单HTML
	public static String initMenuHtml(List<Menu> menus) {
		if (menus == null || menus.isEmpty()) {
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
		if (menus == null || menus.isEmpty()) {
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

	public static void main(String[] args) {
		while (true) {
			System.out.println(initId());
			try {
				Thread.sleep(13411);
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		// System.out.println(sha1("123456"));
	}
}