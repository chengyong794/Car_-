package com.chengyong.sys.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysRole;
import com.chengyong.sys.mapper.SysRoleMapper;
import com.chengyong.sys.service.SysRoleService;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.SysRoleVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SysRoleServiceImpl implements SysRoleService{
	@Autowired
	private SysRoleMapper sysRoleMapper;

	@Override
	public int deleteByPrimaryKey(Short roleid) {
		return sysRoleMapper.deleteByPrimaryKey(roleid);
	}

	@Override
	public int insert(SysRole record) {
		return sysRoleMapper.insert(record);
	}

	@Override
	public int insertSelective(SysRole record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DataView selectByPrimaryKey(SysRole sysRole) {
		Page<Object> page = PageHelper.startPage(sysRole.getPage(), sysRole.getLimit());
		List<SysRole> list = sysRoleMapper.selectByPrimaryKey(sysRole);
		PageInfo<SysRole> info = new PageInfo<SysRole>(list);
		return new DataView(info.getTotal(),list);
	}

	@Override
	public int updateByPrimaryKeySelective(SysRole record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(SysRole record) {
		return sysRoleMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByPrimaryKeyLot(SysRoleVo record) {
		int j = 0;
		try {
			for (int i = 0;i<record.getIds().length;i++) {
				j = sysRoleMapper.deleteByPrimaryKey(record.getIds()[i]);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return j;
	}

}
