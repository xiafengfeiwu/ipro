package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WarnHandleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WarnHandleExample() {
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

        public Criteria andWarnHandleIdIsNull() {
            addCriterion("warn_handle_id is null");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdIsNotNull() {
            addCriterion("warn_handle_id is not null");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdEqualTo(Long value) {
            addCriterion("warn_handle_id =", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdNotEqualTo(Long value) {
            addCriterion("warn_handle_id <>", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdGreaterThan(Long value) {
            addCriterion("warn_handle_id >", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdGreaterThanOrEqualTo(Long value) {
            addCriterion("warn_handle_id >=", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdLessThan(Long value) {
            addCriterion("warn_handle_id <", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdLessThanOrEqualTo(Long value) {
            addCriterion("warn_handle_id <=", value, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdIn(List<Long> values) {
            addCriterion("warn_handle_id in", values, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdNotIn(List<Long> values) {
            addCriterion("warn_handle_id not in", values, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdBetween(Long value1, Long value2) {
            addCriterion("warn_handle_id between", value1, value2, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnHandleIdNotBetween(Long value1, Long value2) {
            addCriterion("warn_handle_id not between", value1, value2, "warnHandleId");
            return (Criteria) this;
        }

        public Criteria andWarnIdIsNull() {
            addCriterion("warn_id is null");
            return (Criteria) this;
        }

        public Criteria andWarnIdIsNotNull() {
            addCriterion("warn_id is not null");
            return (Criteria) this;
        }

        public Criteria andWarnIdEqualTo(Long value) {
            addCriterion("warn_id =", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdNotEqualTo(Long value) {
            addCriterion("warn_id <>", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdGreaterThan(Long value) {
            addCriterion("warn_id >", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdGreaterThanOrEqualTo(Long value) {
            addCriterion("warn_id >=", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdLessThan(Long value) {
            addCriterion("warn_id <", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdLessThanOrEqualTo(Long value) {
            addCriterion("warn_id <=", value, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdIn(List<Long> values) {
            addCriterion("warn_id in", values, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdNotIn(List<Long> values) {
            addCriterion("warn_id not in", values, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdBetween(Long value1, Long value2) {
            addCriterion("warn_id between", value1, value2, "warnId");
            return (Criteria) this;
        }

        public Criteria andWarnIdNotBetween(Long value1, Long value2) {
            addCriterion("warn_id not between", value1, value2, "warnId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdIsNull() {
            addCriterion("handle_user_id is null");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdIsNotNull() {
            addCriterion("handle_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdEqualTo(Long value) {
            addCriterion("handle_user_id =", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdNotEqualTo(Long value) {
            addCriterion("handle_user_id <>", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdGreaterThan(Long value) {
            addCriterion("handle_user_id >", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("handle_user_id >=", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdLessThan(Long value) {
            addCriterion("handle_user_id <", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdLessThanOrEqualTo(Long value) {
            addCriterion("handle_user_id <=", value, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdIn(List<Long> values) {
            addCriterion("handle_user_id in", values, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdNotIn(List<Long> values) {
            addCriterion("handle_user_id not in", values, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdBetween(Long value1, Long value2) {
            addCriterion("handle_user_id between", value1, value2, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleUserIdNotBetween(Long value1, Long value2) {
            addCriterion("handle_user_id not between", value1, value2, "handleUserId");
            return (Criteria) this;
        }

        public Criteria andHandleTimeIsNull() {
            addCriterion("handle_time is null");
            return (Criteria) this;
        }

        public Criteria andHandleTimeIsNotNull() {
            addCriterion("handle_time is not null");
            return (Criteria) this;
        }

        public Criteria andHandleTimeEqualTo(Date value) {
            addCriterion("handle_time =", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeNotEqualTo(Date value) {
            addCriterion("handle_time <>", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeGreaterThan(Date value) {
            addCriterion("handle_time >", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("handle_time >=", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeLessThan(Date value) {
            addCriterion("handle_time <", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeLessThanOrEqualTo(Date value) {
            addCriterion("handle_time <=", value, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeIn(List<Date> values) {
            addCriterion("handle_time in", values, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeNotIn(List<Date> values) {
            addCriterion("handle_time not in", values, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeBetween(Date value1, Date value2) {
            addCriterion("handle_time between", value1, value2, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleTimeNotBetween(Date value1, Date value2) {
            addCriterion("handle_time not between", value1, value2, "handleTime");
            return (Criteria) this;
        }

        public Criteria andHandleStatusIsNull() {
            addCriterion("handle_status is null");
            return (Criteria) this;
        }

        public Criteria andHandleStatusIsNotNull() {
            addCriterion("handle_status is not null");
            return (Criteria) this;
        }

        public Criteria andHandleStatusEqualTo(String value) {
            addCriterion("handle_status =", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusNotEqualTo(String value) {
            addCriterion("handle_status <>", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusGreaterThan(String value) {
            addCriterion("handle_status >", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusGreaterThanOrEqualTo(String value) {
            addCriterion("handle_status >=", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusLessThan(String value) {
            addCriterion("handle_status <", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusLessThanOrEqualTo(String value) {
            addCriterion("handle_status <=", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusLike(String value) {
            addCriterion("handle_status like", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusNotLike(String value) {
            addCriterion("handle_status not like", value, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusIn(List<String> values) {
            addCriterion("handle_status in", values, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusNotIn(List<String> values) {
            addCriterion("handle_status not in", values, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusBetween(String value1, String value2) {
            addCriterion("handle_status between", value1, value2, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleStatusNotBetween(String value1, String value2) {
            addCriterion("handle_status not between", value1, value2, "handleStatus");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptIsNull() {
            addCriterion("handle_descript is null");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptIsNotNull() {
            addCriterion("handle_descript is not null");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptEqualTo(String value) {
            addCriterion("handle_descript =", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptNotEqualTo(String value) {
            addCriterion("handle_descript <>", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptGreaterThan(String value) {
            addCriterion("handle_descript >", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptGreaterThanOrEqualTo(String value) {
            addCriterion("handle_descript >=", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptLessThan(String value) {
            addCriterion("handle_descript <", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptLessThanOrEqualTo(String value) {
            addCriterion("handle_descript <=", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptLike(String value) {
            addCriterion("handle_descript like", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptNotLike(String value) {
            addCriterion("handle_descript not like", value, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptIn(List<String> values) {
            addCriterion("handle_descript in", values, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptNotIn(List<String> values) {
            addCriterion("handle_descript not in", values, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptBetween(String value1, String value2) {
            addCriterion("handle_descript between", value1, value2, "handleDescript");
            return (Criteria) this;
        }

        public Criteria andHandleDescriptNotBetween(String value1, String value2) {
            addCriterion("handle_descript not between", value1, value2, "handleDescript");
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