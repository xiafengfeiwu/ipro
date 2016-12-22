package com.pro.entity;

import java.util.Date;

public class Node {
    private Long nodeId;

    private Long pumpId;

    private Long deviceId;

    private String nodeName;

    private Boolean nodeOnline;

    private Date lastTimeContactTime;

    private Date registTime;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public Long getPumpId() {
        return pumpId;
    }

    public void setPumpId(Long pumpId) {
        this.pumpId = pumpId;
    }

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public String getNodeName() {
        return nodeName;
    }

    public void setNodeName(String nodeName) {
        this.nodeName = nodeName;
    }

    public Boolean getNodeOnline() {
        return nodeOnline;
    }

    public void setNodeOnline(Boolean nodeOnline) {
        this.nodeOnline = nodeOnline;
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