package com.pro.entity;

import java.util.ArrayList;
import java.util.List;

public class JurisdictionExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public JurisdictionExample() {
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

        public Criteria andJurisdictionIdIsNull() {
            addCriterion("jurisdiction_id is null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdIsNotNull() {
            addCriterion("jurisdiction_id is not null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdEqualTo(Long value) {
            addCriterion("jurisdiction_id =", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdNotEqualTo(Long value) {
            addCriterion("jurisdiction_id <>", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdGreaterThan(Long value) {
            addCriterion("jurisdiction_id >", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdGreaterThanOrEqualTo(Long value) {
            addCriterion("jurisdiction_id >=", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdLessThan(Long value) {
            addCriterion("jurisdiction_id <", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdLessThanOrEqualTo(Long value) {
            addCriterion("jurisdiction_id <=", value, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdIn(List<Long> values) {
            addCriterion("jurisdiction_id in", values, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdNotIn(List<Long> values) {
            addCriterion("jurisdiction_id not in", values, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdBetween(Long value1, Long value2) {
            addCriterion("jurisdiction_id between", value1, value2, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionIdNotBetween(Long value1, Long value2) {
            addCriterion("jurisdiction_id not between", value1, value2, "jurisdictionId");
            return (Criteria) this;
        }

        public Criteria andGroupIdIsNull() {
            addCriterion("group_id is null");
            return (Criteria) this;
        }

        public Criteria andGroupIdIsNotNull() {
            addCriterion("group_id is not null");
            return (Criteria) this;
        }

        public Criteria andGroupIdEqualTo(Long value) {
            addCriterion("group_id =", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotEqualTo(Long value) {
            addCriterion("group_id <>", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThan(Long value) {
            addCriterion("group_id >", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdGreaterThanOrEqualTo(Long value) {
            addCriterion("group_id >=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThan(Long value) {
            addCriterion("group_id <", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdLessThanOrEqualTo(Long value) {
            addCriterion("group_id <=", value, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdIn(List<Long> values) {
            addCriterion("group_id in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotIn(List<Long> values) {
            addCriterion("group_id not in", values, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdBetween(Long value1, Long value2) {
            addCriterion("group_id between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andGroupIdNotBetween(Long value1, Long value2) {
            addCriterion("group_id not between", value1, value2, "groupId");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameIsNull() {
            addCriterion("jurisdiction_name is null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameIsNotNull() {
            addCriterion("jurisdiction_name is not null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameEqualTo(String value) {
            addCriterion("jurisdiction_name =", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameNotEqualTo(String value) {
            addCriterion("jurisdiction_name <>", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameGreaterThan(String value) {
            addCriterion("jurisdiction_name >", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameGreaterThanOrEqualTo(String value) {
            addCriterion("jurisdiction_name >=", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameLessThan(String value) {
            addCriterion("jurisdiction_name <", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameLessThanOrEqualTo(String value) {
            addCriterion("jurisdiction_name <=", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameLike(String value) {
            addCriterion("jurisdiction_name like", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameNotLike(String value) {
            addCriterion("jurisdiction_name not like", value, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameIn(List<String> values) {
            addCriterion("jurisdiction_name in", values, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameNotIn(List<String> values) {
            addCriterion("jurisdiction_name not in", values, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameBetween(String value1, String value2) {
            addCriterion("jurisdiction_name between", value1, value2, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionNameNotBetween(String value1, String value2) {
            addCriterion("jurisdiction_name not between", value1, value2, "jurisdictionName");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeIsNull() {
            addCriterion("jurisdiction_code is null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeIsNotNull() {
            addCriterion("jurisdiction_code is not null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeEqualTo(String value) {
            addCriterion("jurisdiction_code =", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeNotEqualTo(String value) {
            addCriterion("jurisdiction_code <>", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeGreaterThan(String value) {
            addCriterion("jurisdiction_code >", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeGreaterThanOrEqualTo(String value) {
            addCriterion("jurisdiction_code >=", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeLessThan(String value) {
            addCriterion("jurisdiction_code <", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeLessThanOrEqualTo(String value) {
            addCriterion("jurisdiction_code <=", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeLike(String value) {
            addCriterion("jurisdiction_code like", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeNotLike(String value) {
            addCriterion("jurisdiction_code not like", value, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeIn(List<String> values) {
            addCriterion("jurisdiction_code in", values, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeNotIn(List<String> values) {
            addCriterion("jurisdiction_code not in", values, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeBetween(String value1, String value2) {
            addCriterion("jurisdiction_code between", value1, value2, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionCodeNotBetween(String value1, String value2) {
            addCriterion("jurisdiction_code not between", value1, value2, "jurisdictionCode");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptIsNull() {
            addCriterion("jurisdiction_descript is null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptIsNotNull() {
            addCriterion("jurisdiction_descript is not null");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptEqualTo(String value) {
            addCriterion("jurisdiction_descript =", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptNotEqualTo(String value) {
            addCriterion("jurisdiction_descript <>", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptGreaterThan(String value) {
            addCriterion("jurisdiction_descript >", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptGreaterThanOrEqualTo(String value) {
            addCriterion("jurisdiction_descript >=", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptLessThan(String value) {
            addCriterion("jurisdiction_descript <", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptLessThanOrEqualTo(String value) {
            addCriterion("jurisdiction_descript <=", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptLike(String value) {
            addCriterion("jurisdiction_descript like", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptNotLike(String value) {
            addCriterion("jurisdiction_descript not like", value, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptIn(List<String> values) {
            addCriterion("jurisdiction_descript in", values, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptNotIn(List<String> values) {
            addCriterion("jurisdiction_descript not in", values, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptBetween(String value1, String value2) {
            addCriterion("jurisdiction_descript between", value1, value2, "jurisdictionDescript");
            return (Criteria) this;
        }

        public Criteria andJurisdictionDescriptNotBetween(String value1, String value2) {
            addCriterion("jurisdiction_descript not between", value1, value2, "jurisdictionDescript");
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