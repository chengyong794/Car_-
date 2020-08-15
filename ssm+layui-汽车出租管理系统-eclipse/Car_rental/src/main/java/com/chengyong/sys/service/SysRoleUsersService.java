package com.chengyong.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysRoleUsers;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.SysUsersVo;

@Service
public interface SysRoleUsersService {
	int deleteByPrimaryKey(Short uid);

    int insert(SysUsersVo sysUsersVo);

    int insertSelective(SysRoleUsers record);

    DataView selectByPrimaryKey(SysRoleUsers sysRoleUsers);

    int updateByPrimaryKeySelective(SysRoleUsers record);

    int updateByPrimaryKey(SysRoleUsers record);
    
}
