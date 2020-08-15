package com.chengyong.car.services;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.chengyong.car.entity.CarCheck;
import com.chengyong.car.entity.CarRent;
import com.chengyong.sys.util.DataView;

@Service
public interface CarCheckService {
	int deleteByPrimaryKey(String checkid);

    int insert(CarCheck record);

    int insertSelective(CarCheck record);

    DataView selectByPrimaryKey(CarCheck record);

    int updateByPrimaryKeySelective(CarCheck record);

    int updateByPrimaryKey(CarCheck record);
    
    CarRent CarRentid(String rentid);
    
    Map<String,Map<String,Object>> maps(String rentid);
}
