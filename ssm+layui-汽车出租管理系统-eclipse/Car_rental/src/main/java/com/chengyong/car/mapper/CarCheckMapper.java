package com.chengyong.car.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.car.entity.CarCheck;

@Repository
public interface CarCheckMapper {
    int deleteByPrimaryKey(String checkid);

    int insert(CarCheck record);

    int insertSelective(CarCheck record);

    List<CarCheck> selectByPrimaryKey(CarCheck record);

    int updateByPrimaryKeySelective(CarCheck record);

    int updateByPrimaryKey(CarCheck record);
}