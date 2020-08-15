package com.chengyong.sys.util;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SysLogInfoVo {
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
   private String endtime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss",timezone="GMT+8")
   private String starttime;
	
   private Integer page;
   
   private Integer limit;
   
   



public Integer getPage() {
	return page;
}

public void setPage(Integer page) {
	this.page = page;
}

public Integer getLimit() {
	return limit;
}

public void setLimit(Integer limit) {
	this.limit = limit;
}

public String getEndtime() {
	return endtime;
}

public void setEndtime(String endtime) {
	this.endtime = endtime;
}

public String getStarttime() {
	return starttime;
}

public void setStarttime(String starttime) {
	this.starttime = starttime;
}


   
}
