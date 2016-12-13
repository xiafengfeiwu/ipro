package com.pro.dao;

import com.pro.entity.Packet;
import com.pro.entity.PacketExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface PacketMapper {
    long countByExample(PacketExample example);

    int deleteByExample(PacketExample example);

    int deleteByPrimaryKey(Long packetId);

    int insert(Packet record);

    int insertSelective(Packet record);

    List<Packet> selectByExample(PacketExample example);

    Packet selectByPrimaryKey(Long packetId);

    int updateByExampleSelective(@Param("record") Packet record, @Param("example") PacketExample example);

    int updateByExample(@Param("record") Packet record, @Param("example") PacketExample example);

    int updateByPrimaryKeySelective(Packet record);

    int updateByPrimaryKey(Packet record);
}