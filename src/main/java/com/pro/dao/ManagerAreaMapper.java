package com.pro.dao;

import com.pro.entity.ManagerArea;
import com.pro.entity.ManagerAreaExample;
import com.pro.entity.ManagerAreaKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ManagerAreaMapper {
    long countByExample(ManagerAreaExample example);

    int deleteByExample(ManagerAreaExample example);

    int deleteByPrimaryKey(ManagerAreaKey key);

    int insert(ManagerArea record);

    int insertSelective(ManagerArea record);

    List<ManagerArea> selectByExample(ManagerAreaExample example);

    ManagerArea selectByPrimaryKey(ManagerAreaKey key);

    int updateByExampleSelective(@Param("record") ManagerArea record, @Param("example") ManagerAreaExample example);

    int updateByExample(@Param("record") ManagerArea record, @Param("example") ManagerAreaExample example);

    int updateByPrimaryKeySelective(ManagerArea record);

    int updateByPrimaryKey(ManagerArea record);
}