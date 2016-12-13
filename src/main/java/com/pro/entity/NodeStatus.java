package com.pro.entity;

import java.math.BigDecimal;
import java.util.Date;

public class NodeStatus {
    private Long nodeId;

    private BigDecimal backWaterTemp;

    private BigDecimal outWaterTemp;

    private BigDecimal environmentTemp;

    private BigDecimal compressorCurrent;

    private BigDecimal waterTankTemp;

    private String workMode;

    private String warnCode;

    private BigDecimal backAirTemp;

    private BigDecimal outAirTemp;

    private BigDecimal setUpTemp;

    private BigDecimal indoorTemp;

    private Date collectTime;

    public Long getNodeId() {
        return nodeId;
    }

    public void setNodeId(Long nodeId) {
        this.nodeId = nodeId;
    }

    public BigDecimal getBackWaterTemp() {
        return backWaterTemp;
    }

    public void setBackWaterTemp(BigDecimal backWaterTemp) {
        this.backWaterTemp = backWaterTemp;
    }

    public BigDecimal getOutWaterTemp() {
        return outWaterTemp;
    }

    public void setOutWaterTemp(BigDecimal outWaterTemp) {
        this.outWaterTemp = outWaterTemp;
    }

    public BigDecimal getEnvironmentTemp() {
        return environmentTemp;
    }

    public void setEnvironmentTemp(BigDecimal environmentTemp) {
        this.environmentTemp = environmentTemp;
    }

    public BigDecimal getCompressorCurrent() {
        return compressorCurrent;
    }

    public void setCompressorCurrent(BigDecimal compressorCurrent) {
        this.compressorCurrent = compressorCurrent;
    }

    public BigDecimal getWaterTankTemp() {
        return waterTankTemp;
    }

    public void setWaterTankTemp(BigDecimal waterTankTemp) {
        this.waterTankTemp = waterTankTemp;
    }

    public String getWorkMode() {
        return workMode;
    }

    public void setWorkMode(String workMode) {
        this.workMode = workMode;
    }

    public String getWarnCode() {
        return warnCode;
    }

    public void setWarnCode(String warnCode) {
        this.warnCode = warnCode;
    }

    public BigDecimal getBackAirTemp() {
        return backAirTemp;
    }

    public void setBackAirTemp(BigDecimal backAirTemp) {
        this.backAirTemp = backAirTemp;
    }

    public BigDecimal getOutAirTemp() {
        return outAirTemp;
    }

    public void setOutAirTemp(BigDecimal outAirTemp) {
        this.outAirTemp = outAirTemp;
    }

    public BigDecimal getSetUpTemp() {
        return setUpTemp;
    }

    public void setSetUpTemp(BigDecimal setUpTemp) {
        this.setUpTemp = setUpTemp;
    }

    public BigDecimal getIndoorTemp() {
        return indoorTemp;
    }

    public void setIndoorTemp(BigDecimal indoorTemp) {
        this.indoorTemp = indoorTemp;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }
}