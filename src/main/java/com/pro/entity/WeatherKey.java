package com.pro.entity;

public class WeatherKey {
    private Long id;

    private String weatherKey;

    private String weatherEmail;

    private String weatherEmailPassword;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getWeatherKey() {
        return weatherKey;
    }

    public void setWeatherKey(String weatherKey) {
        this.weatherKey = weatherKey;
    }

    public String getWeatherEmail() {
        return weatherEmail;
    }

    public void setWeatherEmail(String weatherEmail) {
        this.weatherEmail = weatherEmail;
    }

    public String getWeatherEmailPassword() {
        return weatherEmailPassword;
    }

    public void setWeatherEmailPassword(String weatherEmailPassword) {
        this.weatherEmailPassword = weatherEmailPassword;
    }
}