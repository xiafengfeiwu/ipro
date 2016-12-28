package com.pro.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.DeviceConnectMapper;
import com.pro.entity.DeviceConnect;
import com.pro.entity.DeviceConnectExample;
import com.pro.service.DeviceConnentService;

@Service
public class DeviceConnentServiceImpl implements DeviceConnentService {

	@Autowired
	DeviceConnectMapper deviceConnectMapper;

	@Override
	public void createConnect(DeviceConnect connect) {
		deviceConnectMapper.insert(connect);
	}

	@Override
	public void updateConnent(DeviceConnect connect) {
		deviceConnectMapper.updateByPrimaryKey(connect);
	}

	@Override
	public void closeConnent(DeviceConnect connect) {
		connect.setCloseTime(new Date());
		updateConnent(connect);
	}

	@Override
	public DeviceConnect findOnlineConnectByIpWithPort(String ip, int port) {
		DeviceConnectExample example = new DeviceConnectExample();
		example.createCriteria().andCloseTimeIsNull().andConnectIpEqualTo(ip).andConnectPortEqualTo(port).andLastModifyTimeGreaterThan(new Date(new Date().getTime() - 1000 * 60 * 20));
		List<DeviceConnect> connects = deviceConnectMapper.selectByExample(example);
		if (connects != null) {
			return connects.get(0);
		}
		return null;
	}

	@Override
	public List<DeviceConnect> findAllOnlineConnect() {
		DeviceConnectExample example = new DeviceConnectExample();
		example.createCriteria().andCloseTimeIsNull().andLastModifyTimeGreaterThan(new Date(new Date().getTime() - 1000 * 60 * 20));
		return deviceConnectMapper.selectByExample(example);
	}

}
