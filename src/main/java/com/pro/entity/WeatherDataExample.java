package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import com.pro.model.Page;

public class WeatherDataExample {
	protected String orderByClause;

	protected boolean distinct;

	protected Page page;

	protected List<Criteria> oredCriteria;

	public WeatherDataExample() {
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

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
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

		public Criteria andWeatherCityCodeIsNull() {
			addCriterion("weather_city_code is null");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeIsNotNull() {
			addCriterion("weather_city_code is not null");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeEqualTo(String value) {
			addCriterion("weather_city_code =", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeNotEqualTo(String value) {
			addCriterion("weather_city_code <>", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeGreaterThan(String value) {
			addCriterion("weather_city_code >", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeGreaterThanOrEqualTo(String value) {
			addCriterion("weather_city_code >=", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeLessThan(String value) {
			addCriterion("weather_city_code <", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeLessThanOrEqualTo(String value) {
			addCriterion("weather_city_code <=", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeLike(String value) {
			addCriterion("weather_city_code like", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeNotLike(String value) {
			addCriterion("weather_city_code not like", value, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeIn(List<String> values) {
			addCriterion("weather_city_code in", values, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeNotIn(List<String> values) {
			addCriterion("weather_city_code not in", values, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeBetween(String value1, String value2) {
			addCriterion("weather_city_code between", value1, value2, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andWeatherCityCodeNotBetween(String value1, String value2) {
			addCriterion("weather_city_code not between", value1, value2, "weatherCityCode");
			return (Criteria) this;
		}

		public Criteria andCollectDateIsNull() {
			addCriterion("collect_date is null");
			return (Criteria) this;
		}

		public Criteria andCollectDateIsNotNull() {
			addCriterion("collect_date is not null");
			return (Criteria) this;
		}

		public Criteria andCollectDateEqualTo(Date value) {
			addCriterionForJDBCDate("collect_date =", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateNotEqualTo(Date value) {
			addCriterionForJDBCDate("collect_date <>", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateGreaterThan(Date value) {
			addCriterionForJDBCDate("collect_date >", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateGreaterThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("collect_date >=", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateLessThan(Date value) {
			addCriterionForJDBCDate("collect_date <", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateLessThanOrEqualTo(Date value) {
			addCriterionForJDBCDate("collect_date <=", value, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateIn(List<Date> values) {
			addCriterionForJDBCDate("collect_date in", values, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateNotIn(List<Date> values) {
			addCriterionForJDBCDate("collect_date not in", values, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("collect_date between", value1, value2, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCollectDateNotBetween(Date value1, Date value2) {
			addCriterionForJDBCDate("collect_date not between", value1, value2, "collectDate");
			return (Criteria) this;
		}

		public Criteria andCondCodeIsNull() {
			addCriterion("cond_code is null");
			return (Criteria) this;
		}

		public Criteria andCondCodeIsNotNull() {
			addCriterion("cond_code is not null");
			return (Criteria) this;
		}

		public Criteria andCondCodeEqualTo(String value) {
			addCriterion("cond_code =", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeNotEqualTo(String value) {
			addCriterion("cond_code <>", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeGreaterThan(String value) {
			addCriterion("cond_code >", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeGreaterThanOrEqualTo(String value) {
			addCriterion("cond_code >=", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeLessThan(String value) {
			addCriterion("cond_code <", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeLessThanOrEqualTo(String value) {
			addCriterion("cond_code <=", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeLike(String value) {
			addCriterion("cond_code like", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeNotLike(String value) {
			addCriterion("cond_code not like", value, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeIn(List<String> values) {
			addCriterion("cond_code in", values, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeNotIn(List<String> values) {
			addCriterion("cond_code not in", values, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeBetween(String value1, String value2) {
			addCriterion("cond_code between", value1, value2, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeNotBetween(String value1, String value2) {
			addCriterion("cond_code not between", value1, value2, "condCode");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlIsNull() {
			addCriterion("cond_code_url is null");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlIsNotNull() {
			addCriterion("cond_code_url is not null");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlEqualTo(String value) {
			addCriterion("cond_code_url =", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlNotEqualTo(String value) {
			addCriterion("cond_code_url <>", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlGreaterThan(String value) {
			addCriterion("cond_code_url >", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlGreaterThanOrEqualTo(String value) {
			addCriterion("cond_code_url >=", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlLessThan(String value) {
			addCriterion("cond_code_url <", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlLessThanOrEqualTo(String value) {
			addCriterion("cond_code_url <=", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlLike(String value) {
			addCriterion("cond_code_url like", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlNotLike(String value) {
			addCriterion("cond_code_url not like", value, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlIn(List<String> values) {
			addCriterion("cond_code_url in", values, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlNotIn(List<String> values) {
			addCriterion("cond_code_url not in", values, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlBetween(String value1, String value2) {
			addCriterion("cond_code_url between", value1, value2, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondCodeUrlNotBetween(String value1, String value2) {
			addCriterion("cond_code_url not between", value1, value2, "condCodeUrl");
			return (Criteria) this;
		}

		public Criteria andCondTxtIsNull() {
			addCriterion("cond_txt is null");
			return (Criteria) this;
		}

		public Criteria andCondTxtIsNotNull() {
			addCriterion("cond_txt is not null");
			return (Criteria) this;
		}

		public Criteria andCondTxtEqualTo(String value) {
			addCriterion("cond_txt =", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtNotEqualTo(String value) {
			addCriterion("cond_txt <>", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtGreaterThan(String value) {
			addCriterion("cond_txt >", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtGreaterThanOrEqualTo(String value) {
			addCriterion("cond_txt >=", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtLessThan(String value) {
			addCriterion("cond_txt <", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtLessThanOrEqualTo(String value) {
			addCriterion("cond_txt <=", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtLike(String value) {
			addCriterion("cond_txt like", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtNotLike(String value) {
			addCriterion("cond_txt not like", value, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtIn(List<String> values) {
			addCriterion("cond_txt in", values, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtNotIn(List<String> values) {
			addCriterion("cond_txt not in", values, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtBetween(String value1, String value2) {
			addCriterion("cond_txt between", value1, value2, "condTxt");
			return (Criteria) this;
		}

		public Criteria andCondTxtNotBetween(String value1, String value2) {
			addCriterion("cond_txt not between", value1, value2, "condTxt");
			return (Criteria) this;
		}

		public Criteria andFlIsNull() {
			addCriterion("fl is null");
			return (Criteria) this;
		}

		public Criteria andFlIsNotNull() {
			addCriterion("fl is not null");
			return (Criteria) this;
		}

		public Criteria andFlEqualTo(String value) {
			addCriterion("fl =", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlNotEqualTo(String value) {
			addCriterion("fl <>", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlGreaterThan(String value) {
			addCriterion("fl >", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlGreaterThanOrEqualTo(String value) {
			addCriterion("fl >=", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlLessThan(String value) {
			addCriterion("fl <", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlLessThanOrEqualTo(String value) {
			addCriterion("fl <=", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlLike(String value) {
			addCriterion("fl like", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlNotLike(String value) {
			addCriterion("fl not like", value, "fl");
			return (Criteria) this;
		}

		public Criteria andFlIn(List<String> values) {
			addCriterion("fl in", values, "fl");
			return (Criteria) this;
		}

		public Criteria andFlNotIn(List<String> values) {
			addCriterion("fl not in", values, "fl");
			return (Criteria) this;
		}

		public Criteria andFlBetween(String value1, String value2) {
			addCriterion("fl between", value1, value2, "fl");
			return (Criteria) this;
		}

		public Criteria andFlNotBetween(String value1, String value2) {
			addCriterion("fl not between", value1, value2, "fl");
			return (Criteria) this;
		}

		public Criteria andHumIsNull() {
			addCriterion("hum is null");
			return (Criteria) this;
		}

		public Criteria andHumIsNotNull() {
			addCriterion("hum is not null");
			return (Criteria) this;
		}

		public Criteria andHumEqualTo(String value) {
			addCriterion("hum =", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumNotEqualTo(String value) {
			addCriterion("hum <>", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumGreaterThan(String value) {
			addCriterion("hum >", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumGreaterThanOrEqualTo(String value) {
			addCriterion("hum >=", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumLessThan(String value) {
			addCriterion("hum <", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumLessThanOrEqualTo(String value) {
			addCriterion("hum <=", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumLike(String value) {
			addCriterion("hum like", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumNotLike(String value) {
			addCriterion("hum not like", value, "hum");
			return (Criteria) this;
		}

		public Criteria andHumIn(List<String> values) {
			addCriterion("hum in", values, "hum");
			return (Criteria) this;
		}

		public Criteria andHumNotIn(List<String> values) {
			addCriterion("hum not in", values, "hum");
			return (Criteria) this;
		}

		public Criteria andHumBetween(String value1, String value2) {
			addCriterion("hum between", value1, value2, "hum");
			return (Criteria) this;
		}

		public Criteria andHumNotBetween(String value1, String value2) {
			addCriterion("hum not between", value1, value2, "hum");
			return (Criteria) this;
		}

		public Criteria andPcpnIsNull() {
			addCriterion("pcpn is null");
			return (Criteria) this;
		}

		public Criteria andPcpnIsNotNull() {
			addCriterion("pcpn is not null");
			return (Criteria) this;
		}

		public Criteria andPcpnEqualTo(String value) {
			addCriterion("pcpn =", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnNotEqualTo(String value) {
			addCriterion("pcpn <>", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnGreaterThan(String value) {
			addCriterion("pcpn >", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnGreaterThanOrEqualTo(String value) {
			addCriterion("pcpn >=", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnLessThan(String value) {
			addCriterion("pcpn <", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnLessThanOrEqualTo(String value) {
			addCriterion("pcpn <=", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnLike(String value) {
			addCriterion("pcpn like", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnNotLike(String value) {
			addCriterion("pcpn not like", value, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnIn(List<String> values) {
			addCriterion("pcpn in", values, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnNotIn(List<String> values) {
			addCriterion("pcpn not in", values, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnBetween(String value1, String value2) {
			addCriterion("pcpn between", value1, value2, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPcpnNotBetween(String value1, String value2) {
			addCriterion("pcpn not between", value1, value2, "pcpn");
			return (Criteria) this;
		}

		public Criteria andPresIsNull() {
			addCriterion("pres is null");
			return (Criteria) this;
		}

		public Criteria andPresIsNotNull() {
			addCriterion("pres is not null");
			return (Criteria) this;
		}

		public Criteria andPresEqualTo(String value) {
			addCriterion("pres =", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresNotEqualTo(String value) {
			addCriterion("pres <>", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresGreaterThan(String value) {
			addCriterion("pres >", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresGreaterThanOrEqualTo(String value) {
			addCriterion("pres >=", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresLessThan(String value) {
			addCriterion("pres <", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresLessThanOrEqualTo(String value) {
			addCriterion("pres <=", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresLike(String value) {
			addCriterion("pres like", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresNotLike(String value) {
			addCriterion("pres not like", value, "pres");
			return (Criteria) this;
		}

		public Criteria andPresIn(List<String> values) {
			addCriterion("pres in", values, "pres");
			return (Criteria) this;
		}

		public Criteria andPresNotIn(List<String> values) {
			addCriterion("pres not in", values, "pres");
			return (Criteria) this;
		}

		public Criteria andPresBetween(String value1, String value2) {
			addCriterion("pres between", value1, value2, "pres");
			return (Criteria) this;
		}

		public Criteria andPresNotBetween(String value1, String value2) {
			addCriterion("pres not between", value1, value2, "pres");
			return (Criteria) this;
		}

		public Criteria andTmpIsNull() {
			addCriterion("tmp is null");
			return (Criteria) this;
		}

		public Criteria andTmpIsNotNull() {
			addCriterion("tmp is not null");
			return (Criteria) this;
		}

		public Criteria andTmpEqualTo(String value) {
			addCriterion("tmp =", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpNotEqualTo(String value) {
			addCriterion("tmp <>", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpGreaterThan(String value) {
			addCriterion("tmp >", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpGreaterThanOrEqualTo(String value) {
			addCriterion("tmp >=", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpLessThan(String value) {
			addCriterion("tmp <", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpLessThanOrEqualTo(String value) {
			addCriterion("tmp <=", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpLike(String value) {
			addCriterion("tmp like", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpNotLike(String value) {
			addCriterion("tmp not like", value, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpIn(List<String> values) {
			addCriterion("tmp in", values, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpNotIn(List<String> values) {
			addCriterion("tmp not in", values, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpBetween(String value1, String value2) {
			addCriterion("tmp between", value1, value2, "tmp");
			return (Criteria) this;
		}

		public Criteria andTmpNotBetween(String value1, String value2) {
			addCriterion("tmp not between", value1, value2, "tmp");
			return (Criteria) this;
		}

		public Criteria andVisIsNull() {
			addCriterion("vis is null");
			return (Criteria) this;
		}

		public Criteria andVisIsNotNull() {
			addCriterion("vis is not null");
			return (Criteria) this;
		}

		public Criteria andVisEqualTo(String value) {
			addCriterion("vis =", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisNotEqualTo(String value) {
			addCriterion("vis <>", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisGreaterThan(String value) {
			addCriterion("vis >", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisGreaterThanOrEqualTo(String value) {
			addCriterion("vis >=", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisLessThan(String value) {
			addCriterion("vis <", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisLessThanOrEqualTo(String value) {
			addCriterion("vis <=", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisLike(String value) {
			addCriterion("vis like", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisNotLike(String value) {
			addCriterion("vis not like", value, "vis");
			return (Criteria) this;
		}

		public Criteria andVisIn(List<String> values) {
			addCriterion("vis in", values, "vis");
			return (Criteria) this;
		}

		public Criteria andVisNotIn(List<String> values) {
			addCriterion("vis not in", values, "vis");
			return (Criteria) this;
		}

		public Criteria andVisBetween(String value1, String value2) {
			addCriterion("vis between", value1, value2, "vis");
			return (Criteria) this;
		}

		public Criteria andVisNotBetween(String value1, String value2) {
			addCriterion("vis not between", value1, value2, "vis");
			return (Criteria) this;
		}

		public Criteria andWindDegIsNull() {
			addCriterion("wind_deg is null");
			return (Criteria) this;
		}

		public Criteria andWindDegIsNotNull() {
			addCriterion("wind_deg is not null");
			return (Criteria) this;
		}

		public Criteria andWindDegEqualTo(String value) {
			addCriterion("wind_deg =", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegNotEqualTo(String value) {
			addCriterion("wind_deg <>", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegGreaterThan(String value) {
			addCriterion("wind_deg >", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegGreaterThanOrEqualTo(String value) {
			addCriterion("wind_deg >=", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegLessThan(String value) {
			addCriterion("wind_deg <", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegLessThanOrEqualTo(String value) {
			addCriterion("wind_deg <=", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegLike(String value) {
			addCriterion("wind_deg like", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegNotLike(String value) {
			addCriterion("wind_deg not like", value, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegIn(List<String> values) {
			addCriterion("wind_deg in", values, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegNotIn(List<String> values) {
			addCriterion("wind_deg not in", values, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegBetween(String value1, String value2) {
			addCriterion("wind_deg between", value1, value2, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDegNotBetween(String value1, String value2) {
			addCriterion("wind_deg not between", value1, value2, "windDeg");
			return (Criteria) this;
		}

		public Criteria andWindDirIsNull() {
			addCriterion("wind_dir is null");
			return (Criteria) this;
		}

		public Criteria andWindDirIsNotNull() {
			addCriterion("wind_dir is not null");
			return (Criteria) this;
		}

		public Criteria andWindDirEqualTo(String value) {
			addCriterion("wind_dir =", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirNotEqualTo(String value) {
			addCriterion("wind_dir <>", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirGreaterThan(String value) {
			addCriterion("wind_dir >", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirGreaterThanOrEqualTo(String value) {
			addCriterion("wind_dir >=", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirLessThan(String value) {
			addCriterion("wind_dir <", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirLessThanOrEqualTo(String value) {
			addCriterion("wind_dir <=", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirLike(String value) {
			addCriterion("wind_dir like", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirNotLike(String value) {
			addCriterion("wind_dir not like", value, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirIn(List<String> values) {
			addCriterion("wind_dir in", values, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirNotIn(List<String> values) {
			addCriterion("wind_dir not in", values, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirBetween(String value1, String value2) {
			addCriterion("wind_dir between", value1, value2, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindDirNotBetween(String value1, String value2) {
			addCriterion("wind_dir not between", value1, value2, "windDir");
			return (Criteria) this;
		}

		public Criteria andWindScIsNull() {
			addCriterion("wind_sc is null");
			return (Criteria) this;
		}

		public Criteria andWindScIsNotNull() {
			addCriterion("wind_sc is not null");
			return (Criteria) this;
		}

		public Criteria andWindScEqualTo(String value) {
			addCriterion("wind_sc =", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScNotEqualTo(String value) {
			addCriterion("wind_sc <>", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScGreaterThan(String value) {
			addCriterion("wind_sc >", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScGreaterThanOrEqualTo(String value) {
			addCriterion("wind_sc >=", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScLessThan(String value) {
			addCriterion("wind_sc <", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScLessThanOrEqualTo(String value) {
			addCriterion("wind_sc <=", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScLike(String value) {
			addCriterion("wind_sc like", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScNotLike(String value) {
			addCriterion("wind_sc not like", value, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScIn(List<String> values) {
			addCriterion("wind_sc in", values, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScNotIn(List<String> values) {
			addCriterion("wind_sc not in", values, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScBetween(String value1, String value2) {
			addCriterion("wind_sc between", value1, value2, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindScNotBetween(String value1, String value2) {
			addCriterion("wind_sc not between", value1, value2, "windSc");
			return (Criteria) this;
		}

		public Criteria andWindSpdIsNull() {
			addCriterion("wind_spd is null");
			return (Criteria) this;
		}

		public Criteria andWindSpdIsNotNull() {
			addCriterion("wind_spd is not null");
			return (Criteria) this;
		}

		public Criteria andWindSpdEqualTo(String value) {
			addCriterion("wind_spd =", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdNotEqualTo(String value) {
			addCriterion("wind_spd <>", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdGreaterThan(String value) {
			addCriterion("wind_spd >", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdGreaterThanOrEqualTo(String value) {
			addCriterion("wind_spd >=", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdLessThan(String value) {
			addCriterion("wind_spd <", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdLessThanOrEqualTo(String value) {
			addCriterion("wind_spd <=", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdLike(String value) {
			addCriterion("wind_spd like", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdNotLike(String value) {
			addCriterion("wind_spd not like", value, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdIn(List<String> values) {
			addCriterion("wind_spd in", values, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdNotIn(List<String> values) {
			addCriterion("wind_spd not in", values, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdBetween(String value1, String value2) {
			addCriterion("wind_spd between", value1, value2, "windSpd");
			return (Criteria) this;
		}

		public Criteria andWindSpdNotBetween(String value1, String value2) {
			addCriterion("wind_spd not between", value1, value2, "windSpd");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeIsNull() {
			addCriterion("last_update_time is null");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeIsNotNull() {
			addCriterion("last_update_time is not null");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeEqualTo(Date value) {
			addCriterion("last_update_time =", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeNotEqualTo(Date value) {
			addCriterion("last_update_time <>", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeGreaterThan(Date value) {
			addCriterion("last_update_time >", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("last_update_time >=", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeLessThan(Date value) {
			addCriterion("last_update_time <", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeLessThanOrEqualTo(Date value) {
			addCriterion("last_update_time <=", value, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeIn(List<Date> values) {
			addCriterion("last_update_time in", values, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeNotIn(List<Date> values) {
			addCriterion("last_update_time not in", values, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeBetween(Date value1, Date value2) {
			addCriterion("last_update_time between", value1, value2, "lastUpdateTime");
			return (Criteria) this;
		}

		public Criteria andLastUpdateTimeNotBetween(Date value1, Date value2) {
			addCriterion("last_update_time not between", value1, value2, "lastUpdateTime");
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