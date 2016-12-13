package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class PacketQueryExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PacketQueryExample() {
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

        public Criteria andPacketIdIsNull() {
            addCriterion("packet_id is null");
            return (Criteria) this;
        }

        public Criteria andPacketIdIsNotNull() {
            addCriterion("packet_id is not null");
            return (Criteria) this;
        }

        public Criteria andPacketIdEqualTo(Long value) {
            addCriterion("packet_id =", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdNotEqualTo(Long value) {
            addCriterion("packet_id <>", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdGreaterThan(Long value) {
            addCriterion("packet_id >", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdGreaterThanOrEqualTo(Long value) {
            addCriterion("packet_id >=", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdLessThan(Long value) {
            addCriterion("packet_id <", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdLessThanOrEqualTo(Long value) {
            addCriterion("packet_id <=", value, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdIn(List<Long> values) {
            addCriterion("packet_id in", values, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdNotIn(List<Long> values) {
            addCriterion("packet_id not in", values, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdBetween(Long value1, Long value2) {
            addCriterion("packet_id between", value1, value2, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketIdNotBetween(Long value1, Long value2) {
            addCriterion("packet_id not between", value1, value2, "packetId");
            return (Criteria) this;
        }

        public Criteria andPacketTypeIsNull() {
            addCriterion("packet_type is null");
            return (Criteria) this;
        }

        public Criteria andPacketTypeIsNotNull() {
            addCriterion("packet_type is not null");
            return (Criteria) this;
        }

        public Criteria andPacketTypeEqualTo(String value) {
            addCriterion("packet_type =", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeNotEqualTo(String value) {
            addCriterion("packet_type <>", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeGreaterThan(String value) {
            addCriterion("packet_type >", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeGreaterThanOrEqualTo(String value) {
            addCriterion("packet_type >=", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeLessThan(String value) {
            addCriterion("packet_type <", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeLessThanOrEqualTo(String value) {
            addCriterion("packet_type <=", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeLike(String value) {
            addCriterion("packet_type like", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeNotLike(String value) {
            addCriterion("packet_type not like", value, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeIn(List<String> values) {
            addCriterion("packet_type in", values, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeNotIn(List<String> values) {
            addCriterion("packet_type not in", values, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeBetween(String value1, String value2) {
            addCriterion("packet_type between", value1, value2, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketTypeNotBetween(String value1, String value2) {
            addCriterion("packet_type not between", value1, value2, "packetType");
            return (Criteria) this;
        }

        public Criteria andPacketDataIsNull() {
            addCriterion("packet_data is null");
            return (Criteria) this;
        }

        public Criteria andPacketDataIsNotNull() {
            addCriterion("packet_data is not null");
            return (Criteria) this;
        }

        public Criteria andPacketDataEqualTo(String value) {
            addCriterion("packet_data =", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataNotEqualTo(String value) {
            addCriterion("packet_data <>", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataGreaterThan(String value) {
            addCriterion("packet_data >", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataGreaterThanOrEqualTo(String value) {
            addCriterion("packet_data >=", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataLessThan(String value) {
            addCriterion("packet_data <", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataLessThanOrEqualTo(String value) {
            addCriterion("packet_data <=", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataLike(String value) {
            addCriterion("packet_data like", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataNotLike(String value) {
            addCriterion("packet_data not like", value, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataIn(List<String> values) {
            addCriterion("packet_data in", values, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataNotIn(List<String> values) {
            addCriterion("packet_data not in", values, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataBetween(String value1, String value2) {
            addCriterion("packet_data between", value1, value2, "packetData");
            return (Criteria) this;
        }

        public Criteria andPacketDataNotBetween(String value1, String value2) {
            addCriterion("packet_data not between", value1, value2, "packetData");
            return (Criteria) this;
        }

        public Criteria andCollectTimeIsNull() {
            addCriterion("collect_time is null");
            return (Criteria) this;
        }

        public Criteria andCollectTimeIsNotNull() {
            addCriterion("collect_time is not null");
            return (Criteria) this;
        }

        public Criteria andCollectTimeEqualTo(Date value) {
            addCriterion("collect_time =", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeNotEqualTo(Date value) {
            addCriterion("collect_time <>", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeGreaterThan(Date value) {
            addCriterion("collect_time >", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("collect_time >=", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeLessThan(Date value) {
            addCriterion("collect_time <", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeLessThanOrEqualTo(Date value) {
            addCriterion("collect_time <=", value, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeIn(List<Date> values) {
            addCriterion("collect_time in", values, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeNotIn(List<Date> values) {
            addCriterion("collect_time not in", values, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeBetween(Date value1, Date value2) {
            addCriterion("collect_time between", value1, value2, "collectTime");
            return (Criteria) this;
        }

        public Criteria andCollectTimeNotBetween(Date value1, Date value2) {
            addCriterion("collect_time not between", value1, value2, "collectTime");
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