package com.pro.controller;

import java.util.Date;
import java.util.List;

import org.apache.shiro.authz.annotation.RequiresAuthentication;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.pro.entity.Role;
import com.pro.service.RoleService;
import com.pro.util.PublicUtil;

@Controller
@RequestMapping("role")
public class RoleController {
	@Autowired
	RoleService roleService;

	@RequiresAuthentication
	@RequestMapping("list")
	public ModelAndView listPage(String searchWord, String field, String order) {
		ModelAndView modelAndView = new ModelAndView("role_list");
		List<Role> roles = roleService.findAll(searchWord, field, order);
		modelAndView.addObject("roles", roles);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("create")
	public ModelAndView createPage() {
		ModelAndView modelAndView = new ModelAndView("role_create");
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("saveAction")
	public String saveAction(String roleName, RedirectAttributes attr) {
		String view = "redirect:/role/create.jspx";
		attr.addFlashAttribute("status", "danger");
		if (PublicUtil.isEmpty(roleName) || roleName.length() > 20) {
			attr.addFlashAttribute("message", "无效的角色名称");
			return view;
		}
		Role role = new Role();
		role.setRoleId(PublicUtil.initId());
		role.setRoleName(roleName);
		role.setSystemRole(false);
		role.setRoleCreateTime(new Date());
		role.setRoleModifyTime(new Date());
		try {
			roleService.create(role);
		} catch (Exception e) {
			attr.addFlashAttribute("message", e.getMessage());
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "创建成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("change")
	public ModelAndView changePage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_change");
		Role role = roleService.getById(roleId);
		modelAndView.addObject("role", role);
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("updateAction")
	public String updateAction(Role role, RedirectAttributes attr) {
		String view = "redirect:/role/change.jspx?roleId=" + role.getRoleId();
		attr.addFlashAttribute("status", "danger");
		if (role.getRoleId() == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (PublicUtil.isEmpty(role.getRoleName()) || role.getRoleName().length() > 20) {
			attr.addFlashAttribute("message", "无效的角色名称");
			return view;
		}
		Role nRole = roleService.getById(role.getRoleId());
		if (nRole == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (nRole.getSystemRole()) {
			attr.addFlashAttribute("message", "系统角色不允许修改");
			return view;
		}
		nRole.setRoleName(role.getRoleName().trim());
		nRole.setRoleModifyTime(new Date());
		try {
			roleService.update(nRole);
		} catch (Exception e) {
			attr.addFlashAttribute("message", e.getMessage());
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "修改成功");
		return view;
	}

	@RequiresAuthentication
	@RequestMapping("delete")
	public ModelAndView deletePage(Long roleId) {
		ModelAndView modelAndView = new ModelAndView("role_delete");
		Role role = roleService.getById(roleId);
		if (role != null) {
			modelAndView.addObject("role", role);
		}
		return modelAndView;
	}

	@RequiresAuthentication
	@RequestMapping("deleteAction")
	public String deleteAction(Long roleId, RedirectAttributes attr) {
		String view = "redirect:/role/delete.jspx?roleId=" + roleId;
		attr.addFlashAttribute("status", "danger");
		Role nRole = roleService.getById(roleId);
		if (nRole == null) {
			attr.addFlashAttribute("message", "无效的角色");
			return view;
		}
		if (nRole.getSystemRole()) {
			attr.addFlashAttribute("message", "系统角色不允许删除");
			return view;
		}
		try {
			roleService.delete(roleId);
		} catch (Exception e) {
			attr.addFlashAttribute("message", e.getMessage());
			return view;
		}
		attr.addFlashAttribute("status", "success");
		attr.addFlashAttribute("message", "删除成功");
		return view;
	}
}
