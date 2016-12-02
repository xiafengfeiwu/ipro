package com.pro.util;

import java.util.List;

import com.pro.entity.Menu;

public class PublicUtil {
	final static _Sequence sequence = new _Sequence(0, 0);

	// 初始化ID
	public static long initId() {
		return sequence.nextId();
	}

	public static String initMenuHtml(List<Menu> menus) {
		if (menus == null || menus.isEmpty()) {
			return "<!--  没有菜单数据  -->";
		}
		StringBuffer buffer = new StringBuffer("<li>");
		for (Menu menu : menus) {
			// 根节点
			if (menu.getIsRoot()) {
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
		}
		buffer.append("</li>");
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

	public static void main(String[] args) {
		System.out.println(initId());
	}

}