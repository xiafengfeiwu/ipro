package com.pro.dao;

import com.pro.entity.Res;
import com.pro.entity.ResExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ResMapper {
    long countByExample(ResExample example);

    int deleteByExample(ResExample example);

    int deleteByPrimaryKey(Long resId);

    int insert(Res record);

    int insertSelective(Res record);

    List<Res> selectByExample(ResExample example);

    Res selectByPrimaryKey(Long resId);

    int updateByExampleSelective(@Param("record") Res record, @Param("example") ResExample example);

    int updateByExample(@Param("record") Res record, @Param("example") ResExample example);

    int updateByPrimaryKeySelective(Res record);

    int updateByPrimaryKey(Res record);
}