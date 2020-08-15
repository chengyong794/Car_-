package com.chengyong.car.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.chengyong.car.entity.CarRent;

@Repository
public interface CarRentMapper {
    int deleteByPrimaryKey(String rentid);

    int insert(CarRent record);

    int insertSelective(CarRent record);

    List<CarRent> selectByPrimaryKey(CarRent record);
    
    CarRent selectByRentid(String rentid);

    int updateByPrimaryKeySelective(CarRent record);

    int updateByPrimaryKey(CarRent record);
}