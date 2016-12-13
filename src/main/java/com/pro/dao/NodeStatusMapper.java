package com.pro.dao;

import com.pro.entity.NodeStatus;
import com.pro.entity.NodeStatusExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface NodeStatusMapper {
    long countByExample(NodeStatusExample example);

    int deleteByExample(NodeStatusExample example);

    int deleteByPrimaryKey(Long nodeId);

    int insert(NodeStatus record);

    int insertSelective(NodeStatus record);

    List<NodeStatus> selectByExample(NodeStatusExample example);

    NodeStatus selectByPrimaryKey(Long nodeId);

    int updateByExampleSelective(@Param("record") NodeStatus record, @Param("example") NodeStatusExample example);

    int updateByExample(@Param("record") NodeStatus record, @Param("example") NodeStatusExample example);

    int updateByPrimaryKeySelective(NodeStatus record);

    int updateByPrimaryKey(NodeStatus record);
}