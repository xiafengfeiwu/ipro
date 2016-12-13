package com.pro.entity;

public class Terminal {
    private Long terminalId;

    private String terminalName;

    private String terminalAddress;

    private Long terminalOwnerId;

    private String terminalLongitude;

    private String terminalLatitude;

    public Long getTerminalId() {
        return terminalId;
    }

    public void setTerminalId(Long terminalId) {
        this.terminalId = terminalId;
    }

    public String getTerminalName() {
        return terminalName;
    }

    public void setTerminalName(String terminalName) {
        this.terminalName = terminalName;
    }

    public String getTerminalAddress() {
        return terminalAddress;
    }

    public void setTerminalAddress(String terminalAddress) {
        this.terminalAddress = terminalAddress;
    }

    public Long getTerminalOwnerId() {
        return terminalOwnerId;
    }

    public void setTerminalOwnerId(Long terminalOwnerId) {
        this.terminalOwnerId = terminalOwnerId;
    }

    public String getTerminalLongitude() {
        return terminalLongitude;
    }

    public void setTerminalLongitude(String terminalLongitude) {
        this.terminalLongitude = terminalLongitude;
    }

    public String getTerminalLatitude() {
        return terminalLatitude;
    }

    public void setTerminalLatitude(String terminalLatitude) {
        this.terminalLatitude = terminalLatitude;
    }
}