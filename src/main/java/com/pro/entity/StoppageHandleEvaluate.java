package com.pro.entity;

import java.util.Date;

public class StoppageHandleEvaluate {
    private Long evaluateId;

    private Long stoppageHandleId;

    private Long evaluateUserId;

    private Date evaluateTime;

    private String evaluateLevel;

    private String evaluateDescript;

    public Long getEvaluateId() {
        return evaluateId;
    }

    public void setEvaluateId(Long evaluateId) {
        this.evaluateId = evaluateId;
    }

    public Long getStoppageHandleId() {
        return stoppageHandleId;
    }

    public void setStoppageHandleId(Long stoppageHandleId) {
        this.stoppageHandleId = stoppageHandleId;
    }

    public Long getEvaluateUserId() {
        return evaluateUserId;
    }

    public void setEvaluateUserId(Long evaluateUserId) {
        this.evaluateUserId = evaluateUserId;
    }

    public Date getEvaluateTime() {
        return evaluateTime;
    }

    public void setEvaluateTime(Date evaluateTime) {
        this.evaluateTime = evaluateTime;
    }

    public String getEvaluateLevel() {
        return evaluateLevel;
    }

    public void setEvaluateLevel(String evaluateLevel) {
        this.evaluateLevel = evaluateLevel;
    }

    public String getEvaluateDescript() {
        return evaluateDescript;
    }

    public void setEvaluateDescript(String evaluateDescript) {
        this.evaluateDescript = evaluateDescript;
    }
}