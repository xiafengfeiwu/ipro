package com.pro.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class ProjectExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public ProjectExample() {
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

        public Criteria andProjectNameIsNull() {
            addCriterion("project_name is null");
            return (Criteria) this;
        }

        public Criteria andProjectNameIsNotNull() {
            addCriterion("project_name is not null");
            return (Criteria) this;
        }

        public Criteria andProjectNameEqualTo(String value) {
            addCriterion("project_name =", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotEqualTo(String value) {
            addCriterion("project_name <>", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameGreaterThan(String value) {
            addCriterion("project_name >", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameGreaterThanOrEqualTo(String value) {
            addCriterion("project_name >=", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLessThan(String value) {
            addCriterion("project_name <", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLessThanOrEqualTo(String value) {
            addCriterion("project_name <=", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameLike(String value) {
            addCriterion("project_name like", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotLike(String value) {
            addCriterion("project_name not like", value, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameIn(List<String> values) {
            addCriterion("project_name in", values, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotIn(List<String> values) {
            addCriterion("project_name not in", values, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameBetween(String value1, String value2) {
            addCriterion("project_name between", value1, value2, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectNameNotBetween(String value1, String value2) {
            addCriterion("project_name not between", value1, value2, "projectName");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdIsNull() {
            addCriterion("project_owner_id is null");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdIsNotNull() {
            addCriterion("project_owner_id is not null");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdEqualTo(Long value) {
            addCriterion("project_owner_id =", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdNotEqualTo(Long value) {
            addCriterion("project_owner_id <>", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdGreaterThan(Long value) {
            addCriterion("project_owner_id >", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdGreaterThanOrEqualTo(Long value) {
            addCriterion("project_owner_id >=", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdLessThan(Long value) {
            addCriterion("project_owner_id <", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdLessThanOrEqualTo(Long value) {
            addCriterion("project_owner_id <=", value, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdIn(List<Long> values) {
            addCriterion("project_owner_id in", values, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdNotIn(List<Long> values) {
            addCriterion("project_owner_id not in", values, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdBetween(Long value1, Long value2) {
            addCriterion("project_owner_id between", value1, value2, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andProjectOwnerIdNotBetween(Long value1, Long value2) {
            addCriterion("project_owner_id not between", value1, value2, "projectOwnerId");
            return (Criteria) this;
        }

        public Criteria andOwnerNameIsNull() {
            addCriterion("owner_name is null");
            return (Criteria) this;
        }

        public Criteria andOwnerNameIsNotNull() {
            addCriterion("owner_name is not null");
            return (Criteria) this;
        }

        public Criteria andOwnerNameEqualTo(String value) {
            addCriterion("owner_name =", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameNotEqualTo(String value) {
            addCriterion("owner_name <>", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameGreaterThan(String value) {
            addCriterion("owner_name >", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameGreaterThanOrEqualTo(String value) {
            addCriterion("owner_name >=", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameLessThan(String value) {
            addCriterion("owner_name <", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameLessThanOrEqualTo(String value) {
            addCriterion("owner_name <=", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameLike(String value) {
            addCriterion("owner_name like", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameNotLike(String value) {
            addCriterion("owner_name not like", value, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameIn(List<String> values) {
            addCriterion("owner_name in", values, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameNotIn(List<String> values) {
            addCriterion("owner_name not in", values, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameBetween(String value1, String value2) {
            addCriterion("owner_name between", value1, value2, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerNameNotBetween(String value1, String value2) {
            addCriterion("owner_name not between", value1, value2, "ownerName");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoIsNull() {
            addCriterion("owner_phone_no is null");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoIsNotNull() {
            addCriterion("owner_phone_no is not null");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoEqualTo(String value) {
            addCriterion("owner_phone_no =", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoNotEqualTo(String value) {
            addCriterion("owner_phone_no <>", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoGreaterThan(String value) {
            addCriterion("owner_phone_no >", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoGreaterThanOrEqualTo(String value) {
            addCriterion("owner_phone_no >=", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoLessThan(String value) {
            addCriterion("owner_phone_no <", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoLessThanOrEqualTo(String value) {
            addCriterion("owner_phone_no <=", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoLike(String value) {
            addCriterion("owner_phone_no like", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoNotLike(String value) {
            addCriterion("owner_phone_no not like", value, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoIn(List<String> values) {
            addCriterion("owner_phone_no in", values, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoNotIn(List<String> values) {
            addCriterion("owner_phone_no not in", values, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoBetween(String value1, String value2) {
            addCriterion("owner_phone_no between", value1, value2, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerPhoneNoNotBetween(String value1, String value2) {
            addCriterion("owner_phone_no not between", value1, value2, "ownerPhoneNo");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeIsNull() {
            addCriterion("owner_type is null");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeIsNotNull() {
            addCriterion("owner_type is not null");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeEqualTo(String value) {
            addCriterion("owner_type =", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeNotEqualTo(String value) {
            addCriterion("owner_type <>", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeGreaterThan(String value) {
            addCriterion("owner_type >", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeGreaterThanOrEqualTo(String value) {
            addCriterion("owner_type >=", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeLessThan(String value) {
            addCriterion("owner_type <", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeLessThanOrEqualTo(String value) {
            addCriterion("owner_type <=", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeLike(String value) {
            addCriterion("owner_type like", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeNotLike(String value) {
            addCriterion("owner_type not like", value, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeIn(List<String> values) {
            addCriterion("owner_type in", values, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeNotIn(List<String> values) {
            addCriterion("owner_type not in", values, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeBetween(String value1, String value2) {
            addCriterion("owner_type between", value1, value2, "ownerType");
            return (Criteria) this;
        }

        public Criteria andOwnerTypeNotBetween(String value1, String value2) {
            addCriterion("owner_type not between", value1, value2, "ownerType");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaIsNull() {
            addCriterion("heating_area is null");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaIsNotNull() {
            addCriterion("heating_area is not null");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaEqualTo(BigDecimal value) {
            addCriterion("heating_area =", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaNotEqualTo(BigDecimal value) {
            addCriterion("heating_area <>", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaGreaterThan(BigDecimal value) {
            addCriterion("heating_area >", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("heating_area >=", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaLessThan(BigDecimal value) {
            addCriterion("heating_area <", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaLessThanOrEqualTo(BigDecimal value) {
            addCriterion("heating_area <=", value, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaIn(List<BigDecimal> values) {
            addCriterion("heating_area in", values, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaNotIn(List<BigDecimal> values) {
            addCriterion("heating_area not in", values, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("heating_area between", value1, value2, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingAreaNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("heating_area not between", value1, value2, "heatingArea");
            return (Criteria) this;
        }

        public Criteria andHeatingTempIsNull() {
            addCriterion("heating_temp is null");
            return (Criteria) this;
        }

        public Criteria andHeatingTempIsNotNull() {
            addCriterion("heating_temp is not null");
            return (Criteria) this;
        }

        public Criteria andHeatingTempEqualTo(BigDecimal value) {
            addCriterion("heating_temp =", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempNotEqualTo(BigDecimal value) {
            addCriterion("heating_temp <>", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempGreaterThan(BigDecimal value) {
            addCriterion("heating_temp >", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("heating_temp >=", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempLessThan(BigDecimal value) {
            addCriterion("heating_temp <", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("heating_temp <=", value, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempIn(List<BigDecimal> values) {
            addCriterion("heating_temp in", values, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempNotIn(List<BigDecimal> values) {
            addCriterion("heating_temp not in", values, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("heating_temp between", value1, value2, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andHeatingTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("heating_temp not between", value1, value2, "heatingTemp");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeIsNull() {
            addCriterion("area_longitude is null");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeIsNotNull() {
            addCriterion("area_longitude is not null");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeEqualTo(String value) {
            addCriterion("area_longitude =", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeNotEqualTo(String value) {
            addCriterion("area_longitude <>", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeGreaterThan(String value) {
            addCriterion("area_longitude >", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeGreaterThanOrEqualTo(String value) {
            addCriterion("area_longitude >=", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeLessThan(String value) {
            addCriterion("area_longitude <", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeLessThanOrEqualTo(String value) {
            addCriterion("area_longitude <=", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeLike(String value) {
            addCriterion("area_longitude like", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeNotLike(String value) {
            addCriterion("area_longitude not like", value, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeIn(List<String> values) {
            addCriterion("area_longitude in", values, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeNotIn(List<String> values) {
            addCriterion("area_longitude not in", values, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeBetween(String value1, String value2) {
            addCriterion("area_longitude between", value1, value2, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLongitudeNotBetween(String value1, String value2) {
            addCriterion("area_longitude not between", value1, value2, "areaLongitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeIsNull() {
            addCriterion("area_latitude is null");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeIsNotNull() {
            addCriterion("area_latitude is not null");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeEqualTo(String value) {
            addCriterion("area_latitude =", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeNotEqualTo(String value) {
            addCriterion("area_latitude <>", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeGreaterThan(String value) {
            addCriterion("area_latitude >", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeGreaterThanOrEqualTo(String value) {
            addCriterion("area_latitude >=", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeLessThan(String value) {
            addCriterion("area_latitude <", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeLessThanOrEqualTo(String value) {
            addCriterion("area_latitude <=", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeLike(String value) {
            addCriterion("area_latitude like", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeNotLike(String value) {
            addCriterion("area_latitude not like", value, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeIn(List<String> values) {
            addCriterion("area_latitude in", values, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeNotIn(List<String> values) {
            addCriterion("area_latitude not in", values, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeBetween(String value1, String value2) {
            addCriterion("area_latitude between", value1, value2, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaLatitudeNotBetween(String value1, String value2) {
            addCriterion("area_latitude not between", value1, value2, "areaLatitude");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionIsNull() {
            addCriterion("area_weather_condition is null");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionIsNotNull() {
            addCriterion("area_weather_condition is not null");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionEqualTo(String value) {
            addCriterion("area_weather_condition =", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionNotEqualTo(String value) {
            addCriterion("area_weather_condition <>", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionGreaterThan(String value) {
            addCriterion("area_weather_condition >", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionGreaterThanOrEqualTo(String value) {
            addCriterion("area_weather_condition >=", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionLessThan(String value) {
            addCriterion("area_weather_condition <", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionLessThanOrEqualTo(String value) {
            addCriterion("area_weather_condition <=", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionLike(String value) {
            addCriterion("area_weather_condition like", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionNotLike(String value) {
            addCriterion("area_weather_condition not like", value, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionIn(List<String> values) {
            addCriterion("area_weather_condition in", values, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionNotIn(List<String> values) {
            addCriterion("area_weather_condition not in", values, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionBetween(String value1, String value2) {
            addCriterion("area_weather_condition between", value1, value2, "areaWeatherCondition");
            return (Criteria) this;
        }

        public Criteria andAreaWeatherConditionNotBetween(String value1, String value2) {
            addCriterion("area_weather_condition not between", value1, value2, "areaWeatherCondition");
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

        public Criteria andModifyTimeIsNull() {
            addCriterion("modify_time is null");
            return (Criteria) this;
        }

        public Criteria andModifyTimeIsNotNull() {
            addCriterion("modify_time is not null");
            return (Criteria) this;
        }

        public Criteria andModifyTimeEqualTo(Date value) {
            addCriterion("modify_time =", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeNotEqualTo(Date value) {
            addCriterion("modify_time <>", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeGreaterThan(Date value) {
            addCriterion("modify_time >", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeGreaterThanOrEqualTo(Date value) {
            addCriterion("modify_time >=", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeLessThan(Date value) {
            addCriterion("modify_time <", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeLessThanOrEqualTo(Date value) {
            addCriterion("modify_time <=", value, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeIn(List<Date> values) {
            addCriterion("modify_time in", values, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeNotIn(List<Date> values) {
            addCriterion("modify_time not in", values, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeBetween(Date value1, Date value2) {
            addCriterion("modify_time between", value1, value2, "modifyTime");
            return (Criteria) this;
        }

        public Criteria andModifyTimeNotBetween(Date value1, Date value2) {
            addCriterion("modify_time not between", value1, value2, "modifyTime");
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