package com.pro.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

public class PumpExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public PumpExample() {
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

        protected void addCriterionForJDBCDate(String condition, Date value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value.getTime()), property);
        }

        protected void addCriterionForJDBCDate(String condition, List<Date> values, String property) {
            if (values == null || values.size() == 0) {
                throw new RuntimeException("Value list for " + property + " cannot be null or empty");
            }
            List<java.sql.Date> dateList = new ArrayList<java.sql.Date>();
            Iterator<Date> iter = values.iterator();
            while (iter.hasNext()) {
                dateList.add(new java.sql.Date(iter.next().getTime()));
            }
            addCriterion(condition, dateList, property);
        }

        protected void addCriterionForJDBCDate(String condition, Date value1, Date value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            addCriterion(condition, new java.sql.Date(value1.getTime()), new java.sql.Date(value2.getTime()), property);
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

        public Criteria andProjectIdIsNull() {
            addCriterion("project_id is null");
            return (Criteria) this;
        }

        public Criteria andProjectIdIsNotNull() {
            addCriterion("project_id is not null");
            return (Criteria) this;
        }

        public Criteria andProjectIdEqualTo(Long value) {
            addCriterion("project_id =", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotEqualTo(Long value) {
            addCriterion("project_id <>", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdGreaterThan(Long value) {
            addCriterion("project_id >", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdGreaterThanOrEqualTo(Long value) {
            addCriterion("project_id >=", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdLessThan(Long value) {
            addCriterion("project_id <", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdLessThanOrEqualTo(Long value) {
            addCriterion("project_id <=", value, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdIn(List<Long> values) {
            addCriterion("project_id in", values, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotIn(List<Long> values) {
            addCriterion("project_id not in", values, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdBetween(Long value1, Long value2) {
            addCriterion("project_id between", value1, value2, "projectId");
            return (Criteria) this;
        }

        public Criteria andProjectIdNotBetween(Long value1, Long value2) {
            addCriterion("project_id not between", value1, value2, "projectId");
            return (Criteria) this;
        }

        public Criteria andVenderIdIsNull() {
            addCriterion("vender_id is null");
            return (Criteria) this;
        }

        public Criteria andVenderIdIsNotNull() {
            addCriterion("vender_id is not null");
            return (Criteria) this;
        }

        public Criteria andVenderIdEqualTo(Long value) {
            addCriterion("vender_id =", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdNotEqualTo(Long value) {
            addCriterion("vender_id <>", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdGreaterThan(Long value) {
            addCriterion("vender_id >", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdGreaterThanOrEqualTo(Long value) {
            addCriterion("vender_id >=", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdLessThan(Long value) {
            addCriterion("vender_id <", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdLessThanOrEqualTo(Long value) {
            addCriterion("vender_id <=", value, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdIn(List<Long> values) {
            addCriterion("vender_id in", values, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdNotIn(List<Long> values) {
            addCriterion("vender_id not in", values, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdBetween(Long value1, Long value2) {
            addCriterion("vender_id between", value1, value2, "venderId");
            return (Criteria) this;
        }

        public Criteria andVenderIdNotBetween(Long value1, Long value2) {
            addCriterion("vender_id not between", value1, value2, "venderId");
            return (Criteria) this;
        }

        public Criteria andInstallDateIsNull() {
            addCriterion("install_date is null");
            return (Criteria) this;
        }

        public Criteria andInstallDateIsNotNull() {
            addCriterion("install_date is not null");
            return (Criteria) this;
        }

        public Criteria andInstallDateEqualTo(Date value) {
            addCriterionForJDBCDate("install_date =", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateNotEqualTo(Date value) {
            addCriterionForJDBCDate("install_date <>", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateGreaterThan(Date value) {
            addCriterionForJDBCDate("install_date >", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateGreaterThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("install_date >=", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateLessThan(Date value) {
            addCriterionForJDBCDate("install_date <", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateLessThanOrEqualTo(Date value) {
            addCriterionForJDBCDate("install_date <=", value, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateIn(List<Date> values) {
            addCriterionForJDBCDate("install_date in", values, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateNotIn(List<Date> values) {
            addCriterionForJDBCDate("install_date not in", values, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("install_date between", value1, value2, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallDateNotBetween(Date value1, Date value2) {
            addCriterionForJDBCDate("install_date not between", value1, value2, "installDate");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoIsNull() {
            addCriterion("install_pi_no is null");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoIsNotNull() {
            addCriterion("install_pi_no is not null");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoEqualTo(BigDecimal value) {
            addCriterion("install_pi_no =", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoNotEqualTo(BigDecimal value) {
            addCriterion("install_pi_no <>", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoGreaterThan(BigDecimal value) {
            addCriterion("install_pi_no >", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("install_pi_no >=", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoLessThan(BigDecimal value) {
            addCriterion("install_pi_no <", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoLessThanOrEqualTo(BigDecimal value) {
            addCriterion("install_pi_no <=", value, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoIn(List<BigDecimal> values) {
            addCriterion("install_pi_no in", values, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoNotIn(List<BigDecimal> values) {
            addCriterion("install_pi_no not in", values, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("install_pi_no between", value1, value2, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andInstallPiNoNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("install_pi_no not between", value1, value2, "installPiNo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoIsNull() {
            addCriterion("warranty_info is null");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoIsNotNull() {
            addCriterion("warranty_info is not null");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoEqualTo(String value) {
            addCriterion("warranty_info =", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoNotEqualTo(String value) {
            addCriterion("warranty_info <>", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoGreaterThan(String value) {
            addCriterion("warranty_info >", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoGreaterThanOrEqualTo(String value) {
            addCriterion("warranty_info >=", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoLessThan(String value) {
            addCriterion("warranty_info <", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoLessThanOrEqualTo(String value) {
            addCriterion("warranty_info <=", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoLike(String value) {
            addCriterion("warranty_info like", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoNotLike(String value) {
            addCriterion("warranty_info not like", value, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoIn(List<String> values) {
            addCriterion("warranty_info in", values, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoNotIn(List<String> values) {
            addCriterion("warranty_info not in", values, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoBetween(String value1, String value2) {
            addCriterion("warranty_info between", value1, value2, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andWarrantyInfoNotBetween(String value1, String value2) {
            addCriterion("warranty_info not between", value1, value2, "warrantyInfo");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeIsNull() {
            addCriterion("pump_create_time is null");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeIsNotNull() {
            addCriterion("pump_create_time is not null");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeEqualTo(Date value) {
            addCriterion("pump_create_time =", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeNotEqualTo(Date value) {
            addCriterion("pump_create_time <>", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeGreaterThan(Date value) {
            addCriterion("pump_create_time >", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("pump_create_time >=", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeLessThan(Date value) {
            addCriterion("pump_create_time <", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("pump_create_time <=", value, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeIn(List<Date> values) {
            addCriterion("pump_create_time in", values, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeNotIn(List<Date> values) {
            addCriterion("pump_create_time not in", values, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeBetween(Date value1, Date value2) {
            addCriterion("pump_create_time between", value1, value2, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("pump_create_time not between", value1, value2, "pumpCreateTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeIsNull() {
            addCriterion("pump_modify_time is null");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeIsNotNull() {
            addCriterion("pump_modify_time is not null");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeEqualTo(Date value) {
            addCriterion("pump_modify_time =", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeNotEqualTo(Date value) {
            addCriterion("pump_modify_time <>", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeGreaterThan(Date value) {
            addCriterion("pump_modify_time >", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("pump_modify_time >=", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeLessThan(Date value) {
            addCriterion("pump_modify_time <", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeLessThanOrEqualTo(Date value) {
            addCriterion("pump_modify_time <=", value, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeIn(List<Date> values) {
            addCriterion("pump_modify_time in", values, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeNotIn(List<Date> values) {
            addCriterion("pump_modify_time not in", values, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeBetween(Date value1, Date value2) {
            addCriterion("pump_modify_time between", value1, value2, "pumpModifyTime");
            return (Criteria) this;
        }

        public Criteria andPumpModifyTimeNotBetween(Date value1, Date value2) {
            addCriterion("pump_modify_time not between", value1, value2, "pumpModifyTime");
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