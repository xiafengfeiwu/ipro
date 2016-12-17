package com.pro.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.WeatherAlarmMapper;
import com.pro.dao.WeatherDataMapper;
import com.pro.dao.WeatherIconMapper;
import com.pro.dao.WeatherKeyMapper;
import com.pro.entity.WeatherAlarm;
import com.pro.entity.WeatherData;
import com.pro.entity.WeatherDataKey;
import com.pro.entity.WeatherIcon;
import com.pro.entity.WeatherKey;
import com.pro.service.CityWeatherService;

@Service
public class CityWeatherServiceImpl implements CityWeatherService {

	@Autowired
	WeatherDataMapper weatherDataMapper;
	@Autowired
	WeatherIconMapper weatherIconMapper;
	@Autowired
	WeatherKeyMapper weatherKeyMapper;
	@Autowired
	WeatherAlarmMapper weatherAlarmMapper;

	@Override
	public WeatherData findTodayCityWeatherByCode(String cityCode) {
		WeatherDataKey key = new WeatherDataKey();
		key.setWeatherCityCode(cityCode);
		key.setCollectDate(new Date());
		return weatherDataMapper.selectByPrimaryKey(key);
	}

	@Override
	public WeatherIcon findWeatherIconByCode(String weatherCode) {
		return weatherIconMapper.selectByPrimaryKey(weatherCode);
	}

	@Override
	public WeatherKey findWeatherKey() {
		return weatherKeyMapper.selectByPrimaryKey(new Long("809645772998967297"));
	}

	@Override
	public WeatherAlarm findWeatherAlarmByCode(String cityCode) {
		return weatherAlarmMapper.selectByPrimaryKey(cityCode);
	}

	@Override
	public void updateWeatherKey(WeatherKey weatherKey) {
		weatherKeyMapper.updateByPrimaryKey(weatherKey);
	}

	@Override
	public void upInsertWeatherData(WeatherData weatherData) {
		WeatherDataKey key = new WeatherDataKey();
		key.setCollectDate(weatherData.getCollectDate());
		key.setWeatherCityCode(weatherData.getWeatherCityCode());
		WeatherData data = weatherDataMapper.selectByPrimaryKey(key);
		if (data == null) {
			weatherDataMapper.insert(weatherData);
		} else {
			weatherDataMapper.updateByPrimaryKey(weatherData);
		}
	}

	@Override
	public void upInsertWeaterAlarm(WeatherAlarm weatherAlarm) {
		WeatherAlarm data = findWeatherAlarmByCode(weatherAlarm.getWeatherCityCode());
		if (data == null) {
			weatherAlarmMapper.insert(weatherAlarm);
		} else {
			weatherAlarmMapper.updateByPrimaryKey(weatherAlarm);
		}
	}

	@Override
	public void clearWeaterAlarm(String cityCode) {
		weatherAlarmMapper.deleteByPrimaryKey(cityCode);
	}

}
