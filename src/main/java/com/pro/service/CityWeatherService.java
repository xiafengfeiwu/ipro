package com.pro.service;

import com.pro.entity.WeatherAlarm;
import com.pro.entity.WeatherData;
import com.pro.entity.WeatherIcon;
import com.pro.entity.WeatherKey;

public interface CityWeatherService {
	// 通过城市编码获取城市天气详情
	WeatherData findTodayCityWeatherByCode(String cityCode);

	// 通过天气编码获取城市天气图标
	WeatherIcon findWeatherIconByCode(String weatherCode);

	// 获取第三方天气KEY值
	WeatherKey findWeatherKey();

	// 更新第三方天气KEY值
	void updateWeatherKey(WeatherKey weatherKey);

	// 更新插入天气数据
	void upInsertWeatherData(WeatherData weatherData);

	// 更新插入天气预警数据
	void upInsertWeaterAlarm(WeatherAlarm weatherAlarm);

	// 清除天气预警数据
	void clearWeaterAlarm(String cityCode);
}
