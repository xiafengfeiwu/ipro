package com.pro.entity;

import java.util.Date;

public class Sms {
    private Long smsId;

    private String smsPhoneNo;

    private String smsMessage;

    private Date smsSendTime;

    public Long getSmsId() {
        return smsId;
    }

    public void setSmsId(Long smsId) {
        this.smsId = smsId;
    }

    public String getSmsPhoneNo() {
        return smsPhoneNo;
    }

    public void setSmsPhoneNo(String smsPhoneNo) {
        this.smsPhoneNo = smsPhoneNo;
    }

    public String getSmsMessage() {
        return smsMessage;
    }

    public void setSmsMessage(String smsMessage) {
        this.smsMessage = smsMessage;
    }

    public Date getSmsSendTime() {
        return smsSendTime;
    }

    public void setSmsSendTime(Date smsSendTime) {
        this.smsSendTime = smsSendTime;
    }
}