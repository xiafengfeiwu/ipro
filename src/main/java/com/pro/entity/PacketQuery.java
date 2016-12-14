package com.pro.entity;

import java.util.Date;

public class PacketQuery {
    private Long packetId;

    private String packetType;

    private String packetData;

    private String packetStatus;

    private Date collectTime;

    public Long getPacketId() {
        return packetId;
    }

    public void setPacketId(Long packetId) {
        this.packetId = packetId;
    }

    public String getPacketType() {
        return packetType;
    }

    public void setPacketType(String packetType) {
        this.packetType = packetType;
    }

    public String getPacketData() {
        return packetData;
    }

    public void setPacketData(String packetData) {
        this.packetData = packetData;
    }

    public String getPacketStatus() {
        return packetStatus;
    }

    public void setPacketStatus(String packetStatus) {
        this.packetStatus = packetStatus;
    }

    public Date getCollectTime() {
        return collectTime;
    }

    public void setCollectTime(Date collectTime) {
        this.collectTime = collectTime;
    }
}