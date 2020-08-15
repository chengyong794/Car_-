package com.chengyong.car.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.car.entity.Cars;

@Repository
public interface CarsMapper {
    int deleteByPrimaryKey(String carnumber);

    int insert(Cars record);

    int insertSelective(Cars record);

    List<Cars> selectByPrimaryKey(Cars record);

    int updateByPrimaryKeySelective(Cars record);

    int updateByPrimaryKey(Cars record);
    
    Cars selectBycarnumber(Cars record);
    
    int updateByIsrentiing(Cars record);
}