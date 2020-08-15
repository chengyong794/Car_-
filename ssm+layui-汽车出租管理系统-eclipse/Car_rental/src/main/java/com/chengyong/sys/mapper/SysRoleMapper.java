package com.chengyong.sys.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.sys.entity.SysRole;

@Repository
public interface SysRoleMapper {
    int deleteByPrimaryKey(Short roleid);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    List<SysRole> selectByPrimaryKey(SysRole sysRole);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
    
    List<SysRole> SECURITY_ROLE(Short userid);
    
}