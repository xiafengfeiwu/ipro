package com.pro.entity;

import java.math.BigDecimal;
import java.util.Date;

public class Pump {
    private Long pumpId;

    private Long projectId;

    private Long venderId;

    private Date installDate;

    private BigDecimal installPiNo;

    private String warrantyInfo;

    private Date pumpCreateTime;

    private Date pumpModifyTime;

    public Long getPumpId() {
        return pumpId;
    }

    public void setPumpId(Long pumpId) {
        this.pumpId = pumpId;
    }

    public Long getProjectId() {
        return projectId;
    }

    public void setProjectId(Long projectId) {
        this.projectId = projectId;
    }

    public Long getVenderId() {
        return venderId;
    }

    public void setVenderId(Long venderId) {
        this.venderId = venderId;
    }

    public Date getInstallDate() {
        return installDate;
    }

    public void setInstallDate(Date installDate) {
        this.installDate = installDate;
    }

    public BigDecimal getInstallPiNo() {
        return installPiNo;
    }

    public void setInstallPiNo(BigDecimal installPiNo) {
        this.installPiNo = installPiNo;
    }

    public String getWarrantyInfo() {
        return warrantyInfo;
    }

    public void setWarrantyInfo(String warrantyInfo) {
        this.warrantyInfo = warrantyInfo;
    }

    public Date getPumpCreateTime() {
        return pumpCreateTime;
    }

    public void setPumpCreateTime(Date pumpCreateTime) {
        this.pumpCreateTime = pumpCreateTime;
    }

    public Date getPumpModifyTime() {
        return pumpModifyTime;
    }

    public void setPumpModifyTime(Date pumpModifyTime) {
        this.pumpModifyTime = pumpModifyTime;
    }
}