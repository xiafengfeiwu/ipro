package com.pro.entity;

import java.util.Date;

public class WarnGroup {
    private Long groupId;

    private String groupName;

    private String groupDescript;

    private Long creatorId;

    private Date createTime;

    public Long getGroupId() {
        return groupId;
    }

    public void setGroupId(Long groupId) {
        this.groupId = groupId;
    }

    public String getGroupName() {
        return groupName;
    }

    public void setGroupName(String groupName) {
        this.groupName = groupName;
    }

    public String getGroupDescript() {
        return groupDescript;
    }

    public void setGroupDescript(String groupDescript) {
        this.groupDescript = groupDescript;
    }

    public Long getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(Long creatorId) {
        this.creatorId = creatorId;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
}