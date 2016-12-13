package com.pro.dao;

import com.pro.entity.WarnSetUp;
import com.pro.entity.WarnSetUpExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnSetUpMapper {
    long countByExample(WarnSetUpExample example);

    int deleteByExample(WarnSetUpExample example);

    int deleteByPrimaryKey(Long itemId);

    int insert(WarnSetUp record);

    int insertSelective(WarnSetUp record);

    List<WarnSetUp> selectByExample(WarnSetUpExample example);

    WarnSetUp selectByPrimaryKey(Long itemId);

    int updateByExampleSelective(@Param("record") WarnSetUp record, @Param("example") WarnSetUpExample example);

    int updateByExample(@Param("record") WarnSetUp record, @Param("example") WarnSetUpExample example);

    int updateByPrimaryKeySelective(WarnSetUp record);

    int updateByPrimaryKey(WarnSetUp record);
}