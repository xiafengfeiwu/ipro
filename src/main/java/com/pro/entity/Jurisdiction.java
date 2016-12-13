package com.pro.entity;

public class Jurisdiction {
    private Long jurisdictionId;

    private Long groupId;

    private String jurisdictionName;

    private String jurisdictionCode;

    private String jurisdictionDescript;

    public Long getJurisdictionId() {
        return jurisdictionId;
    }

    public void setJurisdictionId(Long jurisdictionId) {
        this.jurisdictionId = jurisdictionId;
    }

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getJurisdictionName() {
        return jurisdictionName;
    }

    public void setJurisdictionName(String jurisdictionName) {
        this.jurisdictionName = jurisdictionName;
    }

    public String getJurisdictionCode() {
        return jurisdictionCode;
    }

    public void setJurisdictionCode(String jurisdictionCode) {
        this.jurisdictionCode = jurisdictionCode;
    }

    public String getJurisdictionDescript() {
        return jurisdictionDescript;
    }

    public void setJurisdictionDescript(String jurisdictionDescript) {
        this.jurisdictionDescript = jurisdictionDescript;
    }
}