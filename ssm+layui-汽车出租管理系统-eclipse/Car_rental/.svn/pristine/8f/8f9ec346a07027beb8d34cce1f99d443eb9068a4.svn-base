package com.chengyong.sys.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.sys.entity.SysNews;
import com.chengyong.sys.service.SysNewsService;
import com.chengyong.sys.util.CUD_CallbackInfo;
import com.chengyong.sys.util.DataView;

/**
 * 首页公告的信息
 * @author PC
 *
 */
@Controller
@RequestMapping("news/")
public class SysNewsController {
   @Autowired
   private SysNewsService sysNewsService;
   
   @RequestMapping("newsList")
   @ResponseBody
   public DataView newsList(SysNews sysNews) {
	   return sysNewsService.selectByPrimaryKey(sysNews);
   }
   
   /**
    * 新增公告
    * @param sysNews
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping("newsAdd")
   @ResponseBody
   public Map<String,String> newsAdd(SysNews sysNews,HttpServletRequest request){
	   Map<String,String> map = new HashMap<String,String>();
	   sysNews.setCreatetime(new Date());
	   try {
		   sysNewsService.insert(sysNews);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_ADDCallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_ADDCallback);
		   return map;
	   }
 }
   
   /**
    * 修改公告
    * @param sysNews
    * @return
    */
   @Secured({"ROLE_SYS","ROLE_SUPER"})
   @RequestMapping("newsUpdate")
   @ResponseBody
   public Map<String,String> newsUpdate(SysNews sysNews){
	   Map<String,String> map = new HashMap<String,String>();
	   sysNews.setCreatetime(new Date());
	   try {
		   sysNewsService.updateByPrimaryKey(sysNews);
		   map.put("msg", CUD_CallbackInfo.SUCCESS_UPDATECallback);
		   return map;
	   }catch(Exception e) {
		   e.printStackTrace();
		   map.put("msg", CUD_CallbackInfo.FAILURE_UPDATECallback);
		   return map;
	   }
 }
	   
	   /**
	    * 删除公告
	    * @param sysNews
	    * @return
	    */
       @Secured({"ROLE_SYS","ROLE_SUPER"})
	   @RequestMapping("newsDelete")
	   @ResponseBody
	   public Map<String,String> newsDelete(@Param("newsid") Short newsid){
		   Map<String,String> map = new HashMap<String,String>();
		   try {
			   sysNewsService.deleteByPrimaryKey(newsid);
			   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
			   return map;
		   }catch(Exception e) {
			   e.printStackTrace();
			   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
			   return map;
		   }
	   }
		   
		   
		   /**
		    * 删除公告批量
		    * @param sysNews
		    * @return
		    */
           @Secured({"ROLE_SYS","ROLE_SUPER"})
		   @RequestMapping("newsDeleteLot")
		   @ResponseBody
		   public Map<String,String> newsDeleteLot(SysNews sysNews){
			   Map<String,String> map = new HashMap<String,String>();
			   try {
				   sysNewsService.deleteByPrimaryKeyLot(sysNews);
				   map.put("msg", CUD_CallbackInfo.SUCCESS_DELETECallback);
				   return map;
			   }catch(Exception e) {
				   e.printStackTrace();
				   map.put("msg", CUD_CallbackInfo.FAILURE_DELETECallback);
				   return map;
			   }
	   
        }
		   
		   /**
		    * 点击查看公告消息
		    * @author PC
		    *
		    */
		      
		      @RequestMapping("newsAseparate")
		      @ResponseBody
		      public SysNews newsAseparate(@Param("newsid") Short newsid) {
		   	   return sysNewsService.selectById(newsid);
		      }
		      
		   
		   
}
