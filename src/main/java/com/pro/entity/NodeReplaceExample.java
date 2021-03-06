package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NodeReplaceExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NodeReplaceExample() {
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

        public Criteria andRecordIdIsNull() {
            addCriterion("record_id is null");
            return (Criteria) this;
        }

        public Criteria andRecordIdIsNotNull() {
            addCriterion("record_id is not null");
            return (Criteria) this;
        }

        public Criteria andRecordIdEqualTo(Long value) {
            addCriterion("record_id =", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotEqualTo(Long value) {
            addCriterion("record_id <>", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThan(Long value) {
            addCriterion("record_id >", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdGreaterThanOrEqualTo(Long value) {
            addCriterion("record_id >=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThan(Long value) {
            addCriterion("record_id <", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdLessThanOrEqualTo(Long value) {
            addCriterion("record_id <=", value, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdIn(List<Long> values) {
            addCriterion("record_id in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotIn(List<Long> values) {
            addCriterion("record_id not in", values, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdBetween(Long value1, Long value2) {
            addCriterion("record_id between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andRecordIdNotBetween(Long value1, Long value2) {
            addCriterion("record_id not between", value1, value2, "recordId");
            return (Criteria) this;
        }

        public Criteria andNodeIdIsNull() {
            addCriterion("node_id is null");
            return (Criteria) this;
        }

        public Criteria andNodeIdIsNotNull() {
            addCriterion("node_id is not null");
            return (Criteria) this;
        }

        public Criteria andNodeIdEqualTo(Long value) {
            addCriterion("node_id =", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotEqualTo(Long value) {
            addCriterion("node_id <>", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThan(Long value) {
            addCriterion("node_id >", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThanOrEqualTo(Long value) {
            addCriterion("node_id >=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThan(Long value) {
            addCriterion("node_id <", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThanOrEqualTo(Long value) {
            addCriterion("node_id <=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdIn(List<Long> values) {
            addCriterion("node_id in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotIn(List<Long> values) {
            addCriterion("node_id not in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdBetween(Long value1, Long value2) {
            addCriterion("node_id between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotBetween(Long value1, Long value2) {
            addCriterion("node_id not between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeIsNull() {
            addCriterion("replace_time is null");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeIsNotNull() {
            addCriterion("replace_time is not null");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeEqualTo(Date value) {
            addCriterion("replace_time =", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeNotEqualTo(Date value) {
            addCriterion("replace_time <>", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeGreaterThan(Date value) {
            addCriterion("replace_time >", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("replace_time >=", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeLessThan(Date value) {
            addCriterion("replace_time <", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeLessThanOrEqualTo(Date value) {
            addCriterion("replace_time <=", value, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeIn(List<Date> values) {
            addCriterion("replace_time in", values, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeNotIn(List<Date> values) {
            addCriterion("replace_time not in", values, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeBetween(Date value1, Date value2) {
            addCriterion("replace_time between", value1, value2, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceTimeNotBetween(Date value1, Date value2) {
            addCriterion("replace_time not between", value1, value2, "replaceTime");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptIsNull() {
            addCriterion("replace_descript is null");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptIsNotNull() {
            addCriterion("replace_descript is not null");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptEqualTo(String value) {
            addCriterion("replace_descript =", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptNotEqualTo(String value) {
            addCriterion("replace_descript <>", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptGreaterThan(String value) {
            addCriterion("replace_descript >", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptGreaterThanOrEqualTo(String value) {
            addCriterion("replace_descript >=", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptLessThan(String value) {
            addCriterion("replace_descript <", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptLessThanOrEqualTo(String value) {
            addCriterion("replace_descript <=", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptLike(String value) {
            addCriterion("replace_descript like", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptNotLike(String value) {
            addCriterion("replace_descript not like", value, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptIn(List<String> values) {
            addCriterion("replace_descript in", values, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptNotIn(List<String> values) {
            addCriterion("replace_descript not in", values, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptBetween(String value1, String value2) {
            addCriterion("replace_descript between", value1, value2, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andReplaceDescriptNotBetween(String value1, String value2) {
            addCriterion("replace_descript not between", value1, value2, "replaceDescript");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIsNull() {
            addCriterion("operator_id is null");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIsNotNull() {
            addCriterion("operator_id is not null");
            return (Criteria) this;
        }

        public Criteria andOperatorIdEqualTo(Long value) {
            addCriterion("operator_id =", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotEqualTo(Long value) {
            addCriterion("operator_id <>", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdGreaterThan(Long value) {
            addCriterion("operator_id >", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdGreaterThanOrEqualTo(Long value) {
            addCriterion("operator_id >=", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdLessThan(Long value) {
            addCriterion("operator_id <", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdLessThanOrEqualTo(Long value) {
            addCriterion("operator_id <=", value, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdIn(List<Long> values) {
            addCriterion("operator_id in", values, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotIn(List<Long> values) {
            addCriterion("operator_id not in", values, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdBetween(Long value1, Long value2) {
            addCriterion("operator_id between", value1, value2, "operatorId");
            return (Criteria) this;
        }

        public Criteria andOperatorIdNotBetween(Long value1, Long value2) {
            addCriterion("operator_id not between", value1, value2, "operatorId");
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