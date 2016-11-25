package com.pro.util;

import java.util.List;

import com.pro.entity.Menu;

public class PublicUtil {
	final static _Sequence sequence = new _Sequence(0, 0);

	// 初始化ID
	public static long initId() {
		return sequence.nextId();
	}
	/* 

	
	
				<li>
					<a class="J_menuItem" href="http://www.soso.com">
						<i class="fa fa-flask"></i>
						<span class="nav-label">三级菜单</span>
					</a>
				</li>
	

	 */
	public static String initMenuHtml(List<Menu> menus) {
		if (menus == null || menus.isEmpty()) {
			return "<!--  没有菜单数据  -->";
		}
		// List<MenuRel> menuRels = new ArrayList<>();
		StringBuffer buffer = new StringBuffer("<li>");
		for (Menu menu : menus) {
			// 根节点
			if (menu.getIsRoot()) {
				// 设置根节点关联
				//MenuRel menuRel = new MenuRel();
				//menuRel.setMenu(menu);
				// 有子节点
				if (menu.getHasChild()) {
					buffer.append("<a href=\"javascript:;\"><i class=\"" + menu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + menu.getMenuName() + "</span><span class=\"fa arrow\"></span></a>");
					// 存放子节点
					//List<MenuRel> rootChildMenuRels = new ArrayList<>();
					buffer.append("<ul class=\"nav nav-second-level\">");
					for (Menu rootChildMenu : menus) {
						// 子节点
						if (menu.getMenuId().equals(rootChildMenu.getMenuPid())) {
							// 子节点
							//MenuRel roodChildMenuRel = new MenuRel();
							//roodChildMenuRel.setMenu(rootChildMenu);
							// 有三级节点
							if (rootChildMenu.getHasChild()) {
								buffer.append("<li><a href=\"javascript:;\"><i class=\"" + rootChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + rootChildMenu.getMenuName() + "</span><span class=\"fa arrow\"></span></a><ul class=\"nav nav-third-level\">");
								// 存放三级节点数据
								//List<MenuRel> secondChildMenuRels = new ArrayList<>();
								for (Menu secondChildMenu : menus) {
									// 三级节点
									if (rootChildMenu.getMenuId().equals(secondChildMenu.getMenuPid())) {
										//MenuRel secondChildMenuRel = new MenuRel();
										//secondChildMenuRel.setMenu(secondChildMenu);
										//secondChildMenuRels.add(secondChildMenuRel);
										buffer.append("<li><a href=\"" + secondChildMenu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + secondChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + secondChildMenu.getMenuName() + "</span></a></li>");
									}
								}
								buffer.append("</ul></li>");
								//roodChildMenuRel.setMenuRels(secondChildMenuRels);
							} else {
								buffer.append("<li><a href=\"" + rootChildMenu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + rootChildMenu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + rootChildMenu.getMenuName() + "</span></a></li>");
							}
							//rootChildMenuRels.add(roodChildMenuRel);
						}
					}
					buffer.append("</ul>");
					//menuRel.setMenuRels(rootChildMenuRels);
				} else {
					buffer.append("<a href=\"" + menu.getMenuUrl() + "\" class=\"J_menuItem\"><i class=\"" + menu.getMenuIcon() + "\"></i><span class=\"nav-label\">" + menu.getMenuName() + "</span></a>");
				}
				//menuRels.add(menuRel);
			}
		}
		buffer.append("</li>");
		return buffer.toString();
	}

	public static void main(String[] args) {
		System.out.println(initId());
	}

}

class MenuRel {
	private Menu menu;
	private List<MenuRel> menuRels;

	public Menu getMenu() {
		return menu;
	}

	public void setMenu(Menu menu) {
		this.menu = menu;
	}

	public List<MenuRel> getMenuRels() {
		return menuRels;
	}

	public void setMenuRels(List<MenuRel> menuRels) {
		this.menuRels = menuRels;
	}

	@Override
	public String toString() {
		return "MenuRel [menu=" + menu + ", menuRels=" + menuRels + "]";
	}

}
