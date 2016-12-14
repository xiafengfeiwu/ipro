package com.pro.entity;

import java.util.Date;

public class User {
    private Long userId;

    private String userLoginName;

    private String userName;

    private String userNamePy;

    private String userPhone;

    private String userPassword;

    private Long roleId;

    private String userPortraitPath;

    private String userWxOpenId;

    private Boolean userDisableStatus;

    private Date userRegistTime;

    private Date userModifyTime;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getUserLoginName() {
        return userLoginName;
    }

    public void setUserLoginName(String userLoginName) {
        this.userLoginName = userLoginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getUserNamePy() {
        return userNamePy;
    }

    public void setUserNamePy(String userNamePy) {
        this.userNamePy = userNamePy;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getUserPassword() {
        return userPassword;
    }

    public void setUserPassword(String userPassword) {
        this.userPassword = userPassword;
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public String getUserPortraitPath() {
        return userPortraitPath;
    }

    public void setUserPortraitPath(String userPortraitPath) {
        this.userPortraitPath = userPortraitPath;
    }

    public String getUserWxOpenId() {
        return userWxOpenId;
    }

    public void setUserWxOpenId(String userWxOpenId) {
        this.userWxOpenId = userWxOpenId;
    }

    public Boolean getUserDisableStatus() {
        return userDisableStatus;
    }

    public void setUserDisableStatus(Boolean userDisableStatus) {
        this.userDisableStatus = userDisableStatus;
    }

    public Date getUserRegistTime() {
        return userRegistTime;
    }

    public void setUserRegistTime(Date userRegistTime) {
        this.userRegistTime = userRegistTime;
    }

    public Date getUserModifyTime() {
        return userModifyTime;
    }

    public void setUserModifyTime(Date userModifyTime) {
        this.userModifyTime = userModifyTime;
    }
}