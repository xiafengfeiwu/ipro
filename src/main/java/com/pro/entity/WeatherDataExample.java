package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WeatherDataExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WeatherDataExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    public String getOrderByClause() {
        return orderByClause;
    }

    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    public boolean isDistinct() {
        return distinct;
    }

    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andWeatherCityCodeIsNull() {
            addCriterion("weather_city_code is null");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeIsNotNull() {
            addCriterion("weather_city_code is not null");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeEqualTo(String value) {
            addCriterion("weather_city_code =", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeNotEqualTo(String value) {
            addCriterion("weather_city_code <>", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeGreaterThan(String value) {
            addCriterion("weather_city_code >", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeGreaterThanOrEqualTo(String value) {
            addCriterion("weather_city_code >=", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeLessThan(String value) {
            addCriterion("weather_city_code <", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeLessThanOrEqualTo(String value) {
            addCriterion("weather_city_code <=", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeLike(String value) {
            addCriterion("weather_city_code like", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeNotLike(String value) {
            addCriterion("weather_city_code not like", value, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeIn(List<String> values) {
            addCriterion("weather_city_code in", values, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeNotIn(List<String> values) {
            addCriterion("weather_city_code not in", values, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeBetween(String value1, String value2) {
            addCriterion("weather_city_code between", value1, value2, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andWeatherCityCodeNotBetween(String value1, String value2) {
            addCriterion("weather_city_code not between", value1, value2, "weatherCityCode");
            return (Criteria) this;
        }

        public Criteria andCollectDateIsNull() {
            addCriterion("collect_date is null");
            return (Criteria) this;
        }

        public Criteria andCollectDateIsNotNull() {
            addCriterion("collect_date is not null");
            return (Criteria) this;
        }

        public Criteria andCollectDateEqualTo(String value) {
            addCriterion("collect_date =", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotEqualTo(String value) {
            addCriterion("collect_date <>", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateGreaterThan(String value) {
            addCriterion("collect_date >", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateGreaterThanOrEqualTo(String value) {
            addCriterion("collect_date >=", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateLessThan(String value) {
            addCriterion("collect_date <", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateLessThanOrEqualTo(String value) {
            addCriterion("collect_date <=", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateLike(String value) {
            addCriterion("collect_date like", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotLike(String value) {
            addCriterion("collect_date not like", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateIn(List<String> values) {
            addCriterion("collect_date in", values, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotIn(List<String> values) {
            addCriterion("collect_date not in", values, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateBetween(String value1, String value2) {
            addCriterion("collect_date between", value1, value2, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotBetween(String value1, String value2) {
            addCriterion("collect_date not between", value1, value2, "collectDate");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeIsNull() {
            addCriterion("sunrise_time is null");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeIsNotNull() {
            addCriterion("sunrise_time is not null");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeEqualTo(String value) {
            addCriterion("sunrise_time =", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeNotEqualTo(String value) {
            addCriterion("sunrise_time <>", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeGreaterThan(String value) {
            addCriterion("sunrise_time >", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeGreaterThanOrEqualTo(String value) {
            addCriterion("sunrise_time >=", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeLessThan(String value) {
            addCriterion("sunrise_time <", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeLessThanOrEqualTo(String value) {
            addCriterion("sunrise_time <=", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeLike(String value) {
            addCriterion("sunrise_time like", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeNotLike(String value) {
            addCriterion("sunrise_time not like", value, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeIn(List<String> values) {
            addCriterion("sunrise_time in", values, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeNotIn(List<String> values) {
            addCriterion("sunrise_time not in", values, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeBetween(String value1, String value2) {
            addCriterion("sunrise_time between", value1, value2, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunriseTimeNotBetween(String value1, String value2) {
            addCriterion("sunrise_time not between", value1, value2, "sunriseTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeIsNull() {
            addCriterion("sunset_time is null");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeIsNotNull() {
            addCriterion("sunset_time is not null");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeEqualTo(String value) {
            addCriterion("sunset_time =", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeNotEqualTo(String value) {
            addCriterion("sunset_time <>", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeGreaterThan(String value) {
            addCriterion("sunset_time >", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeGreaterThanOrEqualTo(String value) {
            addCriterion("sunset_time >=", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeLessThan(String value) {
            addCriterion("sunset_time <", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeLessThanOrEqualTo(String value) {
            addCriterion("sunset_time <=", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeLike(String value) {
            addCriterion("sunset_time like", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeNotLike(String value) {
            addCriterion("sunset_time not like", value, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeIn(List<String> values) {
            addCriterion("sunset_time in", values, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeNotIn(List<String> values) {
            addCriterion("sunset_time not in", values, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeBetween(String value1, String value2) {
            addCriterion("sunset_time between", value1, value2, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andSunsetTimeNotBetween(String value1, String value2) {
            addCriterion("sunset_time not between", value1, value2, "sunsetTime");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureIsNull() {
            addCriterion("min_temperature is null");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureIsNotNull() {
            addCriterion("min_temperature is not null");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureEqualTo(String value) {
            addCriterion("min_temperature =", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureNotEqualTo(String value) {
            addCriterion("min_temperature <>", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureGreaterThan(String value) {
            addCriterion("min_temperature >", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureGreaterThanOrEqualTo(String value) {
            addCriterion("min_temperature >=", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureLessThan(String value) {
            addCriterion("min_temperature <", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureLessThanOrEqualTo(String value) {
            addCriterion("min_temperature <=", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureLike(String value) {
            addCriterion("min_temperature like", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureNotLike(String value) {
            addCriterion("min_temperature not like", value, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureIn(List<String> values) {
            addCriterion("min_temperature in", values, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureNotIn(List<String> values) {
            addCriterion("min_temperature not in", values, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureBetween(String value1, String value2) {
            addCriterion("min_temperature between", value1, value2, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMinTemperatureNotBetween(String value1, String value2) {
            addCriterion("min_temperature not between", value1, value2, "minTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureIsNull() {
            addCriterion("max_temperature is null");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureIsNotNull() {
            addCriterion("max_temperature is not null");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureEqualTo(String value) {
            addCriterion("max_temperature =", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureNotEqualTo(String value) {
            addCriterion("max_temperature <>", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureGreaterThan(String value) {
            addCriterion("max_temperature >", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureGreaterThanOrEqualTo(String value) {
            addCriterion("max_temperature >=", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureLessThan(String value) {
            addCriterion("max_temperature <", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureLessThanOrEqualTo(String value) {
            addCriterion("max_temperature <=", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureLike(String value) {
            addCriterion("max_temperature like", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureNotLike(String value) {
            addCriterion("max_temperature not like", value, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureIn(List<String> values) {
            addCriterion("max_temperature in", values, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureNotIn(List<String> values) {
            addCriterion("max_temperature not in", values, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureBetween(String value1, String value2) {
            addCriterion("max_temperature between", value1, value2, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andMaxTemperatureNotBetween(String value1, String value2) {
            addCriterion("max_temperature not between", value1, value2, "maxTemperature");
            return (Criteria) this;
        }

        public Criteria andDayWeatherIsNull() {
            addCriterion("day_weather is null");
            return (Criteria) this;
        }

        public Criteria andDayWeatherIsNotNull() {
            addCriterion("day_weather is not null");
            return (Criteria) this;
        }

        public Criteria andDayWeatherEqualTo(String value) {
            addCriterion("day_weather =", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherNotEqualTo(String value) {
            addCriterion("day_weather <>", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherGreaterThan(String value) {
            addCriterion("day_weather >", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherGreaterThanOrEqualTo(String value) {
            addCriterion("day_weather >=", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherLessThan(String value) {
            addCriterion("day_weather <", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherLessThanOrEqualTo(String value) {
            addCriterion("day_weather <=", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherLike(String value) {
            addCriterion("day_weather like", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherNotLike(String value) {
            addCriterion("day_weather not like", value, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherIn(List<String> values) {
            addCriterion("day_weather in", values, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherNotIn(List<String> values) {
            addCriterion("day_weather not in", values, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherBetween(String value1, String value2) {
            addCriterion("day_weather between", value1, value2, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andDayWeatherNotBetween(String value1, String value2) {
            addCriterion("day_weather not between", value1, value2, "dayWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherIsNull() {
            addCriterion("night_weather is null");
            return (Criteria) this;
        }

        public Criteria andNightWeatherIsNotNull() {
            addCriterion("night_weather is not null");
            return (Criteria) this;
        }

        public Criteria andNightWeatherEqualTo(String value) {
            addCriterion("night_weather =", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherNotEqualTo(String value) {
            addCriterion("night_weather <>", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherGreaterThan(String value) {
            addCriterion("night_weather >", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherGreaterThanOrEqualTo(String value) {
            addCriterion("night_weather >=", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherLessThan(String value) {
            addCriterion("night_weather <", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherLessThanOrEqualTo(String value) {
            addCriterion("night_weather <=", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherLike(String value) {
            addCriterion("night_weather like", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherNotLike(String value) {
            addCriterion("night_weather not like", value, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherIn(List<String> values) {
            addCriterion("night_weather in", values, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherNotIn(List<String> values) {
            addCriterion("night_weather not in", values, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherBetween(String value1, String value2) {
            addCriterion("night_weather between", value1, value2, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andNightWeatherNotBetween(String value1, String value2) {
            addCriterion("night_weather not between", value1, value2, "nightWeather");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeIsNull() {
            addCriterion("last_update_time is null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeIsNotNull() {
            addCriterion("last_update_time is not null");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeEqualTo(Date value) {
            addCriterion("last_update_time =", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeNotEqualTo(Date value) {
            addCriterion("last_update_time <>", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeGreaterThan(Date value) {
            addCriterion("last_update_time >", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("last_update_time >=", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeLessThan(Date value) {
            addCriterion("last_update_time <", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeLessThanOrEqualTo(Date value) {
            addCriterion("last_update_time <=", value, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeIn(List<Date> values) {
            addCriterion("last_update_time in", values, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeNotIn(List<Date> values) {
            addCriterion("last_update_time not in", values, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeBetween(Date value1, Date value2) {
            addCriterion("last_update_time between", value1, value2, "lastUpdateTime");
            return (Criteria) this;
        }

        public Criteria andLastUpdateTimeNotBetween(Date value1, Date value2) {
            addCriterion("last_update_time not between", value1, value2, "lastUpdateTime");
            return (Criteria) this;
        }
    }

    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}