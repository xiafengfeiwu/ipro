package com.pro.entity;

import java.util.Date;

public class WeatherDataKey {
    private String weatherCityCode;

    private Date collectDate;

    public String getWeatherCityCode() {
        return weatherCityCode;
    }

    public void setWeatherCityCode(String weatherCityCode) {
        this.weatherCityCode = weatherCityCode;
    }

    public Date getCollectDate() {
        return collectDate;
    }

    public void setCollectDate(Date collectDate) {
        this.collectDate = collectDate;
    }
}