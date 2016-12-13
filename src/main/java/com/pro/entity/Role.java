package com.pro.entity;

import java.util.Date;

public class Role {
    private Long roleId;

    private String roleName;

    private Date roleCreateTime;

    private Date roleModifyTime;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public Date getRoleCreateTime() {
        return roleCreateTime;
    }

    public void setRoleCreateTime(Date roleCreateTime) {
        this.roleCreateTime = roleCreateTime;
    }

    public Date getRoleModifyTime() {
        return roleModifyTime;
    }

    public void setRoleModifyTime(Date roleModifyTime) {
        this.roleModifyTime = roleModifyTime;
    }
}