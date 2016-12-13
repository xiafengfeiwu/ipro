package com.pro.entity;

import java.util.ArrayList;
import java.util.List;

public class WebSystemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WebSystemExample() {
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

        public Criteria andSystemLogoUrlIsNull() {
            addCriterion("system_logo_url is null");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlIsNotNull() {
            addCriterion("system_logo_url is not null");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlEqualTo(String value) {
            addCriterion("system_logo_url =", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlNotEqualTo(String value) {
            addCriterion("system_logo_url <>", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlGreaterThan(String value) {
            addCriterion("system_logo_url >", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlGreaterThanOrEqualTo(String value) {
            addCriterion("system_logo_url >=", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlLessThan(String value) {
            addCriterion("system_logo_url <", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlLessThanOrEqualTo(String value) {
            addCriterion("system_logo_url <=", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlLike(String value) {
            addCriterion("system_logo_url like", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlNotLike(String value) {
            addCriterion("system_logo_url not like", value, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlIn(List<String> values) {
            addCriterion("system_logo_url in", values, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlNotIn(List<String> values) {
            addCriterion("system_logo_url not in", values, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlBetween(String value1, String value2) {
            addCriterion("system_logo_url between", value1, value2, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemLogoUrlNotBetween(String value1, String value2) {
            addCriterion("system_logo_url not between", value1, value2, "systemLogoUrl");
            return (Criteria) this;
        }

        public Criteria andSystemTitleIsNull() {
            addCriterion("system_title is null");
            return (Criteria) this;
        }

        public Criteria andSystemTitleIsNotNull() {
            addCriterion("system_title is not null");
            return (Criteria) this;
        }

        public Criteria andSystemTitleEqualTo(String value) {
            addCriterion("system_title =", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotEqualTo(String value) {
            addCriterion("system_title <>", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleGreaterThan(String value) {
            addCriterion("system_title >", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleGreaterThanOrEqualTo(String value) {
            addCriterion("system_title >=", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLessThan(String value) {
            addCriterion("system_title <", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLessThanOrEqualTo(String value) {
            addCriterion("system_title <=", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLike(String value) {
            addCriterion("system_title like", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotLike(String value) {
            addCriterion("system_title not like", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleIn(List<String> values) {
            addCriterion("system_title in", values, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotIn(List<String> values) {
            addCriterion("system_title not in", values, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleBetween(String value1, String value2) {
            addCriterion("system_title between", value1, value2, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotBetween(String value1, String value2) {
            addCriterion("system_title not between", value1, value2, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinIsNull() {
            addCriterion("system_jian_pin is null");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinIsNotNull() {
            addCriterion("system_jian_pin is not null");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinEqualTo(String value) {
            addCriterion("system_jian_pin =", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinNotEqualTo(String value) {
            addCriterion("system_jian_pin <>", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinGreaterThan(String value) {
            addCriterion("system_jian_pin >", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinGreaterThanOrEqualTo(String value) {
            addCriterion("system_jian_pin >=", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinLessThan(String value) {
            addCriterion("system_jian_pin <", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinLessThanOrEqualTo(String value) {
            addCriterion("system_jian_pin <=", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinLike(String value) {
            addCriterion("system_jian_pin like", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinNotLike(String value) {
            addCriterion("system_jian_pin not like", value, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinIn(List<String> values) {
            addCriterion("system_jian_pin in", values, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinNotIn(List<String> values) {
            addCriterion("system_jian_pin not in", values, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinBetween(String value1, String value2) {
            addCriterion("system_jian_pin between", value1, value2, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemJianPinNotBetween(String value1, String value2) {
            addCriterion("system_jian_pin not between", value1, value2, "systemJianPin");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportIsNull() {
            addCriterion("system_technical_support is null");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportIsNotNull() {
            addCriterion("system_technical_support is not null");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportEqualTo(String value) {
            addCriterion("system_technical_support =", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportNotEqualTo(String value) {
            addCriterion("system_technical_support <>", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportGreaterThan(String value) {
            addCriterion("system_technical_support >", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportGreaterThanOrEqualTo(String value) {
            addCriterion("system_technical_support >=", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportLessThan(String value) {
            addCriterion("system_technical_support <", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportLessThanOrEqualTo(String value) {
            addCriterion("system_technical_support <=", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportLike(String value) {
            addCriterion("system_technical_support like", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportNotLike(String value) {
            addCriterion("system_technical_support not like", value, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportIn(List<String> values) {
            addCriterion("system_technical_support in", values, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportNotIn(List<String> values) {
            addCriterion("system_technical_support not in", values, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportBetween(String value1, String value2) {
            addCriterion("system_technical_support between", value1, value2, "systemTechnicalSupport");
            return (Criteria) this;
        }

        public Criteria andSystemTechnicalSupportNotBetween(String value1, String value2) {
            addCriterion("system_technical_support not between", value1, value2, "systemTechnicalSupport");
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