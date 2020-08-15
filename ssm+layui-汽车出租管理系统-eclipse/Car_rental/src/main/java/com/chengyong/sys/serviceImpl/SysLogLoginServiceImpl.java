package com.chengyong.sys.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysLogLogin;
import com.chengyong.sys.mapper.SysLogLoginMapper;
import com.chengyong.sys.service.SysLogLoginService;
import com.chengyong.sys.util.DataView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SysLogLoginServiceImpl implements SysLogLoginService{
    
	@Autowired
	private SysLogLoginMapper sysLogLoginMapper;
	
	@Override
	public int deleteByPrimaryKey(Short loginid) {
		return sysLogLoginMapper.deleteByPrimaryKey(loginid);
	}

	@Override
	public int insert(SysLogLogin record) {
		return sysLogLoginMapper.insert(record);
	}

	@Override
	public int insertSelective(SysLogLogin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DataView selectByPrimaryKey(SysLogLogin sysLogLogin) {
		Page<Object> page = PageHelper.startPage(sysLogLogin.getPage(),sysLogLogin.getLimit());
		List<SysLogLogin> list = sysLogLoginMapper.selectByPrimaryKey(sysLogLogin);
		PageInfo<SysLogLogin> info = new PageInfo<SysLogLogin>(list);
		return new DataView(info.getTotal(),list);
	}

	@Override
	public int updateByPrimaryKeySelective(SysLogLogin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(SysLogLogin record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteByPrimaryKeyLot(SysLogLogin sysLogLogin) {
		int j = 0;
		for (int i = 0; i < sysLogLogin.getIds().length; i++) {
			j = sysLogLoginMapper.deleteByPrimaryKey(sysLogLogin.getIds()[i]);
		}
		return j;
	}

}
