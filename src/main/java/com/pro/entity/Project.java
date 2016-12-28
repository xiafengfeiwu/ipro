package com.pro.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Project {
    private Long projectId;

    private String projectName;

    private Long projectOwnerId;

    private String ownerName;

    private String ownerPhoneNo;

    private String ownerType;

    private BigDecimal heatingArea;

    private BigDecimal heatingTemp;

    private String areaCode;

    private String areaLongitude;

    private String areaLatitude;

    private String areaWeatherCondition;

    private Date createTime;

    private Date modifyTime;

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public Long getProjectOwnerId() {
        return projectOwnerId;
    }

    public void setProjectOwnerId(Long projectOwnerId) {
        this.projectOwnerId = projectOwnerId;
    }

    public String getOwnerName() {
        return ownerName;
    }

    public void setOwnerName(String ownerName) {
        this.ownerName = ownerName;
    }

    public String getOwnerPhoneNo() {
        return ownerPhoneNo;
    }

    public void setOwnerPhoneNo(String ownerPhoneNo) {
        this.ownerPhoneNo = ownerPhoneNo;
    }

    public String getOwnerType() {
        return ownerType;
    }

    public void setOwnerType(String ownerType) {
        this.ownerType = ownerType;
    }

    public BigDecimal getHeatingArea() {
        return heatingArea;
    }

    public void setHeatingArea(BigDecimal heatingArea) {
        this.heatingArea = heatingArea;
    }

    public BigDecimal getHeatingTemp() {
        return heatingTemp;
    }

    public void setHeatingTemp(BigDecimal heatingTemp) {
        this.heatingTemp = heatingTemp;
    }

    public String getAreaCode() {
        return areaCode;
    }

    public void setAreaCode(String areaCode) {
        this.areaCode = areaCode;
    }

    public String getAreaLongitude() {
        return areaLongitude;
    }

    public void setAreaLongitude(String areaLongitude) {
        this.areaLongitude = areaLongitude;
    }

    public String getAreaLatitude() {
        return areaLatitude;
    }

    public void setAreaLatitude(String areaLatitude) {
        this.areaLatitude = areaLatitude;
    }

    public String getAreaWeatherCondition() {
        return areaWeatherCondition;
    }

    public void setAreaWeatherCondition(String areaWeatherCondition) {
        this.areaWeatherCondition = areaWeatherCondition;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getModifyTime() {
        return modifyTime;
    }

    public void setModifyTime(Date modifyTime) {
        this.modifyTime = modifyTime;
    }
}