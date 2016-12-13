package com.pro.entity;

import java.util.ArrayList;
import java.util.List;

public class TerminalExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public TerminalExample() {
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

        public Criteria andTerminalIdIsNull() {
            addCriterion("terminal_id is null");
            return (Criteria) this;
        }

        public Criteria andTerminalIdIsNotNull() {
            addCriterion("terminal_id is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalIdEqualTo(Long value) {
            addCriterion("terminal_id =", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotEqualTo(Long value) {
            addCriterion("terminal_id <>", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdGreaterThan(Long value) {
            addCriterion("terminal_id >", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdGreaterThanOrEqualTo(Long value) {
            addCriterion("terminal_id >=", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdLessThan(Long value) {
            addCriterion("terminal_id <", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdLessThanOrEqualTo(Long value) {
            addCriterion("terminal_id <=", value, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdIn(List<Long> values) {
            addCriterion("terminal_id in", values, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotIn(List<Long> values) {
            addCriterion("terminal_id not in", values, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdBetween(Long value1, Long value2) {
            addCriterion("terminal_id between", value1, value2, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalIdNotBetween(Long value1, Long value2) {
            addCriterion("terminal_id not between", value1, value2, "terminalId");
            return (Criteria) this;
        }

        public Criteria andTerminalNameIsNull() {
            addCriterion("terminal_name is null");
            return (Criteria) this;
        }

        public Criteria andTerminalNameIsNotNull() {
            addCriterion("terminal_name is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalNameEqualTo(String value) {
            addCriterion("terminal_name =", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotEqualTo(String value) {
            addCriterion("terminal_name <>", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameGreaterThan(String value) {
            addCriterion("terminal_name >", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameGreaterThanOrEqualTo(String value) {
            addCriterion("terminal_name >=", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLessThan(String value) {
            addCriterion("terminal_name <", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLessThanOrEqualTo(String value) {
            addCriterion("terminal_name <=", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameLike(String value) {
            addCriterion("terminal_name like", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotLike(String value) {
            addCriterion("terminal_name not like", value, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameIn(List<String> values) {
            addCriterion("terminal_name in", values, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotIn(List<String> values) {
            addCriterion("terminal_name not in", values, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameBetween(String value1, String value2) {
            addCriterion("terminal_name between", value1, value2, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalNameNotBetween(String value1, String value2) {
            addCriterion("terminal_name not between", value1, value2, "terminalName");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIsNull() {
            addCriterion("terminal_address is null");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIsNotNull() {
            addCriterion("terminal_address is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressEqualTo(String value) {
            addCriterion("terminal_address =", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotEqualTo(String value) {
            addCriterion("terminal_address <>", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressGreaterThan(String value) {
            addCriterion("terminal_address >", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressGreaterThanOrEqualTo(String value) {
            addCriterion("terminal_address >=", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLessThan(String value) {
            addCriterion("terminal_address <", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLessThanOrEqualTo(String value) {
            addCriterion("terminal_address <=", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressLike(String value) {
            addCriterion("terminal_address like", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotLike(String value) {
            addCriterion("terminal_address not like", value, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressIn(List<String> values) {
            addCriterion("terminal_address in", values, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotIn(List<String> values) {
            addCriterion("terminal_address not in", values, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressBetween(String value1, String value2) {
            addCriterion("terminal_address between", value1, value2, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalAddressNotBetween(String value1, String value2) {
            addCriterion("terminal_address not between", value1, value2, "terminalAddress");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdIsNull() {
            addCriterion("terminal_owner_id is null");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdIsNotNull() {
            addCriterion("terminal_owner_id is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdEqualTo(Long value) {
            addCriterion("terminal_owner_id =", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdNotEqualTo(Long value) {
            addCriterion("terminal_owner_id <>", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdGreaterThan(Long value) {
            addCriterion("terminal_owner_id >", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdGreaterThanOrEqualTo(Long value) {
            addCriterion("terminal_owner_id >=", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdLessThan(Long value) {
            addCriterion("terminal_owner_id <", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdLessThanOrEqualTo(Long value) {
            addCriterion("terminal_owner_id <=", value, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdIn(List<Long> values) {
            addCriterion("terminal_owner_id in", values, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdNotIn(List<Long> values) {
            addCriterion("terminal_owner_id not in", values, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdBetween(Long value1, Long value2) {
            addCriterion("terminal_owner_id between", value1, value2, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalOwnerIdNotBetween(Long value1, Long value2) {
            addCriterion("terminal_owner_id not between", value1, value2, "terminalOwnerId");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeIsNull() {
            addCriterion("terminal_longitude is null");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeIsNotNull() {
            addCriterion("terminal_longitude is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeEqualTo(String value) {
            addCriterion("terminal_longitude =", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeNotEqualTo(String value) {
            addCriterion("terminal_longitude <>", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeGreaterThan(String value) {
            addCriterion("terminal_longitude >", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeGreaterThanOrEqualTo(String value) {
            addCriterion("terminal_longitude >=", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeLessThan(String value) {
            addCriterion("terminal_longitude <", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeLessThanOrEqualTo(String value) {
            addCriterion("terminal_longitude <=", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeLike(String value) {
            addCriterion("terminal_longitude like", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeNotLike(String value) {
            addCriterion("terminal_longitude not like", value, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeIn(List<String> values) {
            addCriterion("terminal_longitude in", values, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeNotIn(List<String> values) {
            addCriterion("terminal_longitude not in", values, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeBetween(String value1, String value2) {
            addCriterion("terminal_longitude between", value1, value2, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLongitudeNotBetween(String value1, String value2) {
            addCriterion("terminal_longitude not between", value1, value2, "terminalLongitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeIsNull() {
            addCriterion("terminal_latitude is null");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeIsNotNull() {
            addCriterion("terminal_latitude is not null");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeEqualTo(String value) {
            addCriterion("terminal_latitude =", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeNotEqualTo(String value) {
            addCriterion("terminal_latitude <>", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeGreaterThan(String value) {
            addCriterion("terminal_latitude >", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeGreaterThanOrEqualTo(String value) {
            addCriterion("terminal_latitude >=", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeLessThan(String value) {
            addCriterion("terminal_latitude <", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeLessThanOrEqualTo(String value) {
            addCriterion("terminal_latitude <=", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeLike(String value) {
            addCriterion("terminal_latitude like", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeNotLike(String value) {
            addCriterion("terminal_latitude not like", value, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeIn(List<String> values) {
            addCriterion("terminal_latitude in", values, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeNotIn(List<String> values) {
            addCriterion("terminal_latitude not in", values, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeBetween(String value1, String value2) {
            addCriterion("terminal_latitude between", value1, value2, "terminalLatitude");
            return (Criteria) this;
        }

        public Criteria andTerminalLatitudeNotBetween(String value1, String value2) {
            addCriterion("terminal_latitude not between", value1, value2, "terminalLatitude");
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