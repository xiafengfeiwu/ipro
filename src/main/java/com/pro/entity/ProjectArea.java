package com.pro.entity;

import java.util.Date;

public class ProjectArea {
    private Long projectAreaId;

    private String areaCode;

    private String areaParentCode;

    private String areaName;

    private String areaWeatherCode;

    private Date createTime;

    public Long getProjectAreaId() {
        return projectAreaId;
    }

    public void setProjectAreaId(Long projectAreaId) {
        this.projectAreaId = projectAreaId;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaParentCode() {
        return areaParentCode;
    }

    public void setAreaParentCode(String areaParentCode) {
        this.areaParentCode = areaParentCode;
    }

    public String getAreaName() {
        return areaName;
    }

    public void setAreaName(String areaName) {
        this.areaName = areaName;
    }

    public String getAreaWeatherCode() {
        return areaWeatherCode;
    }

    public void setAreaWeatherCode(String areaWeatherCode) {
        this.areaWeatherCode = areaWeatherCode;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}