package com.pro.dao;

import com.pro.entity.ProjectArea;
import com.pro.entity.ProjectAreaExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ProjectAreaMapper {
    long countByExample(ProjectAreaExample example);

    int deleteByExample(ProjectAreaExample example);

    int deleteByPrimaryKey(Long projectAreaId);

    int insert(ProjectArea record);

    int insertSelective(ProjectArea record);

    List<ProjectArea> selectByExample(ProjectAreaExample example);

    ProjectArea selectByPrimaryKey(Long projectAreaId);

    int updateByExampleSelective(@Param("record") ProjectArea record, @Param("example") ProjectAreaExample example);

    int updateByExample(@Param("record") ProjectArea record, @Param("example") ProjectAreaExample example);

    int updateByPrimaryKeySelective(ProjectArea record);

    int updateByPrimaryKey(ProjectArea record);
}