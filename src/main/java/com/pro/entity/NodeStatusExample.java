package com.pro.entity;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class NodeStatusExample {
    protected String orderByClause;

    protected boolean distinct;

    protected List<Criteria> oredCriteria;

    public NodeStatusExample() {
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

        public Criteria andNodeIdIsNull() {
            addCriterion("node_id is null");
            return (Criteria) this;
        }

        public Criteria andNodeIdIsNotNull() {
            addCriterion("node_id is not null");
            return (Criteria) this;
        }

        public Criteria andNodeIdEqualTo(Long value) {
            addCriterion("node_id =", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotEqualTo(Long value) {
            addCriterion("node_id <>", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThan(Long value) {
            addCriterion("node_id >", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdGreaterThanOrEqualTo(Long value) {
            addCriterion("node_id >=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThan(Long value) {
            addCriterion("node_id <", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdLessThanOrEqualTo(Long value) {
            addCriterion("node_id <=", value, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdIn(List<Long> values) {
            addCriterion("node_id in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotIn(List<Long> values) {
            addCriterion("node_id not in", values, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdBetween(Long value1, Long value2) {
            addCriterion("node_id between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andNodeIdNotBetween(Long value1, Long value2) {
            addCriterion("node_id not between", value1, value2, "nodeId");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempIsNull() {
            addCriterion("back_water_temp is null");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempIsNotNull() {
            addCriterion("back_water_temp is not null");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempEqualTo(BigDecimal value) {
            addCriterion("back_water_temp =", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempNotEqualTo(BigDecimal value) {
            addCriterion("back_water_temp <>", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempGreaterThan(BigDecimal value) {
            addCriterion("back_water_temp >", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("back_water_temp >=", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempLessThan(BigDecimal value) {
            addCriterion("back_water_temp <", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("back_water_temp <=", value, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempIn(List<BigDecimal> values) {
            addCriterion("back_water_temp in", values, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempNotIn(List<BigDecimal> values) {
            addCriterion("back_water_temp not in", values, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("back_water_temp between", value1, value2, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andBackWaterTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("back_water_temp not between", value1, value2, "backWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempIsNull() {
            addCriterion("out_water_temp is null");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempIsNotNull() {
            addCriterion("out_water_temp is not null");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempEqualTo(BigDecimal value) {
            addCriterion("out_water_temp =", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempNotEqualTo(BigDecimal value) {
            addCriterion("out_water_temp <>", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempGreaterThan(BigDecimal value) {
            addCriterion("out_water_temp >", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("out_water_temp >=", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempLessThan(BigDecimal value) {
            addCriterion("out_water_temp <", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("out_water_temp <=", value, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempIn(List<BigDecimal> values) {
            addCriterion("out_water_temp in", values, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempNotIn(List<BigDecimal> values) {
            addCriterion("out_water_temp not in", values, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("out_water_temp between", value1, value2, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andOutWaterTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("out_water_temp not between", value1, value2, "outWaterTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempIsNull() {
            addCriterion("environment_temp is null");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempIsNotNull() {
            addCriterion("environment_temp is not null");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempEqualTo(BigDecimal value) {
            addCriterion("environment_temp =", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempNotEqualTo(BigDecimal value) {
            addCriterion("environment_temp <>", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempGreaterThan(BigDecimal value) {
            addCriterion("environment_temp >", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("environment_temp >=", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempLessThan(BigDecimal value) {
            addCriterion("environment_temp <", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("environment_temp <=", value, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempIn(List<BigDecimal> values) {
            addCriterion("environment_temp in", values, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempNotIn(List<BigDecimal> values) {
            addCriterion("environment_temp not in", values, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("environment_temp between", value1, value2, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andEnvironmentTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("environment_temp not between", value1, value2, "environmentTemp");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentIsNull() {
            addCriterion("compressor_current is null");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentIsNotNull() {
            addCriterion("compressor_current is not null");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentEqualTo(BigDecimal value) {
            addCriterion("compressor_current =", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentNotEqualTo(BigDecimal value) {
            addCriterion("compressor_current <>", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentGreaterThan(BigDecimal value) {
            addCriterion("compressor_current >", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("compressor_current >=", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentLessThan(BigDecimal value) {
            addCriterion("compressor_current <", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentLessThanOrEqualTo(BigDecimal value) {
            addCriterion("compressor_current <=", value, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentIn(List<BigDecimal> values) {
            addCriterion("compressor_current in", values, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentNotIn(List<BigDecimal> values) {
            addCriterion("compressor_current not in", values, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("compressor_current between", value1, value2, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andCompressorCurrentNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("compressor_current not between", value1, value2, "compressorCurrent");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempIsNull() {
            addCriterion("water_tank_temp is null");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempIsNotNull() {
            addCriterion("water_tank_temp is not null");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempEqualTo(BigDecimal value) {
            addCriterion("water_tank_temp =", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempNotEqualTo(BigDecimal value) {
            addCriterion("water_tank_temp <>", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempGreaterThan(BigDecimal value) {
            addCriterion("water_tank_temp >", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("water_tank_temp >=", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempLessThan(BigDecimal value) {
            addCriterion("water_tank_temp <", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("water_tank_temp <=", value, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempIn(List<BigDecimal> values) {
            addCriterion("water_tank_temp in", values, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempNotIn(List<BigDecimal> values) {
            addCriterion("water_tank_temp not in", values, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("water_tank_temp between", value1, value2, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWaterTankTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("water_tank_temp not between", value1, value2, "waterTankTemp");
            return (Criteria) this;
        }

        public Criteria andWorkModeIsNull() {
            addCriterion("work_mode is null");
            return (Criteria) this;
        }

        public Criteria andWorkModeIsNotNull() {
            addCriterion("work_mode is not null");
            return (Criteria) this;
        }

        public Criteria andWorkModeEqualTo(String value) {
            addCriterion("work_mode =", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeNotEqualTo(String value) {
            addCriterion("work_mode <>", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeGreaterThan(String value) {
            addCriterion("work_mode >", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeGreaterThanOrEqualTo(String value) {
            addCriterion("work_mode >=", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeLessThan(String value) {
            addCriterion("work_mode <", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeLessThanOrEqualTo(String value) {
            addCriterion("work_mode <=", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeLike(String value) {
            addCriterion("work_mode like", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeNotLike(String value) {
            addCriterion("work_mode not like", value, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeIn(List<String> values) {
            addCriterion("work_mode in", values, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeNotIn(List<String> values) {
            addCriterion("work_mode not in", values, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeBetween(String value1, String value2) {
            addCriterion("work_mode between", value1, value2, "workMode");
            return (Criteria) this;
        }

        public Criteria andWorkModeNotBetween(String value1, String value2) {
            addCriterion("work_mode not between", value1, value2, "workMode");
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

        public Criteria andBackAirTempIsNull() {
            addCriterion("back_air_temp is null");
            return (Criteria) this;
        }

        public Criteria andBackAirTempIsNotNull() {
            addCriterion("back_air_temp is not null");
            return (Criteria) this;
        }

        public Criteria andBackAirTempEqualTo(BigDecimal value) {
            addCriterion("back_air_temp =", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempNotEqualTo(BigDecimal value) {
            addCriterion("back_air_temp <>", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempGreaterThan(BigDecimal value) {
            addCriterion("back_air_temp >", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("back_air_temp >=", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempLessThan(BigDecimal value) {
            addCriterion("back_air_temp <", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("back_air_temp <=", value, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempIn(List<BigDecimal> values) {
            addCriterion("back_air_temp in", values, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempNotIn(List<BigDecimal> values) {
            addCriterion("back_air_temp not in", values, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("back_air_temp between", value1, value2, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andBackAirTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("back_air_temp not between", value1, value2, "backAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempIsNull() {
            addCriterion("out_air_temp is null");
            return (Criteria) this;
        }

        public Criteria andOutAirTempIsNotNull() {
            addCriterion("out_air_temp is not null");
            return (Criteria) this;
        }

        public Criteria andOutAirTempEqualTo(BigDecimal value) {
            addCriterion("out_air_temp =", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempNotEqualTo(BigDecimal value) {
            addCriterion("out_air_temp <>", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempGreaterThan(BigDecimal value) {
            addCriterion("out_air_temp >", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("out_air_temp >=", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempLessThan(BigDecimal value) {
            addCriterion("out_air_temp <", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("out_air_temp <=", value, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempIn(List<BigDecimal> values) {
            addCriterion("out_air_temp in", values, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempNotIn(List<BigDecimal> values) {
            addCriterion("out_air_temp not in", values, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("out_air_temp between", value1, value2, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andOutAirTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("out_air_temp not between", value1, value2, "outAirTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempIsNull() {
            addCriterion("set_up_temp is null");
            return (Criteria) this;
        }

        public Criteria andSetUpTempIsNotNull() {
            addCriterion("set_up_temp is not null");
            return (Criteria) this;
        }

        public Criteria andSetUpTempEqualTo(BigDecimal value) {
            addCriterion("set_up_temp =", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempNotEqualTo(BigDecimal value) {
            addCriterion("set_up_temp <>", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempGreaterThan(BigDecimal value) {
            addCriterion("set_up_temp >", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("set_up_temp >=", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempLessThan(BigDecimal value) {
            addCriterion("set_up_temp <", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("set_up_temp <=", value, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempIn(List<BigDecimal> values) {
            addCriterion("set_up_temp in", values, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempNotIn(List<BigDecimal> values) {
            addCriterion("set_up_temp not in", values, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("set_up_temp between", value1, value2, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andSetUpTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("set_up_temp not between", value1, value2, "setUpTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempIsNull() {
            addCriterion("indoor_temp is null");
            return (Criteria) this;
        }

        public Criteria andIndoorTempIsNotNull() {
            addCriterion("indoor_temp is not null");
            return (Criteria) this;
        }

        public Criteria andIndoorTempEqualTo(BigDecimal value) {
            addCriterion("indoor_temp =", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempNotEqualTo(BigDecimal value) {
            addCriterion("indoor_temp <>", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempGreaterThan(BigDecimal value) {
            addCriterion("indoor_temp >", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempGreaterThanOrEqualTo(BigDecimal value) {
            addCriterion("indoor_temp >=", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempLessThan(BigDecimal value) {
            addCriterion("indoor_temp <", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempLessThanOrEqualTo(BigDecimal value) {
            addCriterion("indoor_temp <=", value, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempIn(List<BigDecimal> values) {
            addCriterion("indoor_temp in", values, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempNotIn(List<BigDecimal> values) {
            addCriterion("indoor_temp not in", values, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("indoor_temp between", value1, value2, "indoorTemp");
            return (Criteria) this;
        }

        public Criteria andIndoorTempNotBetween(BigDecimal value1, BigDecimal value2) {
            addCriterion("indoor_temp not between", value1, value2, "indoorTemp");
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