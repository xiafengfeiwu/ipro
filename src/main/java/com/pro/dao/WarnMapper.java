package com.pro.dao;

import com.pro.entity.Warn;
import com.pro.entity.WarnExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnMapper {
    long countByExample(WarnExample example);

    int deleteByExample(WarnExample example);

    int deleteByPrimaryKey(Long warnId);

    int insert(Warn record);

    int insertSelective(Warn record);

    List<Warn> selectByExample(WarnExample example);

    Warn selectByPrimaryKey(Long warnId);

    int updateByExampleSelective(@Param("record") Warn record, @Param("example") WarnExample example);

    int updateByExample(@Param("record") Warn record, @Param("example") WarnExample example);

    int updateByPrimaryKeySelective(Warn record);

    int updateByPrimaryKey(Warn record);
}