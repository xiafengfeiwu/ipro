package com.pro.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.pro.model.Page;

public class UserExample {
	protected String orderByClause;

	protected Page page;

	protected boolean distinct;

	protected List<Criteria> oredCriteria;

	public UserExample() {
		oredCriteria = new ArrayList<Criteria>();
	}

	public Page getPage() {
		return page;
	}

	public void setPage(Page page) {
		this.page = page;
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

		public Criteria andUserLoginNameIsNull() {
			addCriterion("user_login_name is null");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameIsNotNull() {
			addCriterion("user_login_name is not null");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameEqualTo(String value) {
			addCriterion("user_login_name =", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameNotEqualTo(String value) {
			addCriterion("user_login_name <>", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameGreaterThan(String value) {
			addCriterion("user_login_name >", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameGreaterThanOrEqualTo(String value) {
			addCriterion("user_login_name >=", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameLessThan(String value) {
			addCriterion("user_login_name <", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameLessThanOrEqualTo(String value) {
			addCriterion("user_login_name <=", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameLike(String value) {
			addCriterion("user_login_name like", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameNotLike(String value) {
			addCriterion("user_login_name not like", value, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameIn(List<String> values) {
			addCriterion("user_login_name in", values, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameNotIn(List<String> values) {
			addCriterion("user_login_name not in", values, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameBetween(String value1, String value2) {
			addCriterion("user_login_name between", value1, value2, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserLoginNameNotBetween(String value1, String value2) {
			addCriterion("user_login_name not between", value1, value2, "userLoginName");
			return (Criteria) this;
		}

		public Criteria andUserNameIsNull() {
			addCriterion("user_name is null");
			return (Criteria) this;
		}

		public Criteria andUserNameIsNotNull() {
			addCriterion("user_name is not null");
			return (Criteria) this;
		}

		public Criteria andUserNameEqualTo(String value) {
			addCriterion("user_name =", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameNotEqualTo(String value) {
			addCriterion("user_name <>", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameGreaterThan(String value) {
			addCriterion("user_name >", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameGreaterThanOrEqualTo(String value) {
			addCriterion("user_name >=", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameLessThan(String value) {
			addCriterion("user_name <", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameLessThanOrEqualTo(String value) {
			addCriterion("user_name <=", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameLike(String value) {
			addCriterion("user_name like", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameNotLike(String value) {
			addCriterion("user_name not like", value, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameIn(List<String> values) {
			addCriterion("user_name in", values, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameNotIn(List<String> values) {
			addCriterion("user_name not in", values, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameBetween(String value1, String value2) {
			addCriterion("user_name between", value1, value2, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNameNotBetween(String value1, String value2) {
			addCriterion("user_name not between", value1, value2, "userName");
			return (Criteria) this;
		}

		public Criteria andUserNamePyIsNull() {
			addCriterion("user_name_py is null");
			return (Criteria) this;
		}

		public Criteria andUserNamePyIsNotNull() {
			addCriterion("user_name_py is not null");
			return (Criteria) this;
		}

		public Criteria andUserNamePyEqualTo(String value) {
			addCriterion("user_name_py =", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyNotEqualTo(String value) {
			addCriterion("user_name_py <>", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyGreaterThan(String value) {
			addCriterion("user_name_py >", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyGreaterThanOrEqualTo(String value) {
			addCriterion("user_name_py >=", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyLessThan(String value) {
			addCriterion("user_name_py <", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyLessThanOrEqualTo(String value) {
			addCriterion("user_name_py <=", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyLike(String value) {
			addCriterion("user_name_py like", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyNotLike(String value) {
			addCriterion("user_name_py not like", value, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyIn(List<String> values) {
			addCriterion("user_name_py in", values, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyNotIn(List<String> values) {
			addCriterion("user_name_py not in", values, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyBetween(String value1, String value2) {
			addCriterion("user_name_py between", value1, value2, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserNamePyNotBetween(String value1, String value2) {
			addCriterion("user_name_py not between", value1, value2, "userNamePy");
			return (Criteria) this;
		}

		public Criteria andUserPhoneIsNull() {
			addCriterion("user_phone is null");
			return (Criteria) this;
		}

		public Criteria andUserPhoneIsNotNull() {
			addCriterion("user_phone is not null");
			return (Criteria) this;
		}

		public Criteria andUserPhoneEqualTo(String value) {
			addCriterion("user_phone =", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneNotEqualTo(String value) {
			addCriterion("user_phone <>", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneGreaterThan(String value) {
			addCriterion("user_phone >", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneGreaterThanOrEqualTo(String value) {
			addCriterion("user_phone >=", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneLessThan(String value) {
			addCriterion("user_phone <", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneLessThanOrEqualTo(String value) {
			addCriterion("user_phone <=", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneLike(String value) {
			addCriterion("user_phone like", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneNotLike(String value) {
			addCriterion("user_phone not like", value, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneIn(List<String> values) {
			addCriterion("user_phone in", values, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneNotIn(List<String> values) {
			addCriterion("user_phone not in", values, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneBetween(String value1, String value2) {
			addCriterion("user_phone between", value1, value2, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPhoneNotBetween(String value1, String value2) {
			addCriterion("user_phone not between", value1, value2, "userPhone");
			return (Criteria) this;
		}

		public Criteria andUserPasswordIsNull() {
			addCriterion("user_password is null");
			return (Criteria) this;
		}

		public Criteria andUserPasswordIsNotNull() {
			addCriterion("user_password is not null");
			return (Criteria) this;
		}

		public Criteria andUserPasswordEqualTo(String value) {
			addCriterion("user_password =", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordNotEqualTo(String value) {
			addCriterion("user_password <>", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordGreaterThan(String value) {
			addCriterion("user_password >", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordGreaterThanOrEqualTo(String value) {
			addCriterion("user_password >=", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordLessThan(String value) {
			addCriterion("user_password <", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordLessThanOrEqualTo(String value) {
			addCriterion("user_password <=", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordLike(String value) {
			addCriterion("user_password like", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordNotLike(String value) {
			addCriterion("user_password not like", value, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordIn(List<String> values) {
			addCriterion("user_password in", values, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordNotIn(List<String> values) {
			addCriterion("user_password not in", values, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordBetween(String value1, String value2) {
			addCriterion("user_password between", value1, value2, "userPassword");
			return (Criteria) this;
		}

		public Criteria andUserPasswordNotBetween(String value1, String value2) {
			addCriterion("user_password not between", value1, value2, "userPassword");
			return (Criteria) this;
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

		public Criteria andUserPortraitPathIsNull() {
			addCriterion("user_portrait_path is null");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathIsNotNull() {
			addCriterion("user_portrait_path is not null");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathEqualTo(String value) {
			addCriterion("user_portrait_path =", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathNotEqualTo(String value) {
			addCriterion("user_portrait_path <>", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathGreaterThan(String value) {
			addCriterion("user_portrait_path >", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathGreaterThanOrEqualTo(String value) {
			addCriterion("user_portrait_path >=", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathLessThan(String value) {
			addCriterion("user_portrait_path <", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathLessThanOrEqualTo(String value) {
			addCriterion("user_portrait_path <=", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathLike(String value) {
			addCriterion("user_portrait_path like", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathNotLike(String value) {
			addCriterion("user_portrait_path not like", value, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathIn(List<String> values) {
			addCriterion("user_portrait_path in", values, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathNotIn(List<String> values) {
			addCriterion("user_portrait_path not in", values, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathBetween(String value1, String value2) {
			addCriterion("user_portrait_path between", value1, value2, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserPortraitPathNotBetween(String value1, String value2) {
			addCriterion("user_portrait_path not between", value1, value2, "userPortraitPath");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdIsNull() {
			addCriterion("user_wx_open_id is null");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdIsNotNull() {
			addCriterion("user_wx_open_id is not null");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdEqualTo(String value) {
			addCriterion("user_wx_open_id =", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdNotEqualTo(String value) {
			addCriterion("user_wx_open_id <>", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdGreaterThan(String value) {
			addCriterion("user_wx_open_id >", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdGreaterThanOrEqualTo(String value) {
			addCriterion("user_wx_open_id >=", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdLessThan(String value) {
			addCriterion("user_wx_open_id <", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdLessThanOrEqualTo(String value) {
			addCriterion("user_wx_open_id <=", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdLike(String value) {
			addCriterion("user_wx_open_id like", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdNotLike(String value) {
			addCriterion("user_wx_open_id not like", value, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdIn(List<String> values) {
			addCriterion("user_wx_open_id in", values, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdNotIn(List<String> values) {
			addCriterion("user_wx_open_id not in", values, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdBetween(String value1, String value2) {
			addCriterion("user_wx_open_id between", value1, value2, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserWxOpenIdNotBetween(String value1, String value2) {
			addCriterion("user_wx_open_id not between", value1, value2, "userWxOpenId");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusIsNull() {
			addCriterion("user_disable_status is null");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusIsNotNull() {
			addCriterion("user_disable_status is not null");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusEqualTo(Boolean value) {
			addCriterion("user_disable_status =", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusNotEqualTo(Boolean value) {
			addCriterion("user_disable_status <>", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusGreaterThan(Boolean value) {
			addCriterion("user_disable_status >", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusGreaterThanOrEqualTo(Boolean value) {
			addCriterion("user_disable_status >=", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusLessThan(Boolean value) {
			addCriterion("user_disable_status <", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusLessThanOrEqualTo(Boolean value) {
			addCriterion("user_disable_status <=", value, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusIn(List<Boolean> values) {
			addCriterion("user_disable_status in", values, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusNotIn(List<Boolean> values) {
			addCriterion("user_disable_status not in", values, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusBetween(Boolean value1, Boolean value2) {
			addCriterion("user_disable_status between", value1, value2, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserDisableStatusNotBetween(Boolean value1, Boolean value2) {
			addCriterion("user_disable_status not between", value1, value2, "userDisableStatus");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeIsNull() {
			addCriterion("user_regist_time is null");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeIsNotNull() {
			addCriterion("user_regist_time is not null");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeEqualTo(Date value) {
			addCriterion("user_regist_time =", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeNotEqualTo(Date value) {
			addCriterion("user_regist_time <>", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeGreaterThan(Date value) {
			addCriterion("user_regist_time >", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("user_regist_time >=", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeLessThan(Date value) {
			addCriterion("user_regist_time <", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeLessThanOrEqualTo(Date value) {
			addCriterion("user_regist_time <=", value, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeIn(List<Date> values) {
			addCriterion("user_regist_time in", values, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeNotIn(List<Date> values) {
			addCriterion("user_regist_time not in", values, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeBetween(Date value1, Date value2) {
			addCriterion("user_regist_time between", value1, value2, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserRegistTimeNotBetween(Date value1, Date value2) {
			addCriterion("user_regist_time not between", value1, value2, "userRegistTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeIsNull() {
			addCriterion("user_modify_time is null");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeIsNotNull() {
			addCriterion("user_modify_time is not null");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeEqualTo(Date value) {
			addCriterion("user_modify_time =", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeNotEqualTo(Date value) {
			addCriterion("user_modify_time <>", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeGreaterThan(Date value) {
			addCriterion("user_modify_time >", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeGreaterThanOrEqualTo(Date value) {
			addCriterion("user_modify_time >=", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeLessThan(Date value) {
			addCriterion("user_modify_time <", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeLessThanOrEqualTo(Date value) {
			addCriterion("user_modify_time <=", value, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeIn(List<Date> values) {
			addCriterion("user_modify_time in", values, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeNotIn(List<Date> values) {
			addCriterion("user_modify_time not in", values, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeBetween(Date value1, Date value2) {
			addCriterion("user_modify_time between", value1, value2, "userModifyTime");
			return (Criteria) this;
		}

		public Criteria andUserModifyTimeNotBetween(Date value1, Date value2) {
			addCriterion("user_modify_time not between", value1, value2, "userModifyTime");
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