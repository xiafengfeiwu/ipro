package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StoppageHandleEvaluateExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StoppageHandleEvaluateExample() {
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

        public Criteria andEvaluateIdIsNull() {
            addCriterion("evaluate_id is null");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdIsNotNull() {
            addCriterion("evaluate_id is not null");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdEqualTo(Long value) {
            addCriterion("evaluate_id =", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdNotEqualTo(Long value) {
            addCriterion("evaluate_id <>", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdGreaterThan(Long value) {
            addCriterion("evaluate_id >", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdGreaterThanOrEqualTo(Long value) {
            addCriterion("evaluate_id >=", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdLessThan(Long value) {
            addCriterion("evaluate_id <", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdLessThanOrEqualTo(Long value) {
            addCriterion("evaluate_id <=", value, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdIn(List<Long> values) {
            addCriterion("evaluate_id in", values, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdNotIn(List<Long> values) {
            addCriterion("evaluate_id not in", values, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdBetween(Long value1, Long value2) {
            addCriterion("evaluate_id between", value1, value2, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andEvaluateIdNotBetween(Long value1, Long value2) {
            addCriterion("evaluate_id not between", value1, value2, "evaluateId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdIsNull() {
            addCriterion("stoppage_handle_id is null");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdIsNotNull() {
            addCriterion("stoppage_handle_id is not null");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdEqualTo(Long value) {
            addCriterion("stoppage_handle_id =", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdNotEqualTo(Long value) {
            addCriterion("stoppage_handle_id <>", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdGreaterThan(Long value) {
            addCriterion("stoppage_handle_id >", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdGreaterThanOrEqualTo(Long value) {
            addCriterion("stoppage_handle_id >=", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdLessThan(Long value) {
            addCriterion("stoppage_handle_id <", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdLessThanOrEqualTo(Long value) {
            addCriterion("stoppage_handle_id <=", value, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdIn(List<Long> values) {
            addCriterion("stoppage_handle_id in", values, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdNotIn(List<Long> values) {
            addCriterion("stoppage_handle_id not in", values, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdBetween(Long value1, Long value2) {
            addCriterion("stoppage_handle_id between", value1, value2, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andStoppageHandleIdNotBetween(Long value1, Long value2) {
            addCriterion("stoppage_handle_id not between", value1, value2, "stoppageHandleId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdIsNull() {
            addCriterion("evaluate_user_id is null");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdIsNotNull() {
            addCriterion("evaluate_user_id is not null");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdEqualTo(Long value) {
            addCriterion("evaluate_user_id =", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdNotEqualTo(Long value) {
            addCriterion("evaluate_user_id <>", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdGreaterThan(Long value) {
            addCriterion("evaluate_user_id >", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("evaluate_user_id >=", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdLessThan(Long value) {
            addCriterion("evaluate_user_id <", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdLessThanOrEqualTo(Long value) {
            addCriterion("evaluate_user_id <=", value, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdIn(List<Long> values) {
            addCriterion("evaluate_user_id in", values, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdNotIn(List<Long> values) {
            addCriterion("evaluate_user_id not in", values, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdBetween(Long value1, Long value2) {
            addCriterion("evaluate_user_id between", value1, value2, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateUserIdNotBetween(Long value1, Long value2) {
            addCriterion("evaluate_user_id not between", value1, value2, "evaluateUserId");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeIsNull() {
            addCriterion("evaluate_time is null");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeIsNotNull() {
            addCriterion("evaluate_time is not null");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeEqualTo(Date value) {
            addCriterion("evaluate_time =", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeNotEqualTo(Date value) {
            addCriterion("evaluate_time <>", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeGreaterThan(Date value) {
            addCriterion("evaluate_time >", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("evaluate_time >=", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeLessThan(Date value) {
            addCriterion("evaluate_time <", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeLessThanOrEqualTo(Date value) {
            addCriterion("evaluate_time <=", value, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeIn(List<Date> values) {
            addCriterion("evaluate_time in", values, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeNotIn(List<Date> values) {
            addCriterion("evaluate_time not in", values, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeBetween(Date value1, Date value2) {
            addCriterion("evaluate_time between", value1, value2, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateTimeNotBetween(Date value1, Date value2) {
            addCriterion("evaluate_time not between", value1, value2, "evaluateTime");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelIsNull() {
            addCriterion("evaluate_level is null");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelIsNotNull() {
            addCriterion("evaluate_level is not null");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelEqualTo(String value) {
            addCriterion("evaluate_level =", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelNotEqualTo(String value) {
            addCriterion("evaluate_level <>", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelGreaterThan(String value) {
            addCriterion("evaluate_level >", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelGreaterThanOrEqualTo(String value) {
            addCriterion("evaluate_level >=", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelLessThan(String value) {
            addCriterion("evaluate_level <", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelLessThanOrEqualTo(String value) {
            addCriterion("evaluate_level <=", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelLike(String value) {
            addCriterion("evaluate_level like", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelNotLike(String value) {
            addCriterion("evaluate_level not like", value, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelIn(List<String> values) {
            addCriterion("evaluate_level in", values, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelNotIn(List<String> values) {
            addCriterion("evaluate_level not in", values, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelBetween(String value1, String value2) {
            addCriterion("evaluate_level between", value1, value2, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateLevelNotBetween(String value1, String value2) {
            addCriterion("evaluate_level not between", value1, value2, "evaluateLevel");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptIsNull() {
            addCriterion("evaluate_descript is null");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptIsNotNull() {
            addCriterion("evaluate_descript is not null");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptEqualTo(String value) {
            addCriterion("evaluate_descript =", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptNotEqualTo(String value) {
            addCriterion("evaluate_descript <>", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptGreaterThan(String value) {
            addCriterion("evaluate_descript >", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptGreaterThanOrEqualTo(String value) {
            addCriterion("evaluate_descript >=", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptLessThan(String value) {
            addCriterion("evaluate_descript <", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptLessThanOrEqualTo(String value) {
            addCriterion("evaluate_descript <=", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptLike(String value) {
            addCriterion("evaluate_descript like", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptNotLike(String value) {
            addCriterion("evaluate_descript not like", value, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptIn(List<String> values) {
            addCriterion("evaluate_descript in", values, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptNotIn(List<String> values) {
            addCriterion("evaluate_descript not in", values, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptBetween(String value1, String value2) {
            addCriterion("evaluate_descript between", value1, value2, "evaluateDescript");
            return (Criteria) this;
        }

        public Criteria andEvaluateDescriptNotBetween(String value1, String value2) {
            addCriterion("evaluate_descript not between", value1, value2, "evaluateDescript");
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