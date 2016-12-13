package com.pro.dao;

import com.pro.entity.WeatherData;
import com.pro.entity.WeatherDataExample;
import com.pro.entity.WeatherDataKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WeatherDataMapper {
    long countByExample(WeatherDataExample example);

    int deleteByExample(WeatherDataExample example);

    int deleteByPrimaryKey(WeatherDataKey key);

    int insert(WeatherData record);

    int insertSelective(WeatherData record);

    List<WeatherData> selectByExample(WeatherDataExample example);

    WeatherData selectByPrimaryKey(WeatherDataKey key);

    int updateByExampleSelective(@Param("record") WeatherData record, @Param("example") WeatherDataExample example);

    int updateByExample(@Param("record") WeatherData record, @Param("example") WeatherDataExample example);

    int updateByPrimaryKeySelective(WeatherData record);

    int updateByPrimaryKey(WeatherData record);
}