package com.chengyong.sys.mapper;

import java.util.List;

import com.chengyong.sys.entity.SysUsers;
import com.chengyong.sys.util.SysUsersVo;

public interface SysUsersMapper {
    int deleteByPrimaryKey(Short userid);

    int insert(SysUsers record);

    int insertSelective(SysUsers record);

    List<SysUsers> selectByPrimaryKey(SysUsers sysUsers);

    int updateByPrimaryKeySelective(SysUsers record);

    int updateByPrimaryKey(SysUsers record);
    
    SysUsers LoginUser(SysUsers sysUsers);
    
    int uesrReset(SysUsers sysUsers);
    
    int uesrPwdUpdate(SysUsersVo record);
    
    SysUsers addUser(SysUsers sysUsers);
    
    List<SysUsers> oldPwd(SysUsersVo record);
    
    int updateByLogname(SysUsers sysUsers);
    
    int uesrHeadPicUpdate(SysUsers sysUsers);
}