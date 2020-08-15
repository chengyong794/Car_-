package com.chengyong.sys.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.sys.entity.SysMenus;

@Repository
public interface SysMenusMapper {
    int deleteByPrimaryKey(Short id);

    int insert(SysMenus record);

    int insertSelective(SysMenus record);

    SysMenus selectByPrimaryKey(Short id);

    int updateByPrimaryKeySelective(SysMenus record);

    int updateByPrimaryKey(SysMenus record);
    
    List<SysMenus> selectByMenus();
}