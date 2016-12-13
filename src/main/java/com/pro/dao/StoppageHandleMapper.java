package com.pro.dao;

import com.pro.entity.StoppageHandle;
import com.pro.entity.StoppageHandleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StoppageHandleMapper {
    long countByExample(StoppageHandleExample example);

    int deleteByExample(StoppageHandleExample example);

    int deleteByPrimaryKey(Long stoppageHandleId);

    int insert(StoppageHandle record);

    int insertSelective(StoppageHandle record);

    List<StoppageHandle> selectByExample(StoppageHandleExample example);

    StoppageHandle selectByPrimaryKey(Long stoppageHandleId);

    int updateByExampleSelective(@Param("record") StoppageHandle record, @Param("example") StoppageHandleExample example);

    int updateByExample(@Param("record") StoppageHandle record, @Param("example") StoppageHandleExample example);

    int updateByPrimaryKeySelective(StoppageHandle record);

    int updateByPrimaryKey(StoppageHandle record);
}