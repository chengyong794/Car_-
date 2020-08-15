package com.chengyong.chart.serviceimpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.chart.entity.chart;
import com.chengyong.chart.mapper.chartMapper;
import com.chengyong.chart.service.chartService;

@Service
public class chartServiceImpl implements chartService{
    
	@Autowired
	private chartMapper cMapper;
	
	@Override
	public List<chart> selectBycust() {
		return cMapper.selectBycust();
	}

	@Override
	public List<Double> selectBygrade(String year) {
		return cMapper.selectBygrade(year);
	}

	@Override
	public List<chart> selectByopername(String year) {
		return cMapper.selectByopername(year);
	}

}
