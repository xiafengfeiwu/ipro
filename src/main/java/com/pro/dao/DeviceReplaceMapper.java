package com.pro.dao;

import com.pro.entity.DeviceReplace;
import com.pro.entity.DeviceReplaceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface DeviceReplaceMapper {
    long countByExample(DeviceReplaceExample example);

    int deleteByExample(DeviceReplaceExample example);

    int deleteByPrimaryKey(Long nodeId);

    int insert(DeviceReplace record);

    int insertSelective(DeviceReplace record);

    List<DeviceReplace> selectByExample(DeviceReplaceExample example);

    DeviceReplace selectByPrimaryKey(Long nodeId);

    int updateByExampleSelective(@Param("record") DeviceReplace record, @Param("example") DeviceReplaceExample example);

    int updateByExample(@Param("record") DeviceReplace record, @Param("example") DeviceReplaceExample example);

    int updateByPrimaryKeySelective(DeviceReplace record);

    int updateByPrimaryKey(DeviceReplace record);
}