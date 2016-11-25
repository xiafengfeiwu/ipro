package com.pro.entity;

import java.util.ArrayList;
import java.util.List;

public class WebSystemExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public WebSystemExample() {
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

        public Criteria andSystemTitleIsNull() {
            addCriterion("system_title is null");
            return (Criteria) this;
        }

        public Criteria andSystemTitleIsNotNull() {
            addCriterion("system_title is not null");
            return (Criteria) this;
        }

        public Criteria andSystemTitleEqualTo(String value) {
            addCriterion("system_title =", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotEqualTo(String value) {
            addCriterion("system_title <>", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleGreaterThan(String value) {
            addCriterion("system_title >", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleGreaterThanOrEqualTo(String value) {
            addCriterion("system_title >=", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLessThan(String value) {
            addCriterion("system_title <", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLessThanOrEqualTo(String value) {
            addCriterion("system_title <=", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleLike(String value) {
            addCriterion("system_title like", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotLike(String value) {
            addCriterion("system_title not like", value, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleIn(List<String> values) {
            addCriterion("system_title in", values, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotIn(List<String> values) {
            addCriterion("system_title not in", values, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleBetween(String value1, String value2) {
            addCriterion("system_title between", value1, value2, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemTitleNotBetween(String value1, String value2) {
            addCriterion("system_title not between", value1, value2, "systemTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleIsNull() {
            addCriterion("system_short_title is null");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleIsNotNull() {
            addCriterion("system_short_title is not null");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleEqualTo(String value) {
            addCriterion("system_short_title =", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleNotEqualTo(String value) {
            addCriterion("system_short_title <>", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleGreaterThan(String value) {
            addCriterion("system_short_title >", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleGreaterThanOrEqualTo(String value) {
            addCriterion("system_short_title >=", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleLessThan(String value) {
            addCriterion("system_short_title <", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleLessThanOrEqualTo(String value) {
            addCriterion("system_short_title <=", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleLike(String value) {
            addCriterion("system_short_title like", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleNotLike(String value) {
            addCriterion("system_short_title not like", value, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleIn(List<String> values) {
            addCriterion("system_short_title in", values, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleNotIn(List<String> values) {
            addCriterion("system_short_title not in", values, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleBetween(String value1, String value2) {
            addCriterion("system_short_title between", value1, value2, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemShortTitleNotBetween(String value1, String value2) {
            addCriterion("system_short_title not between", value1, value2, "systemShortTitle");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsIsNull() {
            addCriterion("system_keywords is null");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsIsNotNull() {
            addCriterion("system_keywords is not null");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsEqualTo(String value) {
            addCriterion("system_keywords =", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsNotEqualTo(String value) {
            addCriterion("system_keywords <>", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsGreaterThan(String value) {
            addCriterion("system_keywords >", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsGreaterThanOrEqualTo(String value) {
            addCriterion("system_keywords >=", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsLessThan(String value) {
            addCriterion("system_keywords <", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsLessThanOrEqualTo(String value) {
            addCriterion("system_keywords <=", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsLike(String value) {
            addCriterion("system_keywords like", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsNotLike(String value) {
            addCriterion("system_keywords not like", value, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsIn(List<String> values) {
            addCriterion("system_keywords in", values, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsNotIn(List<String> values) {
            addCriterion("system_keywords not in", values, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsBetween(String value1, String value2) {
            addCriterion("system_keywords between", value1, value2, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemKeywordsNotBetween(String value1, String value2) {
            addCriterion("system_keywords not between", value1, value2, "systemKeywords");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionIsNull() {
            addCriterion("system_description is null");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionIsNotNull() {
            addCriterion("system_description is not null");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionEqualTo(String value) {
            addCriterion("system_description =", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionNotEqualTo(String value) {
            addCriterion("system_description <>", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionGreaterThan(String value) {
            addCriterion("system_description >", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionGreaterThanOrEqualTo(String value) {
            addCriterion("system_description >=", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionLessThan(String value) {
            addCriterion("system_description <", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionLessThanOrEqualTo(String value) {
            addCriterion("system_description <=", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionLike(String value) {
            addCriterion("system_description like", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionNotLike(String value) {
            addCriterion("system_description not like", value, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionIn(List<String> values) {
            addCriterion("system_description in", values, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionNotIn(List<String> values) {
            addCriterion("system_description not in", values, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionBetween(String value1, String value2) {
            addCriterion("system_description between", value1, value2, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemDescriptionNotBetween(String value1, String value2) {
            addCriterion("system_description not between", value1, value2, "systemDescription");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightIsNull() {
            addCriterion("system_copyright is null");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightIsNotNull() {
            addCriterion("system_copyright is not null");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightEqualTo(String value) {
            addCriterion("system_copyright =", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightNotEqualTo(String value) {
            addCriterion("system_copyright <>", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightGreaterThan(String value) {
            addCriterion("system_copyright >", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightGreaterThanOrEqualTo(String value) {
            addCriterion("system_copyright >=", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightLessThan(String value) {
            addCriterion("system_copyright <", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightLessThanOrEqualTo(String value) {
            addCriterion("system_copyright <=", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightLike(String value) {
            addCriterion("system_copyright like", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightNotLike(String value) {
            addCriterion("system_copyright not like", value, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightIn(List<String> values) {
            addCriterion("system_copyright in", values, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightNotIn(List<String> values) {
            addCriterion("system_copyright not in", values, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightBetween(String value1, String value2) {
            addCriterion("system_copyright between", value1, value2, "systemCopyright");
            return (Criteria) this;
        }

        public Criteria andSystemCopyrightNotBetween(String value1, String value2) {
            addCriterion("system_copyright not between", value1, value2, "systemCopyright");
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