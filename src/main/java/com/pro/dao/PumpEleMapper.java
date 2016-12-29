package com.pro.dao;

import com.pro.entity.PumpEle;
import com.pro.entity.PumpEleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PumpEleMapper {
    long countByExample(PumpEleExample example);

    int deleteByExample(PumpEleExample example);

    int deleteByPrimaryKey(Long dataId);

    int insert(PumpEle record);

    int insertSelective(PumpEle record);

    List<PumpEle> selectByExample(PumpEleExample example);

    PumpEle selectByPrimaryKey(Long dataId);

    int updateByExampleSelective(@Param("record") PumpEle record, @Param("example") PumpEleExample example);

    int updateByExample(@Param("record") PumpEle record, @Param("example") PumpEleExample example);

    int updateByPrimaryKeySelective(PumpEle record);

    int updateByPrimaryKey(PumpEle record);
}