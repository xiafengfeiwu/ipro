package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class RoleExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public RoleExample() {
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

        public Criteria andRoleIdIsNull() {
            addCriterion("role_id is null");
            return (Criteria) this;
        }

        public Criteria andRoleIdIsNotNull() {
            addCriterion("role_id is not null");
            return (Criteria) this;
        }

        public Criteria andRoleIdEqualTo(Long value) {
            addCriterion("role_id =", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotEqualTo(Long value) {
            addCriterion("role_id <>", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdGreaterThan(Long value) {
            addCriterion("role_id >", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdGreaterThanOrEqualTo(Long value) {
            addCriterion("role_id >=", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdLessThan(Long value) {
            addCriterion("role_id <", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdLessThanOrEqualTo(Long value) {
            addCriterion("role_id <=", value, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdIn(List<Long> values) {
            addCriterion("role_id in", values, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotIn(List<Long> values) {
            addCriterion("role_id not in", values, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdBetween(Long value1, Long value2) {
            addCriterion("role_id between", value1, value2, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleIdNotBetween(Long value1, Long value2) {
            addCriterion("role_id not between", value1, value2, "roleId");
            return (Criteria) this;
        }

        public Criteria andRoleNameIsNull() {
            addCriterion("role_name is null");
            return (Criteria) this;
        }

        public Criteria andRoleNameIsNotNull() {
            addCriterion("role_name is not null");
            return (Criteria) this;
        }

        public Criteria andRoleNameEqualTo(String value) {
            addCriterion("role_name =", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameNotEqualTo(String value) {
            addCriterion("role_name <>", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameGreaterThan(String value) {
            addCriterion("role_name >", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameGreaterThanOrEqualTo(String value) {
            addCriterion("role_name >=", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameLessThan(String value) {
            addCriterion("role_name <", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameLessThanOrEqualTo(String value) {
            addCriterion("role_name <=", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameLike(String value) {
            addCriterion("role_name like", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameNotLike(String value) {
            addCriterion("role_name not like", value, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameIn(List<String> values) {
            addCriterion("role_name in", values, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameNotIn(List<String> values) {
            addCriterion("role_name not in", values, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameBetween(String value1, String value2) {
            addCriterion("role_name between", value1, value2, "roleName");
            return (Criteria) this;
        }

        public Criteria andRoleNameNotBetween(String value1, String value2) {
            addCriterion("role_name not between", value1, value2, "roleName");
            return (Criteria) this;
        }

        public Criteria andSystemRoleIsNull() {
            addCriterion("system_role is null");
            return (Criteria) this;
        }

        public Criteria andSystemRoleIsNotNull() {
            addCriterion("system_role is not null");
            return (Criteria) this;
        }

        public Criteria andSystemRoleEqualTo(Boolean value) {
            addCriterion("system_role =", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleNotEqualTo(Boolean value) {
            addCriterion("system_role <>", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleGreaterThan(Boolean value) {
            addCriterion("system_role >", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleGreaterThanOrEqualTo(Boolean value) {
            addCriterion("system_role >=", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleLessThan(Boolean value) {
            addCriterion("system_role <", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleLessThanOrEqualTo(Boolean value) {
            addCriterion("system_role <=", value, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleIn(List<Boolean> values) {
            addCriterion("system_role in", values, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleNotIn(List<Boolean> values) {
            addCriterion("system_role not in", values, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleBetween(Boolean value1, Boolean value2) {
            addCriterion("system_role between", value1, value2, "systemRole");
            return (Criteria) this;
        }

        public Criteria andSystemRoleNotBetween(Boolean value1, Boolean value2) {
            addCriterion("system_role not between", value1, value2, "systemRole");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeIsNull() {
            addCriterion("role_create_time is null");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeIsNotNull() {
            addCriterion("role_create_time is not null");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeEqualTo(Date value) {
            addCriterion("role_create_time =", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeNotEqualTo(Date value) {
            addCriterion("role_create_time <>", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeGreaterThan(Date value) {
            addCriterion("role_create_time >", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("role_create_time >=", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeLessThan(Date value) {
            addCriterion("role_create_time <", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("role_create_time <=", value, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeIn(List<Date> values) {
            addCriterion("role_create_time in", values, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeNotIn(List<Date> values) {
            addCriterion("role_create_time not in", values, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeBetween(Date value1, Date value2) {
            addCriterion("role_create_time between", value1, value2, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("role_create_time not between", value1, value2, "roleCreateTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeIsNull() {
            addCriterion("role_modify_time is null");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeIsNotNull() {
            addCriterion("role_modify_time is not null");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeEqualTo(Date value) {
            addCriterion("role_modify_time =", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeNotEqualTo(Date value) {
            addCriterion("role_modify_time <>", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeGreaterThan(Date value) {
            addCriterion("role_modify_time >", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("role_modify_time >=", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeLessThan(Date value) {
            addCriterion("role_modify_time <", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeLessThanOrEqualTo(Date value) {
            addCriterion("role_modify_time <=", value, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeIn(List<Date> values) {
            addCriterion("role_modify_time in", values, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeNotIn(List<Date> values) {
            addCriterion("role_modify_time not in", values, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeBetween(Date value1, Date value2) {
            addCriterion("role_modify_time between", value1, value2, "roleModifyTime");
            return (Criteria) this;
        }

        public Criteria andRoleModifyTimeNotBetween(Date value1, Date value2) {
            addCriterion("role_modify_time not between", value1, value2, "roleModifyTime");
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