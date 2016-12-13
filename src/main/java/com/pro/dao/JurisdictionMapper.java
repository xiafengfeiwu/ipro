package com.pro.dao;

import com.pro.entity.Jurisdiction;
import com.pro.entity.JurisdictionExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface JurisdictionMapper {
    long countByExample(JurisdictionExample example);

    int deleteByExample(JurisdictionExample example);

    int deleteByPrimaryKey(Long jurisdictionId);

    int insert(Jurisdiction record);

    int insertSelective(Jurisdiction record);

    List<Jurisdiction> selectByExample(JurisdictionExample example);

    Jurisdiction selectByPrimaryKey(Long jurisdictionId);

    int updateByExampleSelective(@Param("record") Jurisdiction record, @Param("example") JurisdictionExample example);

    int updateByExample(@Param("record") Jurisdiction record, @Param("example") JurisdictionExample example);

    int updateByPrimaryKeySelective(Jurisdiction record);

    int updateByPrimaryKey(Jurisdiction record);
}