package com.chengyong.car.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
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

import com.chengyong.car.entity.CarCheck;
import com.chengyong.car.entity.CarRent;
import com.chengyong.car.entity.Cars;
import com.chengyong.car.services.CarCheckService;
import com.chengyong.car.services.CarRentService;
import com.chengyong.car.util.DateRandm;
import com.chengyong.car.util.FileUtil;
import com.chengyong.car.util.Publicvalue;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;

/**
 * 汽车入库 出租单信息的控制
 * @author PC
 *
 */
@Controller
@RequestMapping("carCheck/")
@Secured({"ROLE_BUSINESS","ROLE_SUPER"})
public class CarCheckController {
   @Autowired
   private CarCheckService carCheckService;
   
   @Autowired
   private CarRentService carRentService;
   
   
   /**
    * 查询是否有该出租单信息
    * @return
    */
   @RequestMapping("CarRentid")
   @ResponseBody
   public CarRent CarRentid(@Param("rentid") String rentid) {
	   return carCheckService.CarRentid(rentid);
   }
   
   /**
    * 组装检查单数据
    * @return
    */
   @RequestMapping("check")
   @ResponseBody
   public Map<String,Map<String,Object>> check(@Param("rentid") String rentid,HttpServletRequest request){
	   Map<String,Map<String,Object>> maps = carCheckService.maps(rentid);
	   Map<String,Object> mapcheck = new HashMap<>();
	   //检查单信息组装
	   //String opername = (String)request.getSession().getAttribute("userName");
	   SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
	   Date date = new Date();
	   
	   CarRent selectByRentid = carRentService.selectByRentid(rentid);
	   
	   mapcheck.put("checkid", DateRandm.dateRandm());
	   mapcheck.put("rentid", rentid);
	   mapcheck.put("checkdate", format.format(date));
	   mapcheck.put("opername", selectByRentid.getOpername());
	   maps.put("check", mapcheck);

	   
	   
	   return maps;
   }
   
   /**
    * 检查单的添加
    * @return
    */
   @RequestMapping(value = "CheckAdd",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> CheckAdd(CarCheck carCheck,HttpServletRequest request) {
	   Map<String,String> map = new HashMap<String,String>();
	   
	   try {
		   carCheckService.insert(carCheck);
		   map.put("msg", "车辆已成功归还");
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", "车辆归还操作失败");
		   return map;
	   }
   }
   
   /**
    * 检查单的显示
    * @return
    */
   @RequestMapping(value = "CheckList")
   @ResponseBody
   public DataView CheckList(CarCheck carCheck) {
	   try {
		   return carCheckService.selectByPrimaryKey(carCheck);
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }
   }
   
   /**
    * 检查单的修改
    * @return
    */
   @RequestMapping(value = "CheckUpdate",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> CheckUpdate(CarCheck carCheck) {
	   Map<String,String> map = new HashMap<String,String>();
	   
	   try {
		   carCheckService.updateByPrimaryKey(carCheck);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
		   return map;
	   }
   }
}
