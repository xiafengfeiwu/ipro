package com.pro.dao;

import com.pro.entity.WarnGroupItem;
import com.pro.entity.WarnGroupItemExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface WarnGroupItemMapper {
    long countByExample(WarnGroupItemExample example);

    int deleteByExample(WarnGroupItemExample example);

    int deleteByPrimaryKey(Long itemId);

    int insert(WarnGroupItem record);

    int insertSelective(WarnGroupItem record);

    List<WarnGroupItem> selectByExample(WarnGroupItemExample example);

    WarnGroupItem selectByPrimaryKey(Long itemId);

    int updateByExampleSelective(@Param("record") WarnGroupItem record, @Param("example") WarnGroupItemExample example);

    int updateByExample(@Param("record") WarnGroupItem record, @Param("example") WarnGroupItemExample example);

    int updateByPrimaryKeySelective(WarnGroupItem record);

    int updateByPrimaryKey(WarnGroupItem record);
}