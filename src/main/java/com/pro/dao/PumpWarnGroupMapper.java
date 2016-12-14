package com.pro.dao;

import com.pro.entity.PumpWarnGroup;
import com.pro.entity.PumpWarnGroupExample;
import com.pro.entity.PumpWarnGroupKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PumpWarnGroupMapper {
    long countByExample(PumpWarnGroupExample example);

    int deleteByExample(PumpWarnGroupExample example);

    int deleteByPrimaryKey(PumpWarnGroupKey key);

    int insert(PumpWarnGroup record);

    int insertSelective(PumpWarnGroup record);

    List<PumpWarnGroup> selectByExample(PumpWarnGroupExample example);

    PumpWarnGroup selectByPrimaryKey(PumpWarnGroupKey key);

    int updateByExampleSelective(@Param("record") PumpWarnGroup record, @Param("example") PumpWarnGroupExample example);

    int updateByExample(@Param("record") PumpWarnGroup record, @Param("example") PumpWarnGroupExample example);

    int updateByPrimaryKeySelective(PumpWarnGroup record);

    int updateByPrimaryKey(PumpWarnGroup record);
}