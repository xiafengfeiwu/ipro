package com.pro.entity;

import java.util.Date;

public class WarnGroupItem {
    private Long itemId;

    private Long warnGroupId;

    private String itemName;

    private String itemThreshold;

    private String itemOperators;

    private String warnCode;

    private String warnLevel;

    private Boolean smsNotice;

    private Long creatorId;

    private Date createTime;

    public Long getItemId() {
        return itemId;
    }

    public void setItemId(Long itemId) {
        this.itemId = itemId;
    }

    public Long getWarnGroupId() {
        return warnGroupId;
    }

    public void setWarnGroupId(Long warnGroupId) {
        this.warnGroupId = warnGroupId;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getItemThreshold() {
        return itemThreshold;
    }

    public void setItemThreshold(String itemThreshold) {
        this.itemThreshold = itemThreshold;
    }

    public String getItemOperators() {
        return itemOperators;
    }

    public void setItemOperators(String itemOperators) {
        this.itemOperators = itemOperators;
    }

    public String getWarnCode() {
        return warnCode;
    }

    public void setWarnCode(String warnCode) {
        this.warnCode = warnCode;
    }

    public String getWarnLevel() {
        return warnLevel;
    }

    public void setWarnLevel(String warnLevel) {
        this.warnLevel = warnLevel;
    }

    public Boolean getSmsNotice() {
        return smsNotice;
    }

    public void setSmsNotice(Boolean smsNotice) {
        this.smsNotice = smsNotice;
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