package com.pro.entity;

import java.util.Date;

public class ManagerArea extends ManagerAreaKey {
    private Boolean isAreaRoot;

    private String areaCode;

    private Date createTime;

    public Boolean getIsAreaRoot() {
        return isAreaRoot;
    }

    public void setIsAreaRoot(Boolean isAreaRoot) {
        this.isAreaRoot = isAreaRoot;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}