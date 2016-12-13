package com.pro.dao;

import com.pro.entity.WeatherIcon;
import com.pro.entity.WeatherIconExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeatherIconMapper {
    long countByExample(WeatherIconExample example);

    int deleteByExample(WeatherIconExample example);

    int deleteByPrimaryKey(String code);

    int insert(WeatherIcon record);

    int insertSelective(WeatherIcon record);

    List<WeatherIcon> selectByExample(WeatherIconExample example);

    WeatherIcon selectByPrimaryKey(String code);

    int updateByExampleSelective(@Param("record") WeatherIcon record, @Param("example") WeatherIconExample example);

    int updateByExample(@Param("record") WeatherIcon record, @Param("example") WeatherIconExample example);

    int updateByPrimaryKeySelective(WeatherIcon record);

    int updateByPrimaryKey(WeatherIcon record);
}