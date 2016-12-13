package com.pro.entity;

import java.util.Date;

public class WarnHandle {
    private Long warnHandleId;

    private Long warnId;

    private Long handleUserId;

    private Date handleTime;

    private String handleStatus;

    private String handleDescript;

    public Long getWarnHandleId() {
        return warnHandleId;
    }

    public void setWarnHandleId(Long warnHandleId) {
        this.warnHandleId = warnHandleId;
    }

    public Long getWarnId() {
        return warnId;
    }

    public void setWarnId(Long warnId) {
        this.warnId = warnId;
    }

    public Long getHandleUserId() {
        return handleUserId;
    }

    public void setHandleUserId(Long handleUserId) {
        this.handleUserId = handleUserId;
    }

    public Date getHandleTime() {
        return handleTime;
    }

    public void setHandleTime(Date handleTime) {
        this.handleTime = handleTime;
    }

    public String getHandleStatus() {
        return handleStatus;
    }

    public void setHandleStatus(String handleStatus) {
        this.handleStatus = handleStatus;
    }

    public String getHandleDescript() {
        return handleDescript;
    }

    public void setHandleDescript(String handleDescript) {
        this.handleDescript = handleDescript;
    }
}