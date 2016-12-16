package com.pro.dao;

import com.pro.entity.WarnMonitorItem;
import com.pro.entity.WarnMonitorItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnMonitorItemMapper {
    long countByExample(WarnMonitorItemExample example);

    int deleteByExample(WarnMonitorItemExample example);

    int deleteByPrimaryKey(String itemName);

    int insert(WarnMonitorItem record);

    int insertSelective(WarnMonitorItem record);

    List<WarnMonitorItem> selectByExample(WarnMonitorItemExample example);

    WarnMonitorItem selectByPrimaryKey(String itemName);

    int updateByExampleSelective(@Param("record") WarnMonitorItem record, @Param("example") WarnMonitorItemExample example);

    int updateByExample(@Param("record") WarnMonitorItem record, @Param("example") WarnMonitorItemExample example);

    int updateByPrimaryKeySelective(WarnMonitorItem record);

    int updateByPrimaryKey(WarnMonitorItem record);
}