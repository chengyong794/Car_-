package com.chengyong.sys.serviceImpl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysRole;
import com.chengyong.sys.entity.SysRoleUsers;
import com.chengyong.sys.mapper.SysRoleMapper;
import com.chengyong.sys.mapper.SysRoleUsersMapper;
import com.chengyong.sys.service.SysRoleUsersService;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.Publicvalue;
import com.chengyong.sys.util.SysUsersVo;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SysRoleUsersServiceImpl implements SysRoleUsersService{

	@Autowired
	private SysRoleUsersMapper sysRoleUsersMapper;
	
	@Autowired
	private SysRoleMapper sysRoleMapper;
	
	@Override
	public int deleteByPrimaryKey(Short uid) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 用户角色id 中间表插入
	 */
	@Override
	public int insert(SysUsersVo sysUsersVo) {
		//当插入新的中间表关联id  时，先删除原来的  中间表id
		sysRoleUsersMapper.deleteByPrimaryKey(sysUsersVo.getUserid());
		//然后在进行新的角色和用户关系的id 插入
		int j = 0;
		for (int i = 0; i < sysUsersVo.getIds().length; i++) {
			SysRoleUsers record = new SysRoleUsers();
			record.setUid(sysUsersVo.getUserid());
			record.setRid(sysUsersVo.getIds()[i]);
			j = sysRoleUsersMapper.insert(record);
		}
		
		return j;
		
	}

	@Override
	public int insertSelective(SysRoleUsers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	/**
	 * 用户与角色的关系展示
	 */
	@Override
	public DataView selectByPrimaryKey(SysRoleUsers sysRoleUsers) {
		
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		
		// 查询该用户已经有的角色
		List<SysRoleUsers> RoleUserslist = sysRoleUsersMapper.selectByPrimaryKey(sysRoleUsers.getUid());
		
		//如果不为 null表示 关联表里面有数据。
		//List<SysRoleUsers> selectByList = sysRoleUsersMapper.selectByList();
		if(RoleUserslist!=null&&RoleUserslist.size()!=0) {
			
	        //查询所有可用的角色，用于和用于已经有的角色进行比较
			SysRole sysRole = new SysRole();
			sysRole.setRoletype(Publicvalue.Role_TYPE_available);
			List<SysRole> Rolelist = sysRoleMapper.selectByPrimaryKey(sysRole);
			
			
			for (SysRole sysRole2 : Rolelist) {
				boolean LAY_CHECKED = false; //layui 默认的名字  ，为 true选中复选框，为false 为补选中
				Map<String,Object> map = new HashMap<String,Object>();
				for (SysRoleUsers sysRole3 : RoleUserslist) {
					if(sysRole2.getRoleid()==sysRole3.getRid()) {
						LAY_CHECKED = true;
					}
				}
				map.put("roleid", sysRole2.getRoleid());
				map.put("rolename", sysRole2.getRolename());
				map.put("roledesc", sysRole2.getRoledesc());
				map.put("LAY_CHECKED", LAY_CHECKED);
				list.add(map);
			}
		}else {
			//如果不为 null表示 角色和用户关联表里面无数据。
			SysRole sysRole = new SysRole();
			sysRole.setRoletype(Publicvalue.Role_TYPE_available);
			List<SysRole> Rolelist = sysRoleMapper.selectByPrimaryKey(sysRole);
			for (SysRole sysRole2 : Rolelist) {
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("roleid", sysRole2.getRoleid());
				map.put("rolename", sysRole2.getRolename());
				map.put("roledesc", sysRole2.getRoledesc());
				list.add(map);
			}
		}
		
		
		return new DataView(list);
	}

	@Override
	public int updateByPrimaryKeySelective(SysRoleUsers record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(SysRoleUsers record) {
		// TODO Auto-generated method stub
		return 0;
	}

}
