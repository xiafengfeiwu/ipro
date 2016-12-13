package com.pro.dao;

import com.pro.entity.Terminal;
import com.pro.entity.TerminalExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TerminalMapper {
    long countByExample(TerminalExample example);

    int deleteByExample(TerminalExample example);

    int deleteByPrimaryKey(Long terminalId);

    int insert(Terminal record);

    int insertSelective(Terminal record);

    List<Terminal> selectByExample(TerminalExample example);

    Terminal selectByPrimaryKey(Long terminalId);

    int updateByExampleSelective(@Param("record") Terminal record, @Param("example") TerminalExample example);

    int updateByExample(@Param("record") Terminal record, @Param("example") TerminalExample example);

    int updateByPrimaryKeySelective(Terminal record);

    int updateByPrimaryKey(Terminal record);
}