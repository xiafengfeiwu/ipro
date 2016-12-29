package com.pro.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PumpEle {
    private Long dataId;

    private Long pumpId;

    private Date collectTime;

    private BigDecimal electricity;

    private Date createTime;

    public Long getDataId() {
        return dataId;
    }

    public void setDataId(Long dataId) {
        this.dataId = dataId;
    }

    public Long getPumpId() {
        return pumpId;
    }

    public void setPumpId(Long pumpId) {
        this.pumpId = pumpId;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }

    public BigDecimal getElectricity() {
        return electricity;
    }

    public void setElectricity(BigDecimal electricity) {
        this.electricity = electricity;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}