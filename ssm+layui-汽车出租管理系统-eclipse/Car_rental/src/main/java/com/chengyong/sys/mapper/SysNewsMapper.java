package com.chengyong.sys.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.sys.entity.SysNews;
import com.chengyong.sys.util.SysNewsVo;

@Repository
public interface SysNewsMapper {
    int deleteByPrimaryKey(Short newsid);

    int insert(SysNews record);

    int insertSelective(SysNews record);

    List<SysNews> selectByPrimaryKey(SysNews sysNews);

    int updateByPrimaryKeySelective(SysNews record);

    int updateByPrimaryKey(SysNews record);
    
    SysNews selectById(Short id);
}