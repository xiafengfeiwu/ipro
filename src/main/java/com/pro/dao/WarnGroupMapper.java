package com.pro.dao;

import com.pro.entity.WarnGroup;
import com.pro.entity.WarnGroupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnGroupMapper {
    long countByExample(WarnGroupExample example);

    int deleteByExample(WarnGroupExample example);

    int deleteByPrimaryKey(Long groupId);

    int insert(WarnGroup record);

    int insertSelective(WarnGroup record);

    List<WarnGroup> selectByExample(WarnGroupExample example);

    WarnGroup selectByPrimaryKey(Long groupId);

    int updateByExampleSelective(@Param("record") WarnGroup record, @Param("example") WarnGroupExample example);

    int updateByExample(@Param("record") WarnGroup record, @Param("example") WarnGroupExample example);

    int updateByPrimaryKeySelective(WarnGroup record);

    int updateByPrimaryKey(WarnGroup record);
}