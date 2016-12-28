package com.pro.dao;

import com.pro.entity.NodeReplace;
import com.pro.entity.NodeReplaceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NodeReplaceMapper {
    long countByExample(NodeReplaceExample example);

    int deleteByExample(NodeReplaceExample example);

    int deleteByPrimaryKey(Long recordId);

    int insert(NodeReplace record);

    int insertSelective(NodeReplace record);

    List<NodeReplace> selectByExample(NodeReplaceExample example);

    NodeReplace selectByPrimaryKey(Long recordId);

    int updateByExampleSelective(@Param("record") NodeReplace record, @Param("example") NodeReplaceExample example);

    int updateByExample(@Param("record") NodeReplace record, @Param("example") NodeReplaceExample example);

    int updateByPrimaryKeySelective(NodeReplace record);

    int updateByPrimaryKey(NodeReplace record);
}