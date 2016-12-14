package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pro.model.Page;

public class PumpExample {
	protected String orderByClause;

	protected Page page;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
	}

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

		public Criteria andPumpNameIsNull() {
			addCriterion("pump_name is null");
			return (Criteria) this;
		}

		public Criteria andPumpNameIsNotNull() {
			addCriterion("pump_name is not null");
			return (Criteria) this;
		}

		public Criteria andPumpNameEqualTo(String value) {
			addCriterion("pump_name =", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameNotEqualTo(String value) {
			addCriterion("pump_name <>", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameGreaterThan(String value) {
			addCriterion("pump_name >", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameGreaterThanOrEqualTo(String value) {
			addCriterion("pump_name >=", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameLessThan(String value) {
			addCriterion("pump_name <", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameLessThanOrEqualTo(String value) {
			addCriterion("pump_name <=", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameLike(String value) {
			addCriterion("pump_name like", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameNotLike(String value) {
			addCriterion("pump_name not like", value, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameIn(List<String> values) {
			addCriterion("pump_name in", values, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameNotIn(List<String> values) {
			addCriterion("pump_name not in", values, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameBetween(String value1, String value2) {
			addCriterion("pump_name between", value1, value2, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpNameNotBetween(String value1, String value2) {
			addCriterion("pump_name not between", value1, value2, "pumpName");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdIsNull() {
			addCriterion("pump_owner_id is null");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdIsNotNull() {
			addCriterion("pump_owner_id is not null");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdEqualTo(Long value) {
			addCriterion("pump_owner_id =", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdNotEqualTo(Long value) {
			addCriterion("pump_owner_id <>", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdGreaterThan(Long value) {
			addCriterion("pump_owner_id >", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdGreaterThanOrEqualTo(Long value) {
			addCriterion("pump_owner_id >=", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdLessThan(Long value) {
			addCriterion("pump_owner_id <", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdLessThanOrEqualTo(Long value) {
			addCriterion("pump_owner_id <=", value, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdIn(List<Long> values) {
			addCriterion("pump_owner_id in", values, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdNotIn(List<Long> values) {
			addCriterion("pump_owner_id not in", values, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdBetween(Long value1, Long value2) {
			addCriterion("pump_owner_id between", value1, value2, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpOwnerIdNotBetween(Long value1, Long value2) {
			addCriterion("pump_owner_id not between", value1, value2, "pumpOwnerId");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeIsNull() {
			addCriterion("pump_city_code is null");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeIsNotNull() {
			addCriterion("pump_city_code is not null");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeEqualTo(String value) {
			addCriterion("pump_city_code =", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeNotEqualTo(String value) {
			addCriterion("pump_city_code <>", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeGreaterThan(String value) {
			addCriterion("pump_city_code >", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeGreaterThanOrEqualTo(String value) {
			addCriterion("pump_city_code >=", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeLessThan(String value) {
			addCriterion("pump_city_code <", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeLessThanOrEqualTo(String value) {
			addCriterion("pump_city_code <=", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeLike(String value) {
			addCriterion("pump_city_code like", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeNotLike(String value) {
			addCriterion("pump_city_code not like", value, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeIn(List<String> values) {
			addCriterion("pump_city_code in", values, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeNotIn(List<String> values) {
			addCriterion("pump_city_code not in", values, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeBetween(String value1, String value2) {
			addCriterion("pump_city_code between", value1, value2, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpCityCodeNotBetween(String value1, String value2) {
			addCriterion("pump_city_code not between", value1, value2, "pumpCityCode");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeIsNull() {
			addCriterion("pump_longitude is null");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeIsNotNull() {
			addCriterion("pump_longitude is not null");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeEqualTo(String value) {
			addCriterion("pump_longitude =", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeNotEqualTo(String value) {
			addCriterion("pump_longitude <>", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeGreaterThan(String value) {
			addCriterion("pump_longitude >", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeGreaterThanOrEqualTo(String value) {
			addCriterion("pump_longitude >=", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeLessThan(String value) {
			addCriterion("pump_longitude <", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeLessThanOrEqualTo(String value) {
			addCriterion("pump_longitude <=", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeLike(String value) {
			addCriterion("pump_longitude like", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeNotLike(String value) {
			addCriterion("pump_longitude not like", value, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeIn(List<String> values) {
			addCriterion("pump_longitude in", values, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeNotIn(List<String> values) {
			addCriterion("pump_longitude not in", values, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeBetween(String value1, String value2) {
			addCriterion("pump_longitude between", value1, value2, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLongitudeNotBetween(String value1, String value2) {
			addCriterion("pump_longitude not between", value1, value2, "pumpLongitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeIsNull() {
			addCriterion("pump_latitude is null");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeIsNotNull() {
			addCriterion("pump_latitude is not null");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeEqualTo(String value) {
			addCriterion("pump_latitude =", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeNotEqualTo(String value) {
			addCriterion("pump_latitude <>", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeGreaterThan(String value) {
			addCriterion("pump_latitude >", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeGreaterThanOrEqualTo(String value) {
			addCriterion("pump_latitude >=", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeLessThan(String value) {
			addCriterion("pump_latitude <", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeLessThanOrEqualTo(String value) {
			addCriterion("pump_latitude <=", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeLike(String value) {
			addCriterion("pump_latitude like", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeNotLike(String value) {
			addCriterion("pump_latitude not like", value, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeIn(List<String> values) {
			addCriterion("pump_latitude in", values, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeNotIn(List<String> values) {
			addCriterion("pump_latitude not in", values, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeBetween(String value1, String value2) {
			addCriterion("pump_latitude between", value1, value2, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpLatitudeNotBetween(String value1, String value2) {
			addCriterion("pump_latitude not between", value1, value2, "pumpLatitude");
			return (Criteria) this;
		}

		public Criteria andPumpAddressIsNull() {
			addCriterion("pump_address is null");
			return (Criteria) this;
		}

		public Criteria andPumpAddressIsNotNull() {
			addCriterion("pump_address is not null");
			return (Criteria) this;
		}

		public Criteria andPumpAddressEqualTo(String value) {
			addCriterion("pump_address =", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressNotEqualTo(String value) {
			addCriterion("pump_address <>", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressGreaterThan(String value) {
			addCriterion("pump_address >", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressGreaterThanOrEqualTo(String value) {
			addCriterion("pump_address >=", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressLessThan(String value) {
			addCriterion("pump_address <", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressLessThanOrEqualTo(String value) {
			addCriterion("pump_address <=", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressLike(String value) {
			addCriterion("pump_address like", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressNotLike(String value) {
			addCriterion("pump_address not like", value, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressIn(List<String> values) {
			addCriterion("pump_address in", values, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressNotIn(List<String> values) {
			addCriterion("pump_address not in", values, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressBetween(String value1, String value2) {
			addCriterion("pump_address between", value1, value2, "pumpAddress");
			return (Criteria) this;
		}

		public Criteria andPumpAddressNotBetween(String value1, String value2) {
			addCriterion("pump_address not between", value1, value2, "pumpAddress");
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