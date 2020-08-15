package com.chengyong.car.services;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;

import com.chengyong.car.entity.Cars;
import com.chengyong.sys.util.DataView;

@Service
public interface CarsService {
	int deleteByPrimaryKey(String carnumber);

    int insert(Cars record);

    int insertSelective(Cars record);

    DataView selectByPrimaryKey(Cars record);

    int updateByPrimaryKeySelective(Cars record);

    int updateByPrimaryKey(Cars record,HttpServletRequest request);
    
    int deleteByPrimaryKeyLot(Cars record);
    
    int updateByIsrentiing(Cars record);
}
