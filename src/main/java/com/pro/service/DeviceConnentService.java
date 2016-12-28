package com.pro.service;

import java.util.List;

import com.pro.entity.DeviceConnect;

public interface DeviceConnentService {

	// 创建保存连接
	void createConnect(DeviceConnect connect);

	// 更新连接
	void updateConnent(DeviceConnect connect);

	// 关闭连接
	void closeConnent(DeviceConnect connect);

	// 通过IP和端口获取连接
	DeviceConnect findOnlineConnectByIpWithPort(String ip, int port);

	// 获取所有在线连接
	List<DeviceConnect> findAllOnlineConnect();
}
