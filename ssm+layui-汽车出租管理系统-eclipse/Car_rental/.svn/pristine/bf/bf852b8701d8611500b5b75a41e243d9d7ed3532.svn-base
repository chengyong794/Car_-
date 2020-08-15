package com.chengyong.chart.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.chart.entity.chart;
import com.chengyong.chart.service.chartService;

@Controller
@RequestMapping("chart/")
@Secured({"ROLE_DATA","ROLE_SUPER"})
public class chartController {
   @Autowired
   private chartService cService;
   
   @RequestMapping("chartList")
   @ResponseBody
   public List<chart> chartareaList(){
	   List<chart> list = cService.selectBycust();
	   return list;
   }
   
   @RequestMapping("chartgradeList")
   @ResponseBody
   public List<Double> chartgradeList(@Param("year") String year){
	   List<Double> list = cService.selectBygrade(year);
	   return list;
   }
   
   @RequestMapping("chartopername")
   @ResponseBody
   public Map<String,Object> chartopername(@Param("year") String year){
	   List<chart> list = cService.selectByopername(year);
	   List<String> name = new ArrayList<String>();
	   List<Object> value = new ArrayList<>();
	   Map<String,Object> map = new HashMap<>();
	   for (chart obj : list) {
		  name.add(obj.getName());
		  value.add(obj.getValue());
	   }
	   map.put("name", name);
	   map.put("value", value);
	   return map;
   }
}
