package com.chengyong.car.services;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.chengyong.car.entity.CarCustomer;
import com.chengyong.sys.util.DataView;

@Service
public interface CarCustomerService {
	int deleteByPrimaryKey(String identity);
	
	int deleteByPrimaryKeyLot(CarCustomer record);

    int insert(CarCustomer record);

    int insertSelective(CarCustomer record);

    DataView selectByPrimaryKey(CarCustomer carCustomer);

    int updateByPrimaryKeySelective(CarCustomer record);

    int updateByPrimaryKey(CarCustomer record);
    
    void exportCustomer(CarCustomer carCustomer,HttpServletResponse response);
    
    CarCustomer selectByIDENTITY(String identity);
}
