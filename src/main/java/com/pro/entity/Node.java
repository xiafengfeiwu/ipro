package com.pro.entity;

import java.util.Date;

public class Node {
    private Long nodeId;

    private Long terminalId;

    private Long deviceId;

    private Date lastTimeContactTime;

    private Date registTime;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public Long getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(Long terminalId) {
        this.terminalId = terminalId;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public Date getLastTimeContactTime() {
        return lastTimeContactTime;
    }

    public void setLastTimeContactTime(Date lastTimeContactTime) {
        this.lastTimeContactTime = lastTimeContactTime;
    }

    public Date getRegistTime() {
        return registTime;
    }

    public void setRegistTime(Date registTime) {
        this.registTime = registTime;
    }
}