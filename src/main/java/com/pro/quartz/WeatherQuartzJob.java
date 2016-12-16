package com.pro.quartz;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import org.apache.log4j.Logger;
import org.quartz.DisallowConcurrentExecution;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;

import com.pro.entity.WeatherData;
import com.pro.entity.WeatherKey;
import com.pro.service.CityWeatherService;
import com.pro.util.HttpUtil;

import net.sf.json.JSONObject;

// 0 0 0,6,13,17 * * ?
@DisallowConcurrentExecution
public class WeatherQuartzJob implements Job {

	private final static String WeatherURL = "https://free-api.heweather.com/v5/now?city=#CITYCODE#&key=#KEY#";
	private final static String AlarmURL = "https://free-api.heweather.com/v5/alarm?city=#CITYCODE#&key=#KEY#";

	Logger logger = Logger.getLogger(WeatherQuartzJob.class);

	@Autowired
	CityWeatherService cityWeatherService;

	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		logger.info(context.getFireTime().getTime());
		// 获取要进行更新的天气的城市编码 LIST
		Set<String> cityCodes = new HashSet<>();

		cityCodes.add("CN101010100");
		cityCodes.add("CN101010200");
		cityCodes.add("CN101010300");
		cityCodes.add("CN101010400");
		cityCodes.add("CN101010500");
		cityCodes.add("CN101010600");
		cityCodes.add("CN101010700");
		cityCodes.add("CN101010800");
		cityCodes.add("CN101010900");
		cityCodes.add("CN101011000");
		cityCodes.add("CN101011100");
		cityCodes.add("CN101011200");
		cityCodes.add("CN101011300");
		cityCodes.add("CN101011400");
		cityCodes.add("CN101011500");

		// 判断城市总个数是否大于375 如果是 则在短信通知告警 增加容量或者缩短间隔 发送至系统管理员手机号
		if (cityCodes.size() > 375) {
			logger.error("城市编码总个数已经大于375，请增加接口容量或者缩短更新间隔。");
		}

		WeatherKey weatherKey = cityWeatherService.findWeatherKey();
		if (weatherKey == null) {
			logger.error("未配置第三方天气接口KEY值");
			return;
		}

		String key = weatherKey.getKey();

		// 遍历城市编码
		for (String code : cityCodes) {
			// 通过城市编码获取天气详情
			String w_url = WeatherURL.replaceAll("#CITYCODE#", code).replaceAll("#KEY#", key);
			try {
				String result = HttpUtil.getRequest(w_url);
				// 解析result

				// 插入更新天气信息
			} catch (Exception e) {
				logger.error("Weather E " + e.getMessage());
			}
			// 通过城市编码获取预警信息
			String a_url = AlarmURL.replaceAll("#CITYCODE#", code).replaceAll("#KEY#", key);
			try {
				String result = HttpUtil.getRequest(a_url);
				// 解析result
				// 插入更新预警信息
			} catch (Exception e) {
				logger.error("Alarm E " + e.getMessage());
			}
		}
	}

	private WeatherData analysisJsonString(String json) {
		try {
			JSONObject object = JSONObject.fromObject(json);
			JSONObject root = object.getJSONArray("HeWeather5").getJSONObject(0);
			JSONObject basic = root.getJSONObject("basic");
			JSONObject now = root.getJSONObject("now");
			
			WeatherData data = new WeatherData();
			String weatherCityCode = basic.getString("id");
			data.setWeatherCityCode(weatherCityCode);
			JSONObject daily = root.getJSONArray("daily_forecast").getJSONObject(0);
			JSONObject astro = daily.getJSONObject("astro");
			data.setSunriseTime(astro.getString("sr"));
			data.setSunsetTime(astro.getString("ss"));
			JSONObject cond = daily.getJSONObject("cond");
			data.setDayWeather(cond.getString("code_d"));
			data.setNightWeather(cond.getString("code_n"));
			JSONObject tmp = daily.getJSONObject("tmp");
			data.setMinTemperature(tmp.getString("min"));
			data.setMaxTemperature(tmp.getString("max"));
			DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			data.setCollectDate(df.parse(tmp.getString("")));
			data.setLastUpdateTime(new Date());
			return data;
		} catch (Exception e) {
			return null;
		}
	}
}
