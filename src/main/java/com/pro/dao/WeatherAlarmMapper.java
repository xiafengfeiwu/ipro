package com.pro.dao;

import com.pro.entity.WeatherAlarm;
import com.pro.entity.WeatherAlarmExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeatherAlarmMapper {
    long countByExample(WeatherAlarmExample example);

    int deleteByExample(WeatherAlarmExample example);

    int deleteByPrimaryKey(String weatherCityCode);

    int insert(WeatherAlarm record);

    int insertSelective(WeatherAlarm record);

    List<WeatherAlarm> selectByExample(WeatherAlarmExample example);

    WeatherAlarm selectByPrimaryKey(String weatherCityCode);

    int updateByExampleSelective(@Param("record") WeatherAlarm record, @Param("example") WeatherAlarmExample example);

    int updateByExample(@Param("record") WeatherAlarm record, @Param("example") WeatherAlarmExample example);

    int updateByPrimaryKeySelective(WeatherAlarm record);

    int updateByPrimaryKey(WeatherAlarm record);
}