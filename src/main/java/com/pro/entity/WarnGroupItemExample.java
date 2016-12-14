package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class WarnGroupItemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WarnGroupItemExample() {
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

        public Criteria andItemIdIsNull() {
            addCriterion("item_id is null");
            return (Criteria) this;
        }

        public Criteria andItemIdIsNotNull() {
            addCriterion("item_id is not null");
            return (Criteria) this;
        }

        public Criteria andItemIdEqualTo(Long value) {
            addCriterion("item_id =", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotEqualTo(Long value) {
            addCriterion("item_id <>", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThan(Long value) {
            addCriterion("item_id >", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdGreaterThanOrEqualTo(Long value) {
            addCriterion("item_id >=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThan(Long value) {
            addCriterion("item_id <", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdLessThanOrEqualTo(Long value) {
            addCriterion("item_id <=", value, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdIn(List<Long> values) {
            addCriterion("item_id in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotIn(List<Long> values) {
            addCriterion("item_id not in", values, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdBetween(Long value1, Long value2) {
            addCriterion("item_id between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andItemIdNotBetween(Long value1, Long value2) {
            addCriterion("item_id not between", value1, value2, "itemId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdIsNull() {
            addCriterion("warn_group_id is null");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdIsNotNull() {
            addCriterion("warn_group_id is not null");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdEqualTo(Long value) {
            addCriterion("warn_group_id =", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdNotEqualTo(Long value) {
            addCriterion("warn_group_id <>", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdGreaterThan(Long value) {
            addCriterion("warn_group_id >", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdGreaterThanOrEqualTo(Long value) {
            addCriterion("warn_group_id >=", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdLessThan(Long value) {
            addCriterion("warn_group_id <", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdLessThanOrEqualTo(Long value) {
            addCriterion("warn_group_id <=", value, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdIn(List<Long> values) {
            addCriterion("warn_group_id in", values, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdNotIn(List<Long> values) {
            addCriterion("warn_group_id not in", values, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdBetween(Long value1, Long value2) {
            addCriterion("warn_group_id between", value1, value2, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andWarnGroupIdNotBetween(Long value1, Long value2) {
            addCriterion("warn_group_id not between", value1, value2, "warnGroupId");
            return (Criteria) this;
        }

        public Criteria andItemNameIsNull() {
            addCriterion("item_name is null");
            return (Criteria) this;
        }

        public Criteria andItemNameIsNotNull() {
            addCriterion("item_name is not null");
            return (Criteria) this;
        }

        public Criteria andItemNameEqualTo(String value) {
            addCriterion("item_name =", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotEqualTo(String value) {
            addCriterion("item_name <>", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameGreaterThan(String value) {
            addCriterion("item_name >", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameGreaterThanOrEqualTo(String value) {
            addCriterion("item_name >=", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLessThan(String value) {
            addCriterion("item_name <", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLessThanOrEqualTo(String value) {
            addCriterion("item_name <=", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameLike(String value) {
            addCriterion("item_name like", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotLike(String value) {
            addCriterion("item_name not like", value, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameIn(List<String> values) {
            addCriterion("item_name in", values, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotIn(List<String> values) {
            addCriterion("item_name not in", values, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameBetween(String value1, String value2) {
            addCriterion("item_name between", value1, value2, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemNameNotBetween(String value1, String value2) {
            addCriterion("item_name not between", value1, value2, "itemName");
            return (Criteria) this;
        }

        public Criteria andItemThresholdIsNull() {
            addCriterion("item_threshold is null");
            return (Criteria) this;
        }

        public Criteria andItemThresholdIsNotNull() {
            addCriterion("item_threshold is not null");
            return (Criteria) this;
        }

        public Criteria andItemThresholdEqualTo(String value) {
            addCriterion("item_threshold =", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdNotEqualTo(String value) {
            addCriterion("item_threshold <>", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdGreaterThan(String value) {
            addCriterion("item_threshold >", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdGreaterThanOrEqualTo(String value) {
            addCriterion("item_threshold >=", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdLessThan(String value) {
            addCriterion("item_threshold <", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdLessThanOrEqualTo(String value) {
            addCriterion("item_threshold <=", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdLike(String value) {
            addCriterion("item_threshold like", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdNotLike(String value) {
            addCriterion("item_threshold not like", value, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdIn(List<String> values) {
            addCriterion("item_threshold in", values, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdNotIn(List<String> values) {
            addCriterion("item_threshold not in", values, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdBetween(String value1, String value2) {
            addCriterion("item_threshold between", value1, value2, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemThresholdNotBetween(String value1, String value2) {
            addCriterion("item_threshold not between", value1, value2, "itemThreshold");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsIsNull() {
            addCriterion("item_operators is null");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsIsNotNull() {
            addCriterion("item_operators is not null");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsEqualTo(String value) {
            addCriterion("item_operators =", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsNotEqualTo(String value) {
            addCriterion("item_operators <>", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsGreaterThan(String value) {
            addCriterion("item_operators >", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsGreaterThanOrEqualTo(String value) {
            addCriterion("item_operators >=", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsLessThan(String value) {
            addCriterion("item_operators <", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsLessThanOrEqualTo(String value) {
            addCriterion("item_operators <=", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsLike(String value) {
            addCriterion("item_operators like", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsNotLike(String value) {
            addCriterion("item_operators not like", value, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsIn(List<String> values) {
            addCriterion("item_operators in", values, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsNotIn(List<String> values) {
            addCriterion("item_operators not in", values, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsBetween(String value1, String value2) {
            addCriterion("item_operators between", value1, value2, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andItemOperatorsNotBetween(String value1, String value2) {
            addCriterion("item_operators not between", value1, value2, "itemOperators");
            return (Criteria) this;
        }

        public Criteria andWarnCodeIsNull() {
            addCriterion("warn_code is null");
            return (Criteria) this;
        }

        public Criteria andWarnCodeIsNotNull() {
            addCriterion("warn_code is not null");
            return (Criteria) this;
        }

        public Criteria andWarnCodeEqualTo(String value) {
            addCriterion("warn_code =", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeNotEqualTo(String value) {
            addCriterion("warn_code <>", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeGreaterThan(String value) {
            addCriterion("warn_code >", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeGreaterThanOrEqualTo(String value) {
            addCriterion("warn_code >=", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeLessThan(String value) {
            addCriterion("warn_code <", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeLessThanOrEqualTo(String value) {
            addCriterion("warn_code <=", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeLike(String value) {
            addCriterion("warn_code like", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeNotLike(String value) {
            addCriterion("warn_code not like", value, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeIn(List<String> values) {
            addCriterion("warn_code in", values, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeNotIn(List<String> values) {
            addCriterion("warn_code not in", values, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeBetween(String value1, String value2) {
            addCriterion("warn_code between", value1, value2, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnCodeNotBetween(String value1, String value2) {
            addCriterion("warn_code not between", value1, value2, "warnCode");
            return (Criteria) this;
        }

        public Criteria andWarnLevelIsNull() {
            addCriterion("warn_level is null");
            return (Criteria) this;
        }

        public Criteria andWarnLevelIsNotNull() {
            addCriterion("warn_level is not null");
            return (Criteria) this;
        }

        public Criteria andWarnLevelEqualTo(String value) {
            addCriterion("warn_level =", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelNotEqualTo(String value) {
            addCriterion("warn_level <>", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelGreaterThan(String value) {
            addCriterion("warn_level >", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelGreaterThanOrEqualTo(String value) {
            addCriterion("warn_level >=", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelLessThan(String value) {
            addCriterion("warn_level <", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelLessThanOrEqualTo(String value) {
            addCriterion("warn_level <=", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelLike(String value) {
            addCriterion("warn_level like", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelNotLike(String value) {
            addCriterion("warn_level not like", value, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelIn(List<String> values) {
            addCriterion("warn_level in", values, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelNotIn(List<String> values) {
            addCriterion("warn_level not in", values, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelBetween(String value1, String value2) {
            addCriterion("warn_level between", value1, value2, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andWarnLevelNotBetween(String value1, String value2) {
            addCriterion("warn_level not between", value1, value2, "warnLevel");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeIsNull() {
            addCriterion("sms_notice is null");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeIsNotNull() {
            addCriterion("sms_notice is not null");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeEqualTo(Boolean value) {
            addCriterion("sms_notice =", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeNotEqualTo(Boolean value) {
            addCriterion("sms_notice <>", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeGreaterThan(Boolean value) {
            addCriterion("sms_notice >", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeGreaterThanOrEqualTo(Boolean value) {
            addCriterion("sms_notice >=", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeLessThan(Boolean value) {
            addCriterion("sms_notice <", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeLessThanOrEqualTo(Boolean value) {
            addCriterion("sms_notice <=", value, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeIn(List<Boolean> values) {
            addCriterion("sms_notice in", values, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeNotIn(List<Boolean> values) {
            addCriterion("sms_notice not in", values, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeBetween(Boolean value1, Boolean value2) {
            addCriterion("sms_notice between", value1, value2, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andSmsNoticeNotBetween(Boolean value1, Boolean value2) {
            addCriterion("sms_notice not between", value1, value2, "smsNotice");
            return (Criteria) this;
        }

        public Criteria andCreatorIdIsNull() {
            addCriterion("creator_id is null");
            return (Criteria) this;
        }

        public Criteria andCreatorIdIsNotNull() {
            addCriterion("creator_id is not null");
            return (Criteria) this;
        }

        public Criteria andCreatorIdEqualTo(Long value) {
            addCriterion("creator_id =", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdNotEqualTo(Long value) {
            addCriterion("creator_id <>", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdGreaterThan(Long value) {
            addCriterion("creator_id >", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdGreaterThanOrEqualTo(Long value) {
            addCriterion("creator_id >=", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdLessThan(Long value) {
            addCriterion("creator_id <", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdLessThanOrEqualTo(Long value) {
            addCriterion("creator_id <=", value, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdIn(List<Long> values) {
            addCriterion("creator_id in", values, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdNotIn(List<Long> values) {
            addCriterion("creator_id not in", values, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdBetween(Long value1, Long value2) {
            addCriterion("creator_id between", value1, value2, "creatorId");
            return (Criteria) this;
        }

        public Criteria andCreatorIdNotBetween(Long value1, Long value2) {
            addCriterion("creator_id not between", value1, value2, "creatorId");
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