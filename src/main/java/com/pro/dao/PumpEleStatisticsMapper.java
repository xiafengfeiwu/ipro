package com.pro.dao;

import com.pro.entity.PumpEleStatistics;
import com.pro.entity.PumpEleStatisticsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PumpEleStatisticsMapper {
    long countByExample(PumpEleStatisticsExample example);

    int deleteByExample(PumpEleStatisticsExample example);

    int deleteByPrimaryKey(Long dataId);

    int insert(PumpEleStatistics record);

    int insertSelective(PumpEleStatistics record);

    List<PumpEleStatistics> selectByExample(PumpEleStatisticsExample example);

    PumpEleStatistics selectByPrimaryKey(Long dataId);

    int updateByExampleSelective(@Param("record") PumpEleStatistics record, @Param("example") PumpEleStatisticsExample example);

    int updateByExample(@Param("record") PumpEleStatistics record, @Param("example") PumpEleStatisticsExample example);

    int updateByPrimaryKeySelective(PumpEleStatistics record);

    int updateByPrimaryKey(PumpEleStatistics record);
}