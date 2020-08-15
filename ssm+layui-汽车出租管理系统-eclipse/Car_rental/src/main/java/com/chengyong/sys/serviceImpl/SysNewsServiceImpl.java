package com.chengyong.sys.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.sys.entity.SysNews;
import com.chengyong.sys.mapper.SysNewsMapper;
import com.chengyong.sys.service.SysNewsService;
import com.chengyong.sys.util.DataView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class SysNewsServiceImpl implements SysNewsService{
    
	@Autowired
	private SysNewsMapper sysNewsMapper;
	
	@Override
	public int deleteByPrimaryKey(Short newsid) {
		return sysNewsMapper.deleteByPrimaryKey(newsid);
	}

	@Override
	public int insert(SysNews record) {
		return sysNewsMapper.insert(record);
	}

	@Override
	public int insertSelective(SysNews record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DataView selectByPrimaryKey(SysNews sysNews) {
		Page<Object> page = PageHelper.startPage(sysNews.getPage(),sysNews.getLimit());
		List<SysNews> list = sysNewsMapper.selectByPrimaryKey(sysNews);
		PageInfo<SysNews> info = new PageInfo<SysNews>();
		return new DataView(info.getTotal(),list);
	}

	@Override
	public int updateByPrimaryKeySelective(SysNews record) {
		return 0;
	}

	@Override
	public int updateByPrimaryKey(SysNews record) {
		return sysNewsMapper.updateByPrimaryKey(record);
	}

	@Override
	public int deleteByPrimaryKeyLot(SysNews sysNews) {
		int j = 0;
		for (int i = 0; i < sysNews.getIds().length; i++) {
			sysNewsMapper.deleteByPrimaryKey(sysNews.getIds()[i]);
		}
		return j;
	}

	@Override
	public SysNews selectById(Short id) {
		return sysNewsMapper.selectById(id);
	}

}
