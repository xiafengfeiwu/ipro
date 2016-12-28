package com.pro.service;

import java.util.List;

import com.pro.entity.WarnGroup;
import com.pro.entity.WarnGroupItem;
import com.pro.entity.WarnMonitorItem;

public interface WarnConfigService {

	// 通过ID获得告警组
	WarnGroup findWarnGroupById(Long warnGroupId);

	// 通过ID获得告警项
	WarnGroupItem findWarnItemById(Long warnItemId);

	// 通过Code获得告警项
	WarnGroupItem findWarnItemByCode(String warnCode);

	// 获取所有告警组
	List<WarnGroup> findAllWarnGroup();

	// 获取告警组所有告警项
	List<WarnGroupItem> findAllWarnItem(Long warnGroupId);

	// 获取所有监控项
	List<WarnMonitorItem> findAllWarnMonitorItem();

	// 创建告警组
	void createWarnGroup(WarnGroup warnGroup);

	// 创建告警项
	void createWarnItem(WarnGroupItem warnGroupItem);

	// 更新告警组
	void updateWarnGroup(WarnGroup warnGroup);

	// 更新告警项
	void updateWarnItem(WarnGroupItem warnGroupItem);

	// 删除告警组
	void deleteWarnGroup(Long warnGroupId);

	// 删除告警项
	void deleteWarnItem(Long warnItemId);

}
