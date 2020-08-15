package com.chengyong.car.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.car.entity.CarCustomer;
import com.chengyong.car.entity.Cars;
import com.chengyong.car.services.CarsService;
import com.chengyong.car.util.FileUtil;
import com.chengyong.car.util.Publicvalue;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;

/**
 * 汽车管理
 * @author PC
 *
 */
@Controller
@RequestMapping("car/")
@Secured({"ROLE_BUSINESS","ROLE_SUPER"})
public class CarController {
	@Autowired
	private CarsService carsService;
   
	/**
	 * 汽车数据
	 * @param cars
	 * @return
	 */
	@RequestMapping("carList")
	@ResponseBody
   public DataView carList(Cars cars) {
		try {
			return carsService.selectByPrimaryKey(cars);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
   }
	
	/**
	    * 汽车的添加
	    * @return
	    */
	   @RequestMapping(value = "CarsAdd",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> CarsAdd(Cars cars,HttpServletRequest request) {
		   Map<String,String> map = new HashMap<String,String>();
		   if(!cars.getCarimg().equals("/CarImg/default.jpg")) {  //默认图片判断
			   String Carpic = FileUtil.FileUpdate(Publicvalue.Carpic,request);
			   cars.setCarimg(Carpic);
		   }
		  
		   try {
			   carsService.insert(cars);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_ADDCallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_ADDCallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 汽车的修改
	    * @return
	    */
	   @RequestMapping(value = "CarsUpdate",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> CarsUpdate(Cars cars,HttpServletRequest request) {
		   Map<String,String> map = new HashMap<String,String>();
		   
		   try {
			   carsService.updateByPrimaryKey(cars,request);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 汽车的删除
	    * @return
	    */
	   @RequestMapping(value = "CarsDelete")
	   @ResponseBody
	   public Map<String,String> CarsDelete(@Param("carnumber") String carnumber) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carsService.deleteByPrimaryKey(carnumber);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 汽车的删除批量
	    * @return
	    */
	   @RequestMapping(value = "CarsDeleteLot")
	   @ResponseBody
	   public Map<String,String> CarsDeleteLot(Cars cars) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carsService.deleteByPrimaryKeyLot(cars);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
}
