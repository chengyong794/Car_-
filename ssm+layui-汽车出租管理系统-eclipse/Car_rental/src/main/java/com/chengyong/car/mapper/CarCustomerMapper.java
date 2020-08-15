package com.chengyong.car.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.chengyong.car.entity.CarCustomer;

@Repository
public interface CarCustomerMapper {
    int deleteByPrimaryKey(String identity);

    int insert(CarCustomer record);

    int insertSelective(CarCustomer record);

    List<CarCustomer> selectByPrimaryKey(CarCustomer carCustomer);

    int updateByPrimaryKeySelective(CarCustomer record);

    int updateByPrimaryKey(CarCustomer record);
    
    CarCustomer selectByIDENTITY(String identity);
}