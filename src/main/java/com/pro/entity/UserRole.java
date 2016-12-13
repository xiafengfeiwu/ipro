package com.pro.entity;

import java.util.Date;

public class UserRole extends UserRoleKey {
    private Date createTime;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}