package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ResExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ResExample() {
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

        public Criteria andResIdIsNull() {
            addCriterion("res_id is null");
            return (Criteria) this;
        }

        public Criteria andResIdIsNotNull() {
            addCriterion("res_id is not null");
            return (Criteria) this;
        }

        public Criteria andResIdEqualTo(Long value) {
            addCriterion("res_id =", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdNotEqualTo(Long value) {
            addCriterion("res_id <>", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdGreaterThan(Long value) {
            addCriterion("res_id >", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdGreaterThanOrEqualTo(Long value) {
            addCriterion("res_id >=", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdLessThan(Long value) {
            addCriterion("res_id <", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdLessThanOrEqualTo(Long value) {
            addCriterion("res_id <=", value, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdIn(List<Long> values) {
            addCriterion("res_id in", values, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdNotIn(List<Long> values) {
            addCriterion("res_id not in", values, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdBetween(Long value1, Long value2) {
            addCriterion("res_id between", value1, value2, "resId");
            return (Criteria) this;
        }

        public Criteria andResIdNotBetween(Long value1, Long value2) {
            addCriterion("res_id not between", value1, value2, "resId");
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

        public Criteria andOwnerIdIsNull() {
            addCriterion("owner_id is null");
            return (Criteria) this;
        }

        public Criteria andOwnerIdIsNotNull() {
            addCriterion("owner_id is not null");
            return (Criteria) this;
        }

        public Criteria andOwnerIdEqualTo(Long value) {
            addCriterion("owner_id =", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdNotEqualTo(Long value) {
            addCriterion("owner_id <>", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdGreaterThan(Long value) {
            addCriterion("owner_id >", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdGreaterThanOrEqualTo(Long value) {
            addCriterion("owner_id >=", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdLessThan(Long value) {
            addCriterion("owner_id <", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdLessThanOrEqualTo(Long value) {
            addCriterion("owner_id <=", value, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdIn(List<Long> values) {
            addCriterion("owner_id in", values, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdNotIn(List<Long> values) {
            addCriterion("owner_id not in", values, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdBetween(Long value1, Long value2) {
            addCriterion("owner_id between", value1, value2, "ownerId");
            return (Criteria) this;
        }

        public Criteria andOwnerIdNotBetween(Long value1, Long value2) {
            addCriterion("owner_id not between", value1, value2, "ownerId");
            return (Criteria) this;
        }

        public Criteria andResNameIsNull() {
            addCriterion("res_name is null");
            return (Criteria) this;
        }

        public Criteria andResNameIsNotNull() {
            addCriterion("res_name is not null");
            return (Criteria) this;
        }

        public Criteria andResNameEqualTo(String value) {
            addCriterion("res_name =", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameNotEqualTo(String value) {
            addCriterion("res_name <>", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameGreaterThan(String value) {
            addCriterion("res_name >", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameGreaterThanOrEqualTo(String value) {
            addCriterion("res_name >=", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameLessThan(String value) {
            addCriterion("res_name <", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameLessThanOrEqualTo(String value) {
            addCriterion("res_name <=", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameLike(String value) {
            addCriterion("res_name like", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameNotLike(String value) {
            addCriterion("res_name not like", value, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameIn(List<String> values) {
            addCriterion("res_name in", values, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameNotIn(List<String> values) {
            addCriterion("res_name not in", values, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameBetween(String value1, String value2) {
            addCriterion("res_name between", value1, value2, "resName");
            return (Criteria) this;
        }

        public Criteria andResNameNotBetween(String value1, String value2) {
            addCriterion("res_name not between", value1, value2, "resName");
            return (Criteria) this;
        }

        public Criteria andResTypeIsNull() {
            addCriterion("res_type is null");
            return (Criteria) this;
        }

        public Criteria andResTypeIsNotNull() {
            addCriterion("res_type is not null");
            return (Criteria) this;
        }

        public Criteria andResTypeEqualTo(String value) {
            addCriterion("res_type =", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeNotEqualTo(String value) {
            addCriterion("res_type <>", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeGreaterThan(String value) {
            addCriterion("res_type >", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeGreaterThanOrEqualTo(String value) {
            addCriterion("res_type >=", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeLessThan(String value) {
            addCriterion("res_type <", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeLessThanOrEqualTo(String value) {
            addCriterion("res_type <=", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeLike(String value) {
            addCriterion("res_type like", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeNotLike(String value) {
            addCriterion("res_type not like", value, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeIn(List<String> values) {
            addCriterion("res_type in", values, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeNotIn(List<String> values) {
            addCriterion("res_type not in", values, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeBetween(String value1, String value2) {
            addCriterion("res_type between", value1, value2, "resType");
            return (Criteria) this;
        }

        public Criteria andResTypeNotBetween(String value1, String value2) {
            addCriterion("res_type not between", value1, value2, "resType");
            return (Criteria) this;
        }

        public Criteria andResPathIsNull() {
            addCriterion("res_path is null");
            return (Criteria) this;
        }

        public Criteria andResPathIsNotNull() {
            addCriterion("res_path is not null");
            return (Criteria) this;
        }

        public Criteria andResPathEqualTo(String value) {
            addCriterion("res_path =", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathNotEqualTo(String value) {
            addCriterion("res_path <>", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathGreaterThan(String value) {
            addCriterion("res_path >", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathGreaterThanOrEqualTo(String value) {
            addCriterion("res_path >=", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathLessThan(String value) {
            addCriterion("res_path <", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathLessThanOrEqualTo(String value) {
            addCriterion("res_path <=", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathLike(String value) {
            addCriterion("res_path like", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathNotLike(String value) {
            addCriterion("res_path not like", value, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathIn(List<String> values) {
            addCriterion("res_path in", values, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathNotIn(List<String> values) {
            addCriterion("res_path not in", values, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathBetween(String value1, String value2) {
            addCriterion("res_path between", value1, value2, "resPath");
            return (Criteria) this;
        }

        public Criteria andResPathNotBetween(String value1, String value2) {
            addCriterion("res_path not between", value1, value2, "resPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathIsNull() {
            addCriterion("res_compress_path is null");
            return (Criteria) this;
        }

        public Criteria andResCompressPathIsNotNull() {
            addCriterion("res_compress_path is not null");
            return (Criteria) this;
        }

        public Criteria andResCompressPathEqualTo(String value) {
            addCriterion("res_compress_path =", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathNotEqualTo(String value) {
            addCriterion("res_compress_path <>", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathGreaterThan(String value) {
            addCriterion("res_compress_path >", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathGreaterThanOrEqualTo(String value) {
            addCriterion("res_compress_path >=", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathLessThan(String value) {
            addCriterion("res_compress_path <", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathLessThanOrEqualTo(String value) {
            addCriterion("res_compress_path <=", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathLike(String value) {
            addCriterion("res_compress_path like", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathNotLike(String value) {
            addCriterion("res_compress_path not like", value, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathIn(List<String> values) {
            addCriterion("res_compress_path in", values, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathNotIn(List<String> values) {
            addCriterion("res_compress_path not in", values, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathBetween(String value1, String value2) {
            addCriterion("res_compress_path between", value1, value2, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResCompressPathNotBetween(String value1, String value2) {
            addCriterion("res_compress_path not between", value1, value2, "resCompressPath");
            return (Criteria) this;
        }

        public Criteria andResSizeIsNull() {
            addCriterion("res_size is null");
            return (Criteria) this;
        }

        public Criteria andResSizeIsNotNull() {
            addCriterion("res_size is not null");
            return (Criteria) this;
        }

        public Criteria andResSizeEqualTo(Long value) {
            addCriterion("res_size =", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeNotEqualTo(Long value) {
            addCriterion("res_size <>", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeGreaterThan(Long value) {
            addCriterion("res_size >", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeGreaterThanOrEqualTo(Long value) {
            addCriterion("res_size >=", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeLessThan(Long value) {
            addCriterion("res_size <", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeLessThanOrEqualTo(Long value) {
            addCriterion("res_size <=", value, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeIn(List<Long> values) {
            addCriterion("res_size in", values, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeNotIn(List<Long> values) {
            addCriterion("res_size not in", values, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeBetween(Long value1, Long value2) {
            addCriterion("res_size between", value1, value2, "resSize");
            return (Criteria) this;
        }

        public Criteria andResSizeNotBetween(Long value1, Long value2) {
            addCriterion("res_size not between", value1, value2, "resSize");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeIsNull() {
            addCriterion("res_create_time is null");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeIsNotNull() {
            addCriterion("res_create_time is not null");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeEqualTo(Date value) {
            addCriterion("res_create_time =", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeNotEqualTo(Date value) {
            addCriterion("res_create_time <>", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeGreaterThan(Date value) {
            addCriterion("res_create_time >", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("res_create_time >=", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeLessThan(Date value) {
            addCriterion("res_create_time <", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeLessThanOrEqualTo(Date value) {
            addCriterion("res_create_time <=", value, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeIn(List<Date> values) {
            addCriterion("res_create_time in", values, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeNotIn(List<Date> values) {
            addCriterion("res_create_time not in", values, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeBetween(Date value1, Date value2) {
            addCriterion("res_create_time between", value1, value2, "resCreateTime");
            return (Criteria) this;
        }

        public Criteria andResCreateTimeNotBetween(Date value1, Date value2) {
            addCriterion("res_create_time not between", value1, value2, "resCreateTime");
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