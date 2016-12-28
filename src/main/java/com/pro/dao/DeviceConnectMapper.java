package com.pro.dao;

import com.pro.entity.DeviceConnect;
import com.pro.entity.DeviceConnectExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeviceConnectMapper {
    long countByExample(DeviceConnectExample example);

    int deleteByExample(DeviceConnectExample example);

    int deleteByPrimaryKey(Long connectId);

    int insert(DeviceConnect record);

    int insertSelective(DeviceConnect record);

    List<DeviceConnect> selectByExample(DeviceConnectExample example);

    DeviceConnect selectByPrimaryKey(Long connectId);

    int updateByExampleSelective(@Param("record") DeviceConnect record, @Param("example") DeviceConnectExample example);

    int updateByExample(@Param("record") DeviceConnect record, @Param("example") DeviceConnectExample example);

    int updateByPrimaryKeySelective(DeviceConnect record);

    int updateByPrimaryKey(DeviceConnect record);
}