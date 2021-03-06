package com.chengyong.car.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.car.entity.CarCustomer;
import com.chengyong.car.entity.CarRent;
import com.chengyong.car.entity.Cars;
import com.chengyong.car.services.CarCustomerService;
import com.chengyong.car.services.CarRentService;
import com.chengyong.car.services.CarsService;
import com.chengyong.car.util.DateRandm;
import com.chengyong.car.util.ExcelFileGenerator;
import com.chengyong.car.util.FileUtil;
import com.chengyong.car.util.Publicvalue;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;

/**
 * 汽车出租单
 * @author PC
 *
 */
@Controller
@RequestMapping("CarRent/")
@Secured({"ROLE_BUSINESS","ROLE_SUPER"})
public class CarRentController {
	@Autowired
	private CarCustomerService carCustomerService;
	
	@Autowired
	private CarsService carsService;
	
	@Autowired
	private CarRentService carRentService;
    
	/**
	 * 出租信息的显示
	 * @param identity
	 * @param price
	 * @param carnumber
	 * @param request
	 * @return
	 */
	@RequestMapping("Cust_CarRentList")
	@ResponseBody
	public Map<String,Object> Cust_CarRentList(
			@Param("identity") String identity,
			@Param("price") Short price,
			@Param("carnumber") String carnumber,
			HttpServletRequest request){
		Map<String,Object> map = new HashMap<String,Object>();
		
		String rentid = DateRandm.dateRandm();
	    //String operName = (String)request.getSession().getAttribute("userName");
		
		map.put("cusIdentity", identity);
		map.put("price", price);
		map.put("carNumber", carnumber);
		map.put("rentid", rentid);
		map.put("opername", Publicvalue.userName);
		
		return map;
	}
	
	/**
	    * 汽车出租单的添加
	    * @return
	    */
	   @RequestMapping(value = "CarRentAdd",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> CarRentAdd(CarRent carRent,HttpServletRequest request) {
		   Map<String,String> map = new HashMap<String,String>();
		   
		   try {
			   carRentService.insert(carRent); //出租单添加
			   Cars record = new Cars();
			   record.setCarnumber(carRent.getCarNumber());
			   record.setIsrentiing((short)1);
			   carsService.updateByIsrentiing(record); //进行汽车是否出租状态的修改
			   map.put("msg", CUD_CallbackInfo.SUCCESS_ADDCallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_ADDCallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 汽车出租单的显示
	    * @return
	    */
	   @RequestMapping("CarRentList")
	   @ResponseBody
	   public DataView CarRentList(CarRent carRent) {
		   try {
			   return carRentService.selectByPrimaryKey(carRent);
		   }catch(Exception e) {
			   e.printStackTrace();
			   return null;
		   }
	   }
	   
	   /**
	    * 出租单的修改
	    * @return
	    */
	   @RequestMapping(value = "carRentUpdate",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> carRentUpdate(CarRent carRent) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carRentService.updateByPrimaryKey(carRent);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 出租单的删除
	    * @return
	    */
	   @RequestMapping(value = "carRentDelete")
	   @ResponseBody
	   public Map<String,String> carRentDelete(@Param("rentid") String rentid) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   CarRent carRent = carRentService.selectByRentid(rentid); //根据出租单号查询车辆信息
			   Cars record = new Cars();
			   record.setCarnumber(carRent.getCarNumber());
			   record.setIsrentiing((short)0);
			   carsService.updateByIsrentiing(record); //将出租单进行删除后汽车恢复可以出租状态
			   carRentService.deleteByPrimaryKey(rentid);
			   
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
	   
	   
	   /**
	    * 出租单信息的导出poi
	    * @return
	    */
	   @RequestMapping(value = "carRentexport")
	   public void carRentexport(@Param("rentid") String rentid,HttpServletResponse response) {
		   try {
			  carRentService.carRentexport(rentid,response);
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	   }
}
