package com.pro.entity;

import java.math.BigDecimal;
import java.util.Date;

public class PumpEleStatistics {
    private Long dataId;

    private Long pumpId;

    private Date collectDate;

    private BigDecimal eleToday;

    private String eleTotal;

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

    public Date getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(Date collectDate) {
        this.collectDate = collectDate;
    }

    public BigDecimal getEleToday() {
        return eleToday;
    }

    public void setEleToday(BigDecimal eleToday) {
        this.eleToday = eleToday;
    }

    public String getEleTotal() {
        return eleTotal;
    }

    public void setEleTotal(String eleTotal) {
        this.eleTotal = eleTotal;
    }
}