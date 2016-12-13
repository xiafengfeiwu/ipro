package com.pro.entity;

import java.util.Date;

public class StoppageHandle {
    private Long stoppageHandleId;

    private Long stoppageId;

    private Long handleUserId;

    private Date handleTime;

    private Long handleDuration;

    private String handleStatus;

    private String handleDescript;

    public Long getStoppageHandleId() {
        return stoppageHandleId;
    }

    public void setStoppageHandleId(Long stoppageHandleId) {
        this.stoppageHandleId = stoppageHandleId;
    }

    public Long getStoppageId() {
        return stoppageId;
    }

    public void setStoppageId(Long stoppageId) {
        this.stoppageId = stoppageId;
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

    public Long getHandleDuration() {
        return handleDuration;
    }

    public void setHandleDuration(Long handleDuration) {
        this.handleDuration = handleDuration;
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