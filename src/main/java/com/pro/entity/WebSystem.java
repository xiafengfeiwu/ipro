package com.pro.entity;

import java.util.Date;

public class WebSystem {
    private Long systemId;

    private String systemLogoUrl;

    private String systemTitle;

    private String systemJianPin;

    private String systemTechnicalSupport;

    private Date systemModifyTime;

    public Long getSystemId() {
        return systemId;
    }

    public void setSystemId(Long systemId) {
        this.systemId = systemId;
    }

    public String getSystemLogoUrl() {
        return systemLogoUrl;
    }

    public void setSystemLogoUrl(String systemLogoUrl) {
        this.systemLogoUrl = systemLogoUrl;
    }

    public String getSystemTitle() {
        return systemTitle;
    }

    public void setSystemTitle(String systemTitle) {
        this.systemTitle = systemTitle;
    }

    public String getSystemJianPin() {
        return systemJianPin;
    }

    public void setSystemJianPin(String systemJianPin) {
        this.systemJianPin = systemJianPin;
    }

    public String getSystemTechnicalSupport() {
        return systemTechnicalSupport;
    }

    public void setSystemTechnicalSupport(String systemTechnicalSupport) {
        this.systemTechnicalSupport = systemTechnicalSupport;
    }

    public Date getSystemModifyTime() {
        return systemModifyTime;
    }

    public void setSystemModifyTime(Date systemModifyTime) {
        this.systemModifyTime = systemModifyTime;
    }
}