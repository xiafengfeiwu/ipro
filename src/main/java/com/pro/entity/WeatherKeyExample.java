package com.pro.entity;

import java.util.ArrayList;
import java.util.List;

public class WeatherKeyExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WeatherKeyExample() {
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

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Long value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Long value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Long value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Long value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Long value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Long value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Long> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Long> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Long value1, Long value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Long value1, Long value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyIsNull() {
            addCriterion("weather_key is null");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyIsNotNull() {
            addCriterion("weather_key is not null");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyEqualTo(String value) {
            addCriterion("weather_key =", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyNotEqualTo(String value) {
            addCriterion("weather_key <>", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyGreaterThan(String value) {
            addCriterion("weather_key >", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyGreaterThanOrEqualTo(String value) {
            addCriterion("weather_key >=", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyLessThan(String value) {
            addCriterion("weather_key <", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyLessThanOrEqualTo(String value) {
            addCriterion("weather_key <=", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyLike(String value) {
            addCriterion("weather_key like", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyNotLike(String value) {
            addCriterion("weather_key not like", value, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyIn(List<String> values) {
            addCriterion("weather_key in", values, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyNotIn(List<String> values) {
            addCriterion("weather_key not in", values, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyBetween(String value1, String value2) {
            addCriterion("weather_key between", value1, value2, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherKeyNotBetween(String value1, String value2) {
            addCriterion("weather_key not between", value1, value2, "weatherKey");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailIsNull() {
            addCriterion("weather_email is null");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailIsNotNull() {
            addCriterion("weather_email is not null");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailEqualTo(String value) {
            addCriterion("weather_email =", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailNotEqualTo(String value) {
            addCriterion("weather_email <>", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailGreaterThan(String value) {
            addCriterion("weather_email >", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailGreaterThanOrEqualTo(String value) {
            addCriterion("weather_email >=", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailLessThan(String value) {
            addCriterion("weather_email <", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailLessThanOrEqualTo(String value) {
            addCriterion("weather_email <=", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailLike(String value) {
            addCriterion("weather_email like", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailNotLike(String value) {
            addCriterion("weather_email not like", value, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailIn(List<String> values) {
            addCriterion("weather_email in", values, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailNotIn(List<String> values) {
            addCriterion("weather_email not in", values, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailBetween(String value1, String value2) {
            addCriterion("weather_email between", value1, value2, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailNotBetween(String value1, String value2) {
            addCriterion("weather_email not between", value1, value2, "weatherEmail");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordIsNull() {
            addCriterion("weather_email_password is null");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordIsNotNull() {
            addCriterion("weather_email_password is not null");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordEqualTo(String value) {
            addCriterion("weather_email_password =", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordNotEqualTo(String value) {
            addCriterion("weather_email_password <>", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordGreaterThan(String value) {
            addCriterion("weather_email_password >", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordGreaterThanOrEqualTo(String value) {
            addCriterion("weather_email_password >=", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordLessThan(String value) {
            addCriterion("weather_email_password <", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordLessThanOrEqualTo(String value) {
            addCriterion("weather_email_password <=", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordLike(String value) {
            addCriterion("weather_email_password like", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordNotLike(String value) {
            addCriterion("weather_email_password not like", value, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordIn(List<String> values) {
            addCriterion("weather_email_password in", values, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordNotIn(List<String> values) {
            addCriterion("weather_email_password not in", values, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordBetween(String value1, String value2) {
            addCriterion("weather_email_password between", value1, value2, "weatherEmailPassword");
            return (Criteria) this;
        }

        public Criteria andWeatherEmailPasswordNotBetween(String value1, String value2) {
            addCriterion("weather_email_password not between", value1, value2, "weatherEmailPassword");
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