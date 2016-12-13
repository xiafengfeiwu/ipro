package com.pro.entity;

import java.util.Date;

public class DeviceReplace {
    private Long recordId;

    private Long nodeId;

    private Date replaceTime;

    private String replaceDescript;

    private Long operatorId;

    public Long getRecordId() {
        return recordId;
    }

    public void setRecordId(Long recordId) {
        this.recordId = recordId;
    }

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

    public Long getOperatorId() {
        return operatorId;
    }

    public void setOperatorId(Long operatorId) {
        this.operatorId = operatorId;
    }
}