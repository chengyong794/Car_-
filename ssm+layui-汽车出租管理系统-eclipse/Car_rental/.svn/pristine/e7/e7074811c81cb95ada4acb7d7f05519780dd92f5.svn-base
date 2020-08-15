package com.chengyong.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysRole;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.SysRoleVo;

@Service
public interface SysRoleService {
	int deleteByPrimaryKey(Short roleid);
	
	int deleteByPrimaryKeyLot(SysRoleVo record);

    int insert(SysRole record);

    int insertSelective(SysRole record);

    DataView selectByPrimaryKey(SysRole sysRole);

    int updateByPrimaryKeySelective(SysRole record);

    int updateByPrimaryKey(SysRole record);
}
