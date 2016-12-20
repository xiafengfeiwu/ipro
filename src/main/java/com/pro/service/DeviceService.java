package com.pro.service;

import java.util.List;

import com.pro.entity.Device;
import com.pro.entity.DeviceVender;

public interface DeviceService {

	// 通过ID获取设备信息
	Device findById(Long deviceId);

	// 通过SN获取设备信息
	Device findBySn(String sn);

	// 保存设备
	void save(Device device);

	// 更新设备
	void update(Device device);

	// 通过查询条件关键字获取设备数量
	Long getDeviceCount(String searchWord);

	// 分页获取设备数据
	List<Device> getDeviceData(String searchWord, String field, String order, int page, int length);

	// 分页获取设备数据
	List<Device> getTop5BySearchWord(String searchWord);

	// 删除设备
	void delete(Long deviceId);

	// 通过供应商ID获取供应商
	DeviceVender findVenderById(Long venderId);

	// 通过供应商CODE获取供应商
	DeviceVender findVenderByCode(String venderCode);

	// 创建设备供应商
	void createVender(DeviceVender vender);

	// 获取所有的设备供应商
	List<DeviceVender> findAllVenders();

	// 删除设备供应商
	void deleteVender(Long venderId);

	// 更新设备供应商
	void updateVender(DeviceVender vender);

}
