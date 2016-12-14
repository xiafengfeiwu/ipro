package com.pro.entity;

import java.util.Date;

public class Warn {
    private Long warnId;

    private String warnNo;

    private Long nodeId;

    private String warnCode;

    private String warnLevel;

    private String warnDescript;

    private String warnStatus;

    private Date warnHappenTime;

    private Date warnModifyTime;

    public Long getWarnId() {
        return warnId;
    }

    public void setWarnId(Long warnId) {
        this.warnId = warnId;
    }

    public String getWarnNo() {
        return warnNo;
    }

    public void setWarnNo(String warnNo) {
        this.warnNo = warnNo;
    }

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public String getWarnCode() {
        return warnCode;
    }

    public void setWarnCode(String warnCode) {
        this.warnCode = warnCode;
    }

    public String getWarnLevel() {
        return warnLevel;
    }

    public void setWarnLevel(String warnLevel) {
        this.warnLevel = warnLevel;
    }

    public String getWarnDescript() {
        return warnDescript;
    }

    public void setWarnDescript(String warnDescript) {
        this.warnDescript = warnDescript;
    }

    public String getWarnStatus() {
        return warnStatus;
    }

    public void setWarnStatus(String warnStatus) {
        this.warnStatus = warnStatus;
    }

    public Date getWarnHappenTime() {
        return warnHappenTime;
    }

    public void setWarnHappenTime(Date warnHappenTime) {
        this.warnHappenTime = warnHappenTime;
    }

    public Date getWarnModifyTime() {
        return warnModifyTime;
    }

    public void setWarnModifyTime(Date warnModifyTime) {
        this.warnModifyTime = warnModifyTime;
    }
}