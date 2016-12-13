package com.pro.dao;

import com.pro.entity.JurisdictionGroup;
import com.pro.entity.JurisdictionGroupExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JurisdictionGroupMapper {
    long countByExample(JurisdictionGroupExample example);

    int deleteByExample(JurisdictionGroupExample example);

    int deleteByPrimaryKey(Long groupId);

    int insert(JurisdictionGroup record);

    int insertSelective(JurisdictionGroup record);

    List<JurisdictionGroup> selectByExample(JurisdictionGroupExample example);

    JurisdictionGroup selectByPrimaryKey(Long groupId);

    int updateByExampleSelective(@Param("record") JurisdictionGroup record, @Param("example") JurisdictionGroupExample example);

    int updateByExample(@Param("record") JurisdictionGroup record, @Param("example") JurisdictionGroupExample example);

    int updateByPrimaryKeySelective(JurisdictionGroup record);

    int updateByPrimaryKey(JurisdictionGroup record);
}