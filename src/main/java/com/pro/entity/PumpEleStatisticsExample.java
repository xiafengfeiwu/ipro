package com.pro.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class PumpEleStatisticsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PumpEleStatisticsExample() {
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

        public Criteria andDataIdIsNull() {
            addCriterion("data_id is null");
            return (Criteria) this;
        }

        public Criteria andDataIdIsNotNull() {
            addCriterion("data_id is not null");
            return (Criteria) this;
        }

        public Criteria andDataIdEqualTo(Long value) {
            addCriterion("data_id =", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdNotEqualTo(Long value) {
            addCriterion("data_id <>", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdGreaterThan(Long value) {
            addCriterion("data_id >", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdGreaterThanOrEqualTo(Long value) {
            addCriterion("data_id >=", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdLessThan(Long value) {
            addCriterion("data_id <", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdLessThanOrEqualTo(Long value) {
            addCriterion("data_id <=", value, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdIn(List<Long> values) {
            addCriterion("data_id in", values, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdNotIn(List<Long> values) {
            addCriterion("data_id not in", values, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdBetween(Long value1, Long value2) {
            addCriterion("data_id between", value1, value2, "dataId");
            return (Criteria) this;
        }

        public Criteria andDataIdNotBetween(Long value1, Long value2) {
            addCriterion("data_id not between", value1, value2, "dataId");
            return (Criteria) this;
        }

        public Criteria andPumpIdIsNull() {
            addCriterion("pump_id is null");
            return (Criteria) this;
        }

        public Criteria andPumpIdIsNotNull() {
            addCriterion("pump_id is not null");
            return (Criteria) this;
        }

        public Criteria andPumpIdEqualTo(Long value) {
            addCriterion("pump_id =", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdNotEqualTo(Long value) {
            addCriterion("pump_id <>", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdGreaterThan(Long value) {
            addCriterion("pump_id >", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdGreaterThanOrEqualTo(Long value) {
            addCriterion("pump_id >=", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdLessThan(Long value) {
            addCriterion("pump_id <", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdLessThanOrEqualTo(Long value) {
            addCriterion("pump_id <=", value, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdIn(List<Long> values) {
            addCriterion("pump_id in", values, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdNotIn(List<Long> values) {
            addCriterion("pump_id not in", values, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdBetween(Long value1, Long value2) {
            addCriterion("pump_id between", value1, value2, "pumpId");
            return (Criteria) this;
        }

        public Criteria andPumpIdNotBetween(Long value1, Long value2) {
            addCriterion("pump_id not between", value1, value2, "pumpId");
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

        public Criteria andCollectDateEqualTo(Date value) {
            addCriterionForJDBCDate("collect_date =", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("collect_date <>", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateGreaterThan(Date value) {
            addCriterionForJDBCDate("collect_date >", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("collect_date >=", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateLessThan(Date value) {
            addCriterionForJDBCDate("collect_date <", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("collect_date <=", value, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateIn(List<Date> values) {
            addCriterionForJDBCDate("collect_date in", values, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("collect_date not in", values, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("collect_date between", value1, value2, "collectDate");
            return (Criteria) this;
        }

        public Criteria andCollectDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("collect_date not between", value1, value2, "collectDate");
            return (Criteria) this;
        }

        public Criteria andEleTodayIsNull() {
            addCriterion("ele_today is null");
            return (Criteria) this;
        }

        public Criteria andEleTodayIsNotNull() {
            addCriterion("ele_today is not null");
            return (Criteria) this;
        }

        public Criteria andEleTodayEqualTo(BigDecimal value) {
            addCriterion("ele_today =", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayNotEqualTo(BigDecimal value) {
            addCriterion("ele_today <>", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayGreaterThan(BigDecimal value) {
            addCriterion("ele_today >", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("ele_today >=", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayLessThan(BigDecimal value) {
            addCriterion("ele_today <", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayLessThanOrEqualTo(BigDecimal value) {
            addCriterion("ele_today <=", value, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayIn(List<BigDecimal> values) {
            addCriterion("ele_today in", values, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayNotIn(List<BigDecimal> values) {
            addCriterion("ele_today not in", values, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("ele_today between", value1, value2, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTodayNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("ele_today not between", value1, value2, "eleToday");
            return (Criteria) this;
        }

        public Criteria andEleTotalIsNull() {
            addCriterion("ele_total is null");
            return (Criteria) this;
        }

        public Criteria andEleTotalIsNotNull() {
            addCriterion("ele_total is not null");
            return (Criteria) this;
        }

        public Criteria andEleTotalEqualTo(String value) {
            addCriterion("ele_total =", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalNotEqualTo(String value) {
            addCriterion("ele_total <>", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalGreaterThan(String value) {
            addCriterion("ele_total >", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalGreaterThanOrEqualTo(String value) {
            addCriterion("ele_total >=", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalLessThan(String value) {
            addCriterion("ele_total <", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalLessThanOrEqualTo(String value) {
            addCriterion("ele_total <=", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalLike(String value) {
            addCriterion("ele_total like", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalNotLike(String value) {
            addCriterion("ele_total not like", value, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalIn(List<String> values) {
            addCriterion("ele_total in", values, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalNotIn(List<String> values) {
            addCriterion("ele_total not in", values, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalBetween(String value1, String value2) {
            addCriterion("ele_total between", value1, value2, "eleTotal");
            return (Criteria) this;
        }

        public Criteria andEleTotalNotBetween(String value1, String value2) {
            addCriterion("ele_total not between", value1, value2, "eleTotal");
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