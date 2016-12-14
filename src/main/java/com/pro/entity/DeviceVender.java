package com.pro.entity;

import java.util.Date;

public class DeviceVender {
    private Long venderId;

    private String venderName;

    private String venderCode;

    private String venderContacts;

    private String venderContactsTel;

    private String venderAddress;

    private Long creatorId;

    private Date createTime;

    public Long getVenderId() {
        return venderId;
    }

    public void setVenderId(Long venderId) {
        this.venderId = venderId;
    }

    public String getVenderName() {
        return venderName;
    }

    public void setVenderName(String venderName) {
        this.venderName = venderName;
    }

    public String getVenderCode() {
        return venderCode;
    }

    public void setVenderCode(String venderCode) {
        this.venderCode = venderCode;
    }

    public String getVenderContacts() {
        return venderContacts;
    }

    public void setVenderContacts(String venderContacts) {
        this.venderContacts = venderContacts;
    }

    public String getVenderContactsTel() {
        return venderContactsTel;
    }

    public void setVenderContactsTel(String venderContactsTel) {
        this.venderContactsTel = venderContactsTel;
    }

    public String getVenderAddress() {
        return venderAddress;
    }

    public void setVenderAddress(String venderAddress) {
        this.venderAddress = venderAddress;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}