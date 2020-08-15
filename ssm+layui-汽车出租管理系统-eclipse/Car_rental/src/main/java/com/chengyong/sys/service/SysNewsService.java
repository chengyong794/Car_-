package com.chengyong.sys.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysNews;
import com.chengyong.sys.util.DataView;

@Service
public interface SysNewsService {
	int deleteByPrimaryKey(Short newsid);
	
	int deleteByPrimaryKeyLot(SysNews sysNews);

    int insert(SysNews record);

    int insertSelective(SysNews record);

    DataView selectByPrimaryKey(SysNews sysNews);

    int updateByPrimaryKeySelective(SysNews record);

    int updateByPrimaryKey(SysNews record);
    
    SysNews selectById(Short id);
}
