package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class WeatherAlarmExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WeatherAlarmExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
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

        public Criteria andEarlyWarnTimeIsNull() {
            addCriterion("early_warn_time is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeIsNotNull() {
            addCriterion("early_warn_time is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeEqualTo(Date value) {
            addCriterionForJDBCDate("early_warn_time =", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeNotEqualTo(Date value) {
            addCriterionForJDBCDate("early_warn_time <>", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeGreaterThan(Date value) {
            addCriterionForJDBCDate("early_warn_time >", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("early_warn_time >=", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeLessThan(Date value) {
            addCriterionForJDBCDate("early_warn_time <", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("early_warn_time <=", value, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeIn(List<Date> values) {
            addCriterionForJDBCDate("early_warn_time in", values, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeNotIn(List<Date> values) {
            addCriterionForJDBCDate("early_warn_time not in", values, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("early_warn_time between", value1, value2, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTimeNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("early_warn_time not between", value1, value2, "earlyWarnTime");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelIsNull() {
            addCriterion("early_warn_level is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelIsNotNull() {
            addCriterion("early_warn_level is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelEqualTo(String value) {
            addCriterion("early_warn_level =", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelNotEqualTo(String value) {
            addCriterion("early_warn_level <>", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelGreaterThan(String value) {
            addCriterion("early_warn_level >", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelGreaterThanOrEqualTo(String value) {
            addCriterion("early_warn_level >=", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelLessThan(String value) {
            addCriterion("early_warn_level <", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelLessThanOrEqualTo(String value) {
            addCriterion("early_warn_level <=", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelLike(String value) {
            addCriterion("early_warn_level like", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelNotLike(String value) {
            addCriterion("early_warn_level not like", value, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelIn(List<String> values) {
            addCriterion("early_warn_level in", values, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelNotIn(List<String> values) {
            addCriterion("early_warn_level not in", values, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelBetween(String value1, String value2) {
            addCriterion("early_warn_level between", value1, value2, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnLevelNotBetween(String value1, String value2) {
            addCriterion("early_warn_level not between", value1, value2, "earlyWarnLevel");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatIsNull() {
            addCriterion("early_warn_stat is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatIsNotNull() {
            addCriterion("early_warn_stat is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatEqualTo(String value) {
            addCriterion("early_warn_stat =", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatNotEqualTo(String value) {
            addCriterion("early_warn_stat <>", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatGreaterThan(String value) {
            addCriterion("early_warn_stat >", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatGreaterThanOrEqualTo(String value) {
            addCriterion("early_warn_stat >=", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatLessThan(String value) {
            addCriterion("early_warn_stat <", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatLessThanOrEqualTo(String value) {
            addCriterion("early_warn_stat <=", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatLike(String value) {
            addCriterion("early_warn_stat like", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatNotLike(String value) {
            addCriterion("early_warn_stat not like", value, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatIn(List<String> values) {
            addCriterion("early_warn_stat in", values, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatNotIn(List<String> values) {
            addCriterion("early_warn_stat not in", values, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatBetween(String value1, String value2) {
            addCriterion("early_warn_stat between", value1, value2, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnStatNotBetween(String value1, String value2) {
            addCriterion("early_warn_stat not between", value1, value2, "earlyWarnStat");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeIsNull() {
            addCriterion("early_warn_type is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeIsNotNull() {
            addCriterion("early_warn_type is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeEqualTo(String value) {
            addCriterion("early_warn_type =", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeNotEqualTo(String value) {
            addCriterion("early_warn_type <>", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeGreaterThan(String value) {
            addCriterion("early_warn_type >", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeGreaterThanOrEqualTo(String value) {
            addCriterion("early_warn_type >=", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeLessThan(String value) {
            addCriterion("early_warn_type <", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeLessThanOrEqualTo(String value) {
            addCriterion("early_warn_type <=", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeLike(String value) {
            addCriterion("early_warn_type like", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeNotLike(String value) {
            addCriterion("early_warn_type not like", value, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeIn(List<String> values) {
            addCriterion("early_warn_type in", values, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeNotIn(List<String> values) {
            addCriterion("early_warn_type not in", values, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeBetween(String value1, String value2) {
            addCriterion("early_warn_type between", value1, value2, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTypeNotBetween(String value1, String value2) {
            addCriterion("early_warn_type not between", value1, value2, "earlyWarnType");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleIsNull() {
            addCriterion("early_warn_title is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleIsNotNull() {
            addCriterion("early_warn_title is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleEqualTo(String value) {
            addCriterion("early_warn_title =", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleNotEqualTo(String value) {
            addCriterion("early_warn_title <>", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleGreaterThan(String value) {
            addCriterion("early_warn_title >", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleGreaterThanOrEqualTo(String value) {
            addCriterion("early_warn_title >=", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleLessThan(String value) {
            addCriterion("early_warn_title <", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleLessThanOrEqualTo(String value) {
            addCriterion("early_warn_title <=", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleLike(String value) {
            addCriterion("early_warn_title like", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleNotLike(String value) {
            addCriterion("early_warn_title not like", value, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleIn(List<String> values) {
            addCriterion("early_warn_title in", values, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleNotIn(List<String> values) {
            addCriterion("early_warn_title not in", values, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleBetween(String value1, String value2) {
            addCriterion("early_warn_title between", value1, value2, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTitleNotBetween(String value1, String value2) {
            addCriterion("early_warn_title not between", value1, value2, "earlyWarnTitle");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtIsNull() {
            addCriterion("early_warn_txt is null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtIsNotNull() {
            addCriterion("early_warn_txt is not null");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtEqualTo(String value) {
            addCriterion("early_warn_txt =", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtNotEqualTo(String value) {
            addCriterion("early_warn_txt <>", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtGreaterThan(String value) {
            addCriterion("early_warn_txt >", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtGreaterThanOrEqualTo(String value) {
            addCriterion("early_warn_txt >=", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtLessThan(String value) {
            addCriterion("early_warn_txt <", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtLessThanOrEqualTo(String value) {
            addCriterion("early_warn_txt <=", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtLike(String value) {
            addCriterion("early_warn_txt like", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtNotLike(String value) {
            addCriterion("early_warn_txt not like", value, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtIn(List<String> values) {
            addCriterion("early_warn_txt in", values, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtNotIn(List<String> values) {
            addCriterion("early_warn_txt not in", values, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtBetween(String value1, String value2) {
            addCriterion("early_warn_txt between", value1, value2, "earlyWarnTxt");
            return (Criteria) this;
        }

        public Criteria andEarlyWarnTxtNotBetween(String value1, String value2) {
            addCriterion("early_warn_txt not between", value1, value2, "earlyWarnTxt");
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