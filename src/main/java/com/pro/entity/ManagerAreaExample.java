package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ManagerAreaExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ManagerAreaExample() {
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

        public Criteria andUserIdIsNull() {
            addCriterion("user_id is null");
            return (Criteria) this;
        }

        public Criteria andUserIdIsNotNull() {
            addCriterion("user_id is not null");
            return (Criteria) this;
        }

        public Criteria andUserIdEqualTo(Long value) {
            addCriterion("user_id =", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotEqualTo(Long value) {
            addCriterion("user_id <>", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThan(Long value) {
            addCriterion("user_id >", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdGreaterThanOrEqualTo(Long value) {
            addCriterion("user_id >=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThan(Long value) {
            addCriterion("user_id <", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdLessThanOrEqualTo(Long value) {
            addCriterion("user_id <=", value, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdIn(List<Long> values) {
            addCriterion("user_id in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotIn(List<Long> values) {
            addCriterion("user_id not in", values, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdBetween(Long value1, Long value2) {
            addCriterion("user_id between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andUserIdNotBetween(Long value1, Long value2) {
            addCriterion("user_id not between", value1, value2, "userId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdIsNull() {
            addCriterion("project_area_id is null");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdIsNotNull() {
            addCriterion("project_area_id is not null");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdEqualTo(Long value) {
            addCriterion("project_area_id =", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdNotEqualTo(Long value) {
            addCriterion("project_area_id <>", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdGreaterThan(Long value) {
            addCriterion("project_area_id >", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdGreaterThanOrEqualTo(Long value) {
            addCriterion("project_area_id >=", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdLessThan(Long value) {
            addCriterion("project_area_id <", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdLessThanOrEqualTo(Long value) {
            addCriterion("project_area_id <=", value, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdIn(List<Long> values) {
            addCriterion("project_area_id in", values, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdNotIn(List<Long> values) {
            addCriterion("project_area_id not in", values, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdBetween(Long value1, Long value2) {
            addCriterion("project_area_id between", value1, value2, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andProjectAreaIdNotBetween(Long value1, Long value2) {
            addCriterion("project_area_id not between", value1, value2, "projectAreaId");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootIsNull() {
            addCriterion("is_area_root is null");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootIsNotNull() {
            addCriterion("is_area_root is not null");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootEqualTo(Boolean value) {
            addCriterion("is_area_root =", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootNotEqualTo(Boolean value) {
            addCriterion("is_area_root <>", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootGreaterThan(Boolean value) {
            addCriterion("is_area_root >", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootGreaterThanOrEqualTo(Boolean value) {
            addCriterion("is_area_root >=", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootLessThan(Boolean value) {
            addCriterion("is_area_root <", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootLessThanOrEqualTo(Boolean value) {
            addCriterion("is_area_root <=", value, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootIn(List<Boolean> values) {
            addCriterion("is_area_root in", values, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootNotIn(List<Boolean> values) {
            addCriterion("is_area_root not in", values, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootBetween(Boolean value1, Boolean value2) {
            addCriterion("is_area_root between", value1, value2, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andIsAreaRootNotBetween(Boolean value1, Boolean value2) {
            addCriterion("is_area_root not between", value1, value2, "isAreaRoot");
            return (Criteria) this;
        }

        public Criteria andAreaCodeIsNull() {
            addCriterion("area_code is null");
            return (Criteria) this;
        }

        public Criteria andAreaCodeIsNotNull() {
            addCriterion("area_code is not null");
            return (Criteria) this;
        }

        public Criteria andAreaCodeEqualTo(String value) {
            addCriterion("area_code =", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeNotEqualTo(String value) {
            addCriterion("area_code <>", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeGreaterThan(String value) {
            addCriterion("area_code >", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeGreaterThanOrEqualTo(String value) {
            addCriterion("area_code >=", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeLessThan(String value) {
            addCriterion("area_code <", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeLessThanOrEqualTo(String value) {
            addCriterion("area_code <=", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeLike(String value) {
            addCriterion("area_code like", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeNotLike(String value) {
            addCriterion("area_code not like", value, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeIn(List<String> values) {
            addCriterion("area_code in", values, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeNotIn(List<String> values) {
            addCriterion("area_code not in", values, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeBetween(String value1, String value2) {
            addCriterion("area_code between", value1, value2, "areaCode");
            return (Criteria) this;
        }

        public Criteria andAreaCodeNotBetween(String value1, String value2) {
            addCriterion("area_code not between", value1, value2, "areaCode");
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