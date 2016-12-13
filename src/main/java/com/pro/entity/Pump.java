package com.pro.entity;

import java.util.Date;

public class Pump {
    private Long pumpId;

    private String pumpName;

    private Long pumpOwnerId;

    private String pumpAddress;

    private String pumpWeatherCityCode;

    private String pumpLongitude;

    private String pumpLatitude;

    private Date pumpCreateTime;

    private Date pumpModifyTime;

    public Long getPumpId() {
        return pumpId;
    }

    public void setPumpId(Long pumpId) {
        this.pumpId = pumpId;
    }

    public String getPumpName() {
        return pumpName;
    }

    public void setPumpName(String pumpName) {
        this.pumpName = pumpName;
    }

    public Long getPumpOwnerId() {
        return pumpOwnerId;
    }

    public void setPumpOwnerId(Long pumpOwnerId) {
        this.pumpOwnerId = pumpOwnerId;
    }

    public String getPumpAddress() {
        return pumpAddress;
    }

    public void setPumpAddress(String pumpAddress) {
        this.pumpAddress = pumpAddress;
    }

    public String getPumpWeatherCityCode() {
        return pumpWeatherCityCode;
    }

    public void setPumpWeatherCityCode(String pumpWeatherCityCode) {
        this.pumpWeatherCityCode = pumpWeatherCityCode;
    }

    public String getPumpLongitude() {
        return pumpLongitude;
    }

    public void setPumpLongitude(String pumpLongitude) {
        this.pumpLongitude = pumpLongitude;
    }

    public String getPumpLatitude() {
        return pumpLatitude;
    }

    public void setPumpLatitude(String pumpLatitude) {
        this.pumpLatitude = pumpLatitude;
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