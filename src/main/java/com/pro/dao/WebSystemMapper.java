package com.pro.dao;

import com.pro.entity.WebSystem;
import com.pro.entity.WebSystemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WebSystemMapper {
    long countByExample(WebSystemExample example);

    int deleteByExample(WebSystemExample example);

    int insert(WebSystem record);

    int insertSelective(WebSystem record);

    List<WebSystem> selectByExample(WebSystemExample example);

    int updateByExampleSelective(@Param("record") WebSystem record, @Param("example") WebSystemExample example);

    int updateByExample(@Param("record") WebSystem record, @Param("example") WebSystemExample example);
}