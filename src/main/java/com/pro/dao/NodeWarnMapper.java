package com.pro.dao;

import com.pro.entity.NodeWarn;
import com.pro.entity.NodeWarnExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NodeWarnMapper {
    long countByExample(NodeWarnExample example);

    int deleteByExample(NodeWarnExample example);

    int deleteByPrimaryKey(Long warnId);

    int insert(NodeWarn record);

    int insertSelective(NodeWarn record);

    List<NodeWarn> selectByExample(NodeWarnExample example);

    NodeWarn selectByPrimaryKey(Long warnId);

    int updateByExampleSelective(@Param("record") NodeWarn record, @Param("example") NodeWarnExample example);

    int updateByExample(@Param("record") NodeWarn record, @Param("example") NodeWarnExample example);

    int updateByPrimaryKeySelective(NodeWarn record);

    int updateByPrimaryKey(NodeWarn record);
}