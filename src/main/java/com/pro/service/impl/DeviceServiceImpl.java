package com.pro.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pro.dao.DeviceMapper;
import com.pro.dao.DeviceVenderMapper;
import com.pro.entity.Device;
import com.pro.entity.DeviceExample;
import com.pro.entity.DeviceVender;
import com.pro.entity.DeviceVenderExample;
import com.pro.model.Page;
import com.pro.service.DeviceService;
import com.pro.util.PublicUtil;

@Service
public class DeviceServiceImpl implements DeviceService {

	@Autowired
	DeviceMapper deviceMapper;
	@Autowired
	DeviceVenderMapper deviceVenderMapper;

	@Override
	public Device findById(Long deviceId) {
		return deviceMapper.selectByPrimaryKey(deviceId);
	}

	@Override
	public Device findBySn(String sn) {
		DeviceExample example = new DeviceExample();
		example.createCriteria().andDeviceSnEqualTo(sn);
		List<Device> devices = deviceMapper.selectByExample(example);
		if (PublicUtil.isEmpty(devices)) {
			return null;
		}
		return devices.get(0);
	}

	@Override
	public void save(Device device) {
		deviceMapper.insert(device);
	}

	@Override
	public void update(Device device) {
		deviceMapper.updateByPrimaryKey(device);
	}

	@Override
	public Long getDeviceCount(String searchWord) {
		DeviceExample example = new DeviceExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andDeviceSnLike(searchWord);
			example.or().andDeviceNameLike(searchWord);
			example.or().andDeviceVenderCodeLike(searchWord);
			example.or().andDeviceTypeLike(searchWord);
		}
		return deviceMapper.countByExample(example);
	}

	@Override
	public List<Device> getDeviceData(String searchWord, String field, String order, int page, int length) {
		DeviceExample example = new DeviceExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andDeviceSnLike(searchWord);
			example.or().andDeviceNameLike(searchWord);
			example.or().andDeviceVenderCodeLike(searchWord);
			example.or().andDeviceTypeLike(searchWord);
		}
		if (PublicUtil.isNotEmpty(field) && PublicUtil.isNotEmpty(order)) {
			example.setOrderByClause(field + " " + order);
		}
		example.setPage(new Page(page, length));
		return deviceMapper.selectByExample(example);
	}

	@Override
	public List<Device> getTop5BySearchWord(String searchWord) {
		DeviceExample example = new DeviceExample();
		if (PublicUtil.isNotEmpty(searchWord)) {
			searchWord = "%" + searchWord + "%";
			example.or().andDeviceSnLike(searchWord);
			example.or().andDeviceNameLike(searchWord);
			example.or().andDeviceVenderCodeLike(searchWord);
			example.or().andDeviceTypeLike(searchWord);
		}
		example.setOrderByClause("device_sn asc");
		example.setPage(new Page(1, 5));
		return deviceMapper.selectByExample(example);
	}

	@Override
	public void delete(Long deviceId) {
		deviceMapper.deleteByPrimaryKey(deviceId);
	}

	@Override
	public void createVender(DeviceVender vender) {
		deviceVenderMapper.insert(vender);
	}

	@Override
	public DeviceVender findVenderById(Long venderId) {
		return deviceVenderMapper.selectByPrimaryKey(venderId);
	}

	@Override
	public DeviceVender findVenderByCode(String venderCode) {
		DeviceVenderExample example = new DeviceVenderExample();
		example.createCriteria().andVenderCodeEqualTo(venderCode);
		List<DeviceVender> venders = deviceVenderMapper.selectByExample(example);
		if (PublicUtil.isEmpty(venders)) {
			return null;
		}
		return venders.get(0);
	}

	@Override
	public List<DeviceVender> findAllVenders() {
		DeviceVenderExample example = new DeviceVenderExample();
		example.setOrderByClause("vender_name asc");
		return deviceVenderMapper.selectByExample(example);
	}

	@Override
	public void deleteVender(Long venderId) {
		deviceVenderMapper.deleteByPrimaryKey(venderId);
	}

	@Override
	public void updateVender(DeviceVender vender) {
		deviceVenderMapper.updateByPrimaryKey(vender);
	}

}
