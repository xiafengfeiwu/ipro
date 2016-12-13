package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class SmsExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public SmsExample() {
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

        public Criteria andSmsIdIsNull() {
            addCriterion("sms_id is null");
            return (Criteria) this;
        }

        public Criteria andSmsIdIsNotNull() {
            addCriterion("sms_id is not null");
            return (Criteria) this;
        }

        public Criteria andSmsIdEqualTo(Long value) {
            addCriterion("sms_id =", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdNotEqualTo(Long value) {
            addCriterion("sms_id <>", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdGreaterThan(Long value) {
            addCriterion("sms_id >", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdGreaterThanOrEqualTo(Long value) {
            addCriterion("sms_id >=", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdLessThan(Long value) {
            addCriterion("sms_id <", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdLessThanOrEqualTo(Long value) {
            addCriterion("sms_id <=", value, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdIn(List<Long> values) {
            addCriterion("sms_id in", values, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdNotIn(List<Long> values) {
            addCriterion("sms_id not in", values, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdBetween(Long value1, Long value2) {
            addCriterion("sms_id between", value1, value2, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsIdNotBetween(Long value1, Long value2) {
            addCriterion("sms_id not between", value1, value2, "smsId");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoIsNull() {
            addCriterion("sms_phone_no is null");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoIsNotNull() {
            addCriterion("sms_phone_no is not null");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoEqualTo(String value) {
            addCriterion("sms_phone_no =", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoNotEqualTo(String value) {
            addCriterion("sms_phone_no <>", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoGreaterThan(String value) {
            addCriterion("sms_phone_no >", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoGreaterThanOrEqualTo(String value) {
            addCriterion("sms_phone_no >=", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoLessThan(String value) {
            addCriterion("sms_phone_no <", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoLessThanOrEqualTo(String value) {
            addCriterion("sms_phone_no <=", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoLike(String value) {
            addCriterion("sms_phone_no like", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoNotLike(String value) {
            addCriterion("sms_phone_no not like", value, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoIn(List<String> values) {
            addCriterion("sms_phone_no in", values, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoNotIn(List<String> values) {
            addCriterion("sms_phone_no not in", values, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoBetween(String value1, String value2) {
            addCriterion("sms_phone_no between", value1, value2, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsPhoneNoNotBetween(String value1, String value2) {
            addCriterion("sms_phone_no not between", value1, value2, "smsPhoneNo");
            return (Criteria) this;
        }

        public Criteria andSmsMessageIsNull() {
            addCriterion("sms_message is null");
            return (Criteria) this;
        }

        public Criteria andSmsMessageIsNotNull() {
            addCriterion("sms_message is not null");
            return (Criteria) this;
        }

        public Criteria andSmsMessageEqualTo(String value) {
            addCriterion("sms_message =", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageNotEqualTo(String value) {
            addCriterion("sms_message <>", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageGreaterThan(String value) {
            addCriterion("sms_message >", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageGreaterThanOrEqualTo(String value) {
            addCriterion("sms_message >=", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageLessThan(String value) {
            addCriterion("sms_message <", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageLessThanOrEqualTo(String value) {
            addCriterion("sms_message <=", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageLike(String value) {
            addCriterion("sms_message like", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageNotLike(String value) {
            addCriterion("sms_message not like", value, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageIn(List<String> values) {
            addCriterion("sms_message in", values, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageNotIn(List<String> values) {
            addCriterion("sms_message not in", values, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageBetween(String value1, String value2) {
            addCriterion("sms_message between", value1, value2, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsMessageNotBetween(String value1, String value2) {
            addCriterion("sms_message not between", value1, value2, "smsMessage");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeIsNull() {
            addCriterion("sms_send_time is null");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeIsNotNull() {
            addCriterion("sms_send_time is not null");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeEqualTo(Date value) {
            addCriterion("sms_send_time =", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeNotEqualTo(Date value) {
            addCriterion("sms_send_time <>", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeGreaterThan(Date value) {
            addCriterion("sms_send_time >", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("sms_send_time >=", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeLessThan(Date value) {
            addCriterion("sms_send_time <", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeLessThanOrEqualTo(Date value) {
            addCriterion("sms_send_time <=", value, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeIn(List<Date> values) {
            addCriterion("sms_send_time in", values, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeNotIn(List<Date> values) {
            addCriterion("sms_send_time not in", values, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeBetween(Date value1, Date value2) {
            addCriterion("sms_send_time between", value1, value2, "smsSendTime");
            return (Criteria) this;
        }

        public Criteria andSmsSendTimeNotBetween(Date value1, Date value2) {
            addCriterion("sms_send_time not between", value1, value2, "smsSendTime");
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