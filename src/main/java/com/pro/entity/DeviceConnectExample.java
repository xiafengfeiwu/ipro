package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class DeviceConnectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public DeviceConnectExample() {
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

        public Criteria andConnectIdIsNull() {
            addCriterion("connect_id is null");
            return (Criteria) this;
        }

        public Criteria andConnectIdIsNotNull() {
            addCriterion("connect_id is not null");
            return (Criteria) this;
        }

        public Criteria andConnectIdEqualTo(Long value) {
            addCriterion("connect_id =", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdNotEqualTo(Long value) {
            addCriterion("connect_id <>", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdGreaterThan(Long value) {
            addCriterion("connect_id >", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdGreaterThanOrEqualTo(Long value) {
            addCriterion("connect_id >=", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdLessThan(Long value) {
            addCriterion("connect_id <", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdLessThanOrEqualTo(Long value) {
            addCriterion("connect_id <=", value, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdIn(List<Long> values) {
            addCriterion("connect_id in", values, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdNotIn(List<Long> values) {
            addCriterion("connect_id not in", values, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdBetween(Long value1, Long value2) {
            addCriterion("connect_id between", value1, value2, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIdNotBetween(Long value1, Long value2) {
            addCriterion("connect_id not between", value1, value2, "connectId");
            return (Criteria) this;
        }

        public Criteria andConnectIpIsNull() {
            addCriterion("connect_ip is null");
            return (Criteria) this;
        }

        public Criteria andConnectIpIsNotNull() {
            addCriterion("connect_ip is not null");
            return (Criteria) this;
        }

        public Criteria andConnectIpEqualTo(String value) {
            addCriterion("connect_ip =", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpNotEqualTo(String value) {
            addCriterion("connect_ip <>", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpGreaterThan(String value) {
            addCriterion("connect_ip >", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpGreaterThanOrEqualTo(String value) {
            addCriterion("connect_ip >=", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpLessThan(String value) {
            addCriterion("connect_ip <", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpLessThanOrEqualTo(String value) {
            addCriterion("connect_ip <=", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpLike(String value) {
            addCriterion("connect_ip like", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpNotLike(String value) {
            addCriterion("connect_ip not like", value, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpIn(List<String> values) {
            addCriterion("connect_ip in", values, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpNotIn(List<String> values) {
            addCriterion("connect_ip not in", values, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpBetween(String value1, String value2) {
            addCriterion("connect_ip between", value1, value2, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectIpNotBetween(String value1, String value2) {
            addCriterion("connect_ip not between", value1, value2, "connectIp");
            return (Criteria) this;
        }

        public Criteria andConnectPortIsNull() {
            addCriterion("connect_port is null");
            return (Criteria) this;
        }

        public Criteria andConnectPortIsNotNull() {
            addCriterion("connect_port is not null");
            return (Criteria) this;
        }

        public Criteria andConnectPortEqualTo(Integer value) {
            addCriterion("connect_port =", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortNotEqualTo(Integer value) {
            addCriterion("connect_port <>", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortGreaterThan(Integer value) {
            addCriterion("connect_port >", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortGreaterThanOrEqualTo(Integer value) {
            addCriterion("connect_port >=", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortLessThan(Integer value) {
            addCriterion("connect_port <", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortLessThanOrEqualTo(Integer value) {
            addCriterion("connect_port <=", value, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortIn(List<Integer> values) {
            addCriterion("connect_port in", values, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortNotIn(List<Integer> values) {
            addCriterion("connect_port not in", values, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortBetween(Integer value1, Integer value2) {
            addCriterion("connect_port between", value1, value2, "connectPort");
            return (Criteria) this;
        }

        public Criteria andConnectPortNotBetween(Integer value1, Integer value2) {
            addCriterion("connect_port not between", value1, value2, "connectPort");
            return (Criteria) this;
        }

        public Criteria andDeviceSnIsNull() {
            addCriterion("device_sn is null");
            return (Criteria) this;
        }

        public Criteria andDeviceSnIsNotNull() {
            addCriterion("device_sn is not null");
            return (Criteria) this;
        }

        public Criteria andDeviceSnEqualTo(String value) {
            addCriterion("device_sn =", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnNotEqualTo(String value) {
            addCriterion("device_sn <>", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnGreaterThan(String value) {
            addCriterion("device_sn >", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnGreaterThanOrEqualTo(String value) {
            addCriterion("device_sn >=", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnLessThan(String value) {
            addCriterion("device_sn <", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnLessThanOrEqualTo(String value) {
            addCriterion("device_sn <=", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnLike(String value) {
            addCriterion("device_sn like", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnNotLike(String value) {
            addCriterion("device_sn not like", value, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnIn(List<String> values) {
            addCriterion("device_sn in", values, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnNotIn(List<String> values) {
            addCriterion("device_sn not in", values, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnBetween(String value1, String value2) {
            addCriterion("device_sn between", value1, value2, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andDeviceSnNotBetween(String value1, String value2) {
            addCriterion("device_sn not between", value1, value2, "deviceSn");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNull() {
            addCriterion("create_time is null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIsNotNull() {
            addCriterion("create_time is not null");
            return (Criteria) this;
        }

        public Criteria andCreateTimeEqualTo(Date value) {
            addCriterion("create_time =", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotEqualTo(Date value) {
            addCriterion("create_time <>", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThan(Date value) {
            addCriterion("create_time >", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("create_time >=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThan(Date value) {
            addCriterion("create_time <", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("create_time <=", value, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeIn(List<Date> values) {
            addCriterion("create_time in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotIn(List<Date> values) {
            addCriterion("create_time not in", values, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeBetween(Date value1, Date value2) {
            addCriterion("create_time between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("create_time not between", value1, value2, "createTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeIsNull() {
            addCriterion("last_modify_time is null");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeIsNotNull() {
            addCriterion("last_modify_time is not null");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeEqualTo(Date value) {
            addCriterion("last_modify_time =", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeNotEqualTo(Date value) {
            addCriterion("last_modify_time <>", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeGreaterThan(Date value) {
            addCriterion("last_modify_time >", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("last_modify_time >=", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeLessThan(Date value) {
            addCriterion("last_modify_time <", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeLessThanOrEqualTo(Date value) {
            addCriterion("last_modify_time <=", value, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeIn(List<Date> values) {
            addCriterion("last_modify_time in", values, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeNotIn(List<Date> values) {
            addCriterion("last_modify_time not in", values, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeBetween(Date value1, Date value2) {
            addCriterion("last_modify_time between", value1, value2, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andLastModifyTimeNotBetween(Date value1, Date value2) {
            addCriterion("last_modify_time not between", value1, value2, "lastModifyTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeIsNull() {
            addCriterion("close_time is null");
            return (Criteria) this;
        }

        public Criteria andCloseTimeIsNotNull() {
            addCriterion("close_time is not null");
            return (Criteria) this;
        }

        public Criteria andCloseTimeEqualTo(Date value) {
            addCriterion("close_time =", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeNotEqualTo(Date value) {
            addCriterion("close_time <>", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeGreaterThan(Date value) {
            addCriterion("close_time >", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("close_time >=", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeLessThan(Date value) {
            addCriterion("close_time <", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeLessThanOrEqualTo(Date value) {
            addCriterion("close_time <=", value, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeIn(List<Date> values) {
            addCriterion("close_time in", values, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeNotIn(List<Date> values) {
            addCriterion("close_time not in", values, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeBetween(Date value1, Date value2) {
            addCriterion("close_time between", value1, value2, "closeTime");
            return (Criteria) this;
        }

        public Criteria andCloseTimeNotBetween(Date value1, Date value2) {
            addCriterion("close_time not between", value1, value2, "closeTime");
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