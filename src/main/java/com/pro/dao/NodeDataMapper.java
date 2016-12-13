package com.pro.dao;

import com.pro.entity.NodeData;
import com.pro.entity.NodeDataExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NodeDataMapper {
    long countByExample(NodeDataExample example);

    int deleteByExample(NodeDataExample example);

    int deleteByPrimaryKey(Long dataId);

    int insert(NodeData record);

    int insertSelective(NodeData record);

    List<NodeData> selectByExample(NodeDataExample example);

    NodeData selectByPrimaryKey(Long dataId);

    int updateByExampleSelective(@Param("record") NodeData record, @Param("example") NodeDataExample example);

    int updateByExample(@Param("record") NodeData record, @Param("example") NodeDataExample example);

    int updateByPrimaryKeySelective(NodeData record);

    int updateByPrimaryKey(NodeData record);
}