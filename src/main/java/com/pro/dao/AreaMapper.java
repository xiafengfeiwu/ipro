package com.pro.dao;

import com.pro.entity.Area;
import com.pro.entity.AreaExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface AreaMapper {
    long countByExample(AreaExample example);

    int deleteByExample(AreaExample example);

    int deleteByPrimaryKey(String areaCode);

    int insert(Area record);

    int insertSelective(Area record);

    List<Area> selectByExample(AreaExample example);

    Area selectByPrimaryKey(String areaCode);

    int updateByExampleSelective(@Param("record") Area record, @Param("example") AreaExample example);

    int updateByExample(@Param("record") Area record, @Param("example") AreaExample example);

    int updateByPrimaryKeySelective(Area record);

    int updateByPrimaryKey(Area record);
}