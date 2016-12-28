package com.pro.entity;

import java.util.Date;

public class Stoppage {
    private Long stoppageId;

    private Long warnId;

    private String stoppageNo;

    private Long pumpId;

    private Long nodeId;

    private String descript;

    private Long attachId;

    private Long originatorId;

    private Date occurTime;

    private String handleStatus;

    private Date handleModifyTime;

    public Long getStoppageId() {
        return stoppageId;
    }

    public void setStoppageId(Long stoppageId) {
        this.stoppageId = stoppageId;
    }

    public Long getWarnId() {
        return warnId;
    }

    public void setWarnId(Long warnId) {
        this.warnId = warnId;
    }

    public String getStoppageNo() {
        return stoppageNo;
    }

    public void setStoppageNo(String stoppageNo) {
        this.stoppageNo = stoppageNo;
    }

    public Long getPumpId() {
        return pumpId;
    }

    public void setPumpId(Long pumpId) {
        this.pumpId = pumpId;
    }

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public String getDescript() {
        return descript;
    }

    public void setDescript(String descript) {
        this.descript = descript;
    }

    public Long getAttachId() {
        return attachId;
    }

    public void setAttachId(Long attachId) {
        this.attachId = attachId;
    }

    public Long getOriginatorId() {
        return originatorId;
    }

    public void setOriginatorId(Long originatorId) {
        this.originatorId = originatorId;
    }

    public Date getOccurTime() {
        return occurTime;
    }

    public void setOccurTime(Date occurTime) {
        this.occurTime = occurTime;
    }

    public String getHandleStatus() {
        return handleStatus;
    }

    public void setHandleStatus(String handleStatus) {
        this.handleStatus = handleStatus;
    }

    public Date getHandleModifyTime() {
        return handleModifyTime;
    }

    public void setHandleModifyTime(Date handleModifyTime) {
        this.handleModifyTime = handleModifyTime;
    }
}