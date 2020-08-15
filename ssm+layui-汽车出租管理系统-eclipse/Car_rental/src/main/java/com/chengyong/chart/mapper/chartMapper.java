package com.chengyong.chart.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.chart.entity.chart;

@Repository
public interface chartMapper {
	List<chart> selectBycust();
	
	List<Double> selectBygrade(String year);
	
	List<chart> selectByopername(String year);
}
