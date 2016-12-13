package com.pro.dao;

import com.pro.entity.RoleJurisdictionExample;
import com.pro.entity.RoleJurisdictionKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleJurisdictionMapper {
    long countByExample(RoleJurisdictionExample example);

    int deleteByExample(RoleJurisdictionExample example);

    int deleteByPrimaryKey(RoleJurisdictionKey key);

    int insert(RoleJurisdictionKey record);

    int insertSelective(RoleJurisdictionKey record);

    List<RoleJurisdictionKey> selectByExample(RoleJurisdictionExample example);

    int updateByExampleSelective(@Param("record") RoleJurisdictionKey record, @Param("example") RoleJurisdictionExample example);

    int updateByExample(@Param("record") RoleJurisdictionKey record, @Param("example") RoleJurisdictionExample example);
}