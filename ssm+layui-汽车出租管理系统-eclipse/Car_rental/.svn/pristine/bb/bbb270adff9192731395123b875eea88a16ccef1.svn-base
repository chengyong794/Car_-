package com.chengyong.sys.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.server.PathParam;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.chengyong.car.util.Publicvalue;
import com.chengyong.sys.entity.SysLogLogin;
import com.chengyong.sys.entity.SysUsers;
import com.chengyong.sys.service.SysLogLoginService;
import com.chengyong.sys.service.SysUsersService;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;
import com.chengyong.sys.util.SysUsersVo;
/**
 * 用户管理模块
 * @author PC
 *
 */
@Controller
@RequestMapping("login/")
public class SysUsersController {
   @Autowired
   private SysUsersService sysUsersService;
   
   
   /**
    * 用户登录
    * @param sysUsers
    * @param request
    * @return
    */
   @RequestMapping(value = "userLogin",method = RequestMethod.POST)
   public String userLogin(SysUsers sysUsers,HttpServletRequest request) {
	   try {
		   SysUsers user = sysUsersService.LoginUser(sysUsers);
		   request.getSession().setAttribute("userName", user.getLogname());
		   String code = (String)request.getSession().getAttribute("code");
		   Publicvalue.userName = user.getRealname();
		   if(user!=null) {
			   if(sysUsers.getCode().toUpperCase().equals(code.toUpperCase())) {
				  
				   return "system/main/index";
			   }else {
				   request.setAttribute("msg", "验证码错误！");
				   return "system/main/login";
			   }
			   
		   }else {
			   request.setAttribute("msg", "请检查密码后重新登录！");
			   return "system/main/login";
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
		       return "system/main/login";
	   }
	   
   }
   
   /**
    * 所有用户的显示
    * @param sysUsers
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping("userList")
   @ResponseBody
   public DataView userList(SysUsers sysUsers) {
	   try {
		   DataView list = sysUsersService.selectByPrimaryKey(sysUsers);
		   return list;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }
	   
   }
   
   /**
    * 用户的信息查询
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping("userQuery")
   @ResponseBody
   public DataView userQuery(SysUsers sysUsers) {
	   try {
		   DataView list = sysUsersService.selectByPrimaryKey(sysUsers);
		   return list;
	   }catch(Exception e) {
		   e.printStackTrace();
		   return null;
	   }
	   
   }
   
   /**
    * 用户的添加
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping(value = "userAdd",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userAdd(SysUsers sysUsers) {
	   Map<String,String> map = new HashMap<String,String>();
	   SysUsers list = sysUsersService.addUser(sysUsers);
	   try {
		   if(list==null) {
			   sysUsersService.insert(sysUsers);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_ADDCallback);
			   return map;
		   }else {
			   map.put("msg", CUD_CallbackInfo.LOGINNAME_REPEAT);
			   return map;
		   }
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_ADDCallback);
		   return map;
	   }
   }
   
   /**
    * 用户的修改
    * @param sysUsers
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping(value = "userUpdate",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userUpdate(SysUsers sysUsers) {
	   Map<String,String> map = new HashMap<String,String>();
	   try {
		   sysUsersService.updateByPrimaryKey(sysUsers);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
		   return map;
	   }
   }
   
   /**
    * 用户的删除
    * @param sysUsers
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping(value = "userDelete",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userDelete(@PathParam("userid") Short userid) {
	   Map<String,String> map = new HashMap<String,String>();
	   try {
		   sysUsersService.deleteByPrimaryKey(userid);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
		   return map;
	   }
   }
   
   /**
    * 用户的批量
    * @param sysUsers
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping(value = "userDeleteLot",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userDeleteLot(@PathParam("ids") SysUsersVo sysUsersVo) {
	   Map<String,String> map = new HashMap<String,String>();
	   try {
		   sysUsersService.deleteByPrimaryKeyLot(sysUsersVo);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
		   return map;
	   }
   }
   
   /**
    * 用户的重置密码
    * @param sysUsers
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping(value = "userReset",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userReset(@Param("userid") Short userid) {
	   Map<String,String> map = new HashMap<String,String>();
	   try {
		   sysUsersService.uesrReset(userid);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_RESETCallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_RESETCallback);
		   return map;
	   }
   }
   
   /**
    * 用户的修改密码
    * @param sysUsers
    * @return
    */
   @RequestMapping(value = "userUpdatePwd",method = RequestMethod.POST)
   @ResponseBody
   public Map<String,String> userUpdatePwd(SysUsersVo sysUsers) {
	   Map<String,String> map = new HashMap<String,String>();
	   List<SysUsers> list = sysUsersService.oldPwd(sysUsers);
	   try {
		   if(list!=null && list.size()!=0) {
			   if(sysUsers.getNewPwd().equals(sysUsers.getAgNewPwd())) {
				   sysUsersService.uesrPwdUpdate(sysUsers);
				   map.put("msg", CUD_CallbackInfo.SUCCESS_PWD);
				   return map;
			   }else {
				   map.put("msg", "两次密码不一致请重新输入");
				   return map;
			   }
		   }else {
			   map.put("msg", "密码错误请重试！");
			   return map;
		   }
		   
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_PWD);
		   return map;
	   }
   }
   
   
   /**
    * 获取用户的个人信息
    * @param sysUsers
    * @return
    */
   @RequestMapping("getUserPer")
   public ModelAndView getUserPer(@RequestParam("logname") String logname) {
	   ModelAndView mod = new ModelAndView("system/user/userInfo");
	   try {
		   SysUsers sysUsers = new SysUsers();
		   sysUsers.setLogname(logname);
		   SysUsers user= sysUsersService.addUser(sysUsers);
		   mod.addObject("user", user);
		   return mod;
	   }catch(Exception e) {
		   e.printStackTrace();
		   
		   return mod;
	   }
   }
   
   /**
    * 用户的修改
    * @param sysUsers
    * @return
    */
   @RequestMapping(value = "userPerUpdate")
   @ResponseBody
   public Map<String,String> userPerUpdate(SysUsers sysUsers) {
	   Map<String,String> map = new HashMap<String,String>();
	   try {
		   sysUsersService.updateByLogname(sysUsers);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
		   return map;
	   }
   }
}
