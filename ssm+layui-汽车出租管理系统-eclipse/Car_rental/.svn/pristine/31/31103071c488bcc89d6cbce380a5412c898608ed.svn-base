package com.chengyong.car.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.car.entity.CarCustomer;
import com.chengyong.car.services.CarCustomerService;
import com.chengyong.sys.entity.SysUsers;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;

/**
 * 客户信息
 * @author PC
 *
 */
@Controller
@RequestMapping("customer/")
@Secured({"ROLE_BUSINESS","ROLE_SUPER"})
public class CarCustomerController {
	@Autowired
	private CarCustomerService carCustomerService;
	
	/**
	 * 客户信息查询
	 * @param carCustomer
	 * @return
	 */
	@RequestMapping("CustomerList")
	@ResponseBody
	public DataView CustomerList(CarCustomer carCustomer) {
		try{
			return carCustomerService.selectByPrimaryKey(carCustomer);
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	
	 /**
	    * 客户的添加
	    * @return
	    */
	   @RequestMapping(value = "customerAdd",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> customerAdd(CarCustomer carCustomer) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carCustomerService.insert(carCustomer);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_ADDCallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_ADDCallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 客户的修改
	    * @return
	    */
	   @RequestMapping(value = "customerUpdate",method = RequestMethod.POST)
	   @ResponseBody
	   public Map<String,String> customerUpdate(CarCustomer carCustomer) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carCustomerService.updateByPrimaryKey(carCustomer);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 客户的删除
	    * @return
	    */
	   @RequestMapping(value = "customerDelete")
	   @ResponseBody
	   public Map<String,String> customerDelete(@Param("identity") String identity) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carCustomerService.deleteByPrimaryKey(identity);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 客户的删除批量
	    * @return
	    */
	   @RequestMapping(value = "customerDeleteLot")
	   @ResponseBody
	   public Map<String,String> customerDeleteLot(CarCustomer carCustomer) {
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   carCustomerService.deleteByPrimaryKeyLot(carCustomer);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
	   
	   /**
	    * 客户的信息导出
	    * @return
	    */
	   @RequestMapping(value = "exportCustomer")
	   public void exportCustomer(CarCustomer carCustomer,HttpServletResponse response) {
		   try {
			   carCustomerService.exportCustomer(carCustomer,response);
		   }catch(Exception e) {
			   e.printStackTrace();
		   }
	   }
	   
	   
	   /**
		 * 汽车出租时验证客户是否存在
		 * @param carCustomer
		 * @return
		 */
		@RequestMapping("CustomerIdentity")
		@ResponseBody
		public Map<String,Object> CustomerIdentity(@Param("identity") String identity) {
			Map<String,Object> map = new HashMap<String,Object>();
			try{
				if(carCustomerService.selectByIDENTITY(identity)!=null) {
					map.put("msg", 1);
				}
				return map;
			}catch(Exception e) {
				e.printStackTrace();
				map.put("msg", -1);
				return map;
			}
		}
}
