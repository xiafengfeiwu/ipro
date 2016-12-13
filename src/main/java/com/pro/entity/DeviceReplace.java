package com.pro.entity;

import java.util.Date;

public class DeviceReplace {
    private Long nodeId;

    private Date replaceTime;

    private String replaceDescript;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public Date getReplaceTime() {
        return replaceTime;
    }

    public void setReplaceTime(Date replaceTime) {
        this.replaceTime = replaceTime;
    }

    public String getReplaceDescript() {
        return replaceDescript;
    }

    public void setReplaceDescript(String replaceDescript) {
        this.replaceDescript = replaceDescript;
    }
}