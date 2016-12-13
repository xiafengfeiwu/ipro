package com.pro.dao;

import com.pro.entity.WarnHandle;
import com.pro.entity.WarnHandleExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnHandleMapper {
    long countByExample(WarnHandleExample example);

    int deleteByExample(WarnHandleExample example);

    int deleteByPrimaryKey(Long warnHandleId);

    int insert(WarnHandle record);

    int insertSelective(WarnHandle record);

    List<WarnHandle> selectByExample(WarnHandleExample example);

    WarnHandle selectByPrimaryKey(Long warnHandleId);

    int updateByExampleSelective(@Param("record") WarnHandle record, @Param("example") WarnHandleExample example);

    int updateByExample(@Param("record") WarnHandle record, @Param("example") WarnHandleExample example);

    int updateByPrimaryKeySelective(WarnHandle record);

    int updateByPrimaryKey(WarnHandle record);
}