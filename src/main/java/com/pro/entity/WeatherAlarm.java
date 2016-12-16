package com.pro.entity;

import java.util.Date;

public class WeatherAlarm {
    private String weatherCityCode;

    private Date earlyWarnTime;

    private String earlyWarnLevel;

    private String earlyWarnStat;

    private String earlyWarnType;

    private String earlyWarnTitle;

    private String earlyWarnTxt;

    public String getWeatherCityCode() {
        return weatherCityCode;
    }

    public void setWeatherCityCode(String weatherCityCode) {
        this.weatherCityCode = weatherCityCode;
    }

    public Date getEarlyWarnTime() {
        return earlyWarnTime;
    }

    public void setEarlyWarnTime(Date earlyWarnTime) {
        this.earlyWarnTime = earlyWarnTime;
    }

    public String getEarlyWarnLevel() {
        return earlyWarnLevel;
    }

    public void setEarlyWarnLevel(String earlyWarnLevel) {
        this.earlyWarnLevel = earlyWarnLevel;
    }

    public String getEarlyWarnStat() {
        return earlyWarnStat;
    }

    public void setEarlyWarnStat(String earlyWarnStat) {
        this.earlyWarnStat = earlyWarnStat;
    }

    public String getEarlyWarnType() {
        return earlyWarnType;
    }

    public void setEarlyWarnType(String earlyWarnType) {
        this.earlyWarnType = earlyWarnType;
    }

    public String getEarlyWarnTitle() {
        return earlyWarnTitle;
    }

    public void setEarlyWarnTitle(String earlyWarnTitle) {
        this.earlyWarnTitle = earlyWarnTitle;
    }

    public String getEarlyWarnTxt() {
        return earlyWarnTxt;
    }

    public void setEarlyWarnTxt(String earlyWarnTxt) {
        this.earlyWarnTxt = earlyWarnTxt;
    }
}