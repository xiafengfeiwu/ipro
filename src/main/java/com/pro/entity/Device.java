package com.pro.entity;

import java.util.Date;

public class Device {
    private Long deviceId;

    private String deviceName;

    private String deviceSn;

    private String deviceModel;

    private String deviceType;

    private Date deviceCreateTime;

    private Date deviceModifyTime;

    public Long getDeviceId() {
        return deviceId;
    }

    public void setDeviceId(Long deviceId) {
        this.deviceId = deviceId;
    }

    public String getDeviceName() {
        return deviceName;
    }

    public void setDeviceName(String deviceName) {
        this.deviceName = deviceName;
    }

    public String getDeviceSn() {
        return deviceSn;
    }

    public void setDeviceSn(String deviceSn) {
        this.deviceSn = deviceSn;
    }

    public String getDeviceModel() {
        return deviceModel;
    }

    public void setDeviceModel(String deviceModel) {
        this.deviceModel = deviceModel;
    }

    public String getDeviceType() {
        return deviceType;
    }

    public void setDeviceType(String deviceType) {
        this.deviceType = deviceType;
    }

    public Date getDeviceCreateTime() {
        return deviceCreateTime;
    }

    public void setDeviceCreateTime(Date deviceCreateTime) {
        this.deviceCreateTime = deviceCreateTime;
    }

    public Date getDeviceModifyTime() {
        return deviceModifyTime;
    }

    public void setDeviceModifyTime(Date deviceModifyTime) {
        this.deviceModifyTime = deviceModifyTime;
    }
}