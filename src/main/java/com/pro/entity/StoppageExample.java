package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class StoppageExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public StoppageExample() {
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

        public Criteria andStoppageIdIsNull() {
            addCriterion("stoppage_id is null");
            return (Criteria) this;
        }

        public Criteria andStoppageIdIsNotNull() {
            addCriterion("stoppage_id is not null");
            return (Criteria) this;
        }

        public Criteria andStoppageIdEqualTo(Long value) {
            addCriterion("stoppage_id =", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdNotEqualTo(Long value) {
            addCriterion("stoppage_id <>", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdGreaterThan(Long value) {
            addCriterion("stoppage_id >", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdGreaterThanOrEqualTo(Long value) {
            addCriterion("stoppage_id >=", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdLessThan(Long value) {
            addCriterion("stoppage_id <", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdLessThanOrEqualTo(Long value) {
            addCriterion("stoppage_id <=", value, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdIn(List<Long> values) {
            addCriterion("stoppage_id in", values, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdNotIn(List<Long> values) {
            addCriterion("stoppage_id not in", values, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdBetween(Long value1, Long value2) {
            addCriterion("stoppage_id between", value1, value2, "stoppageId");
            return (Criteria) this;
        }

        public Criteria andStoppageIdNotBetween(Long value1, Long value2) {
            addCriterion("stoppage_id not between", value1, value2, "stoppageId");
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

        public Criteria andStoppageNoIsNull() {
            addCriterion("stoppage_no is null");
            return (Criteria) this;
        }

        public Criteria andStoppageNoIsNotNull() {
            addCriterion("stoppage_no is not null");
            return (Criteria) this;
        }

        public Criteria andStoppageNoEqualTo(String value) {
            addCriterion("stoppage_no =", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoNotEqualTo(String value) {
            addCriterion("stoppage_no <>", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoGreaterThan(String value) {
            addCriterion("stoppage_no >", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoGreaterThanOrEqualTo(String value) {
            addCriterion("stoppage_no >=", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoLessThan(String value) {
            addCriterion("stoppage_no <", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoLessThanOrEqualTo(String value) {
            addCriterion("stoppage_no <=", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoLike(String value) {
            addCriterion("stoppage_no like", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoNotLike(String value) {
            addCriterion("stoppage_no not like", value, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoIn(List<String> values) {
            addCriterion("stoppage_no in", values, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoNotIn(List<String> values) {
            addCriterion("stoppage_no not in", values, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoBetween(String value1, String value2) {
            addCriterion("stoppage_no between", value1, value2, "stoppageNo");
            return (Criteria) this;
        }

        public Criteria andStoppageNoNotBetween(String value1, String value2) {
            addCriterion("stoppage_no not between", value1, value2, "stoppageNo");
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

        public Criteria andDescriptIsNull() {
            addCriterion("descript is null");
            return (Criteria) this;
        }

        public Criteria andDescriptIsNotNull() {
            addCriterion("descript is not null");
            return (Criteria) this;
        }

        public Criteria andDescriptEqualTo(String value) {
            addCriterion("descript =", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptNotEqualTo(String value) {
            addCriterion("descript <>", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptGreaterThan(String value) {
            addCriterion("descript >", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptGreaterThanOrEqualTo(String value) {
            addCriterion("descript >=", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptLessThan(String value) {
            addCriterion("descript <", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptLessThanOrEqualTo(String value) {
            addCriterion("descript <=", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptLike(String value) {
            addCriterion("descript like", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptNotLike(String value) {
            addCriterion("descript not like", value, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptIn(List<String> values) {
            addCriterion("descript in", values, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptNotIn(List<String> values) {
            addCriterion("descript not in", values, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptBetween(String value1, String value2) {
            addCriterion("descript between", value1, value2, "descript");
            return (Criteria) this;
        }

        public Criteria andDescriptNotBetween(String value1, String value2) {
            addCriterion("descript not between", value1, value2, "descript");
            return (Criteria) this;
        }

        public Criteria andAttachIdIsNull() {
            addCriterion("attach_id is null");
            return (Criteria) this;
        }

        public Criteria andAttachIdIsNotNull() {
            addCriterion("attach_id is not null");
            return (Criteria) this;
        }

        public Criteria andAttachIdEqualTo(Long value) {
            addCriterion("attach_id =", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdNotEqualTo(Long value) {
            addCriterion("attach_id <>", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdGreaterThan(Long value) {
            addCriterion("attach_id >", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdGreaterThanOrEqualTo(Long value) {
            addCriterion("attach_id >=", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdLessThan(Long value) {
            addCriterion("attach_id <", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdLessThanOrEqualTo(Long value) {
            addCriterion("attach_id <=", value, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdIn(List<Long> values) {
            addCriterion("attach_id in", values, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdNotIn(List<Long> values) {
            addCriterion("attach_id not in", values, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdBetween(Long value1, Long value2) {
            addCriterion("attach_id between", value1, value2, "attachId");
            return (Criteria) this;
        }

        public Criteria andAttachIdNotBetween(Long value1, Long value2) {
            addCriterion("attach_id not between", value1, value2, "attachId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdIsNull() {
            addCriterion("originator_id is null");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdIsNotNull() {
            addCriterion("originator_id is not null");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdEqualTo(Long value) {
            addCriterion("originator_id =", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdNotEqualTo(Long value) {
            addCriterion("originator_id <>", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdGreaterThan(Long value) {
            addCriterion("originator_id >", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdGreaterThanOrEqualTo(Long value) {
            addCriterion("originator_id >=", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdLessThan(Long value) {
            addCriterion("originator_id <", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdLessThanOrEqualTo(Long value) {
            addCriterion("originator_id <=", value, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdIn(List<Long> values) {
            addCriterion("originator_id in", values, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdNotIn(List<Long> values) {
            addCriterion("originator_id not in", values, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdBetween(Long value1, Long value2) {
            addCriterion("originator_id between", value1, value2, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOriginatorIdNotBetween(Long value1, Long value2) {
            addCriterion("originator_id not between", value1, value2, "originatorId");
            return (Criteria) this;
        }

        public Criteria andOccurTimeIsNull() {
            addCriterion("occur_time is null");
            return (Criteria) this;
        }

        public Criteria andOccurTimeIsNotNull() {
            addCriterion("occur_time is not null");
            return (Criteria) this;
        }

        public Criteria andOccurTimeEqualTo(Date value) {
            addCriterion("occur_time =", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeNotEqualTo(Date value) {
            addCriterion("occur_time <>", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeGreaterThan(Date value) {
            addCriterion("occur_time >", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("occur_time >=", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeLessThan(Date value) {
            addCriterion("occur_time <", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeLessThanOrEqualTo(Date value) {
            addCriterion("occur_time <=", value, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeIn(List<Date> values) {
            addCriterion("occur_time in", values, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeNotIn(List<Date> values) {
            addCriterion("occur_time not in", values, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeBetween(Date value1, Date value2) {
            addCriterion("occur_time between", value1, value2, "occurTime");
            return (Criteria) this;
        }

        public Criteria andOccurTimeNotBetween(Date value1, Date value2) {
            addCriterion("occur_time not between", value1, value2, "occurTime");
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

        public Criteria andHandleModifyTimeIsNull() {
            addCriterion("handle_modify_time is null");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeIsNotNull() {
            addCriterion("handle_modify_time is not null");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeEqualTo(Date value) {
            addCriterion("handle_modify_time =", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeNotEqualTo(Date value) {
            addCriterion("handle_modify_time <>", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeGreaterThan(Date value) {
            addCriterion("handle_modify_time >", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("handle_modify_time >=", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeLessThan(Date value) {
            addCriterion("handle_modify_time <", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeLessThanOrEqualTo(Date value) {
            addCriterion("handle_modify_time <=", value, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeIn(List<Date> values) {
            addCriterion("handle_modify_time in", values, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeNotIn(List<Date> values) {
            addCriterion("handle_modify_time not in", values, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeBetween(Date value1, Date value2) {
            addCriterion("handle_modify_time between", value1, value2, "handleModifyTime");
            return (Criteria) this;
        }

        public Criteria andHandleModifyTimeNotBetween(Date value1, Date value2) {
            addCriterion("handle_modify_time not between", value1, value2, "handleModifyTime");
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