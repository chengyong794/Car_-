package com.chengyong.sys.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.chengyong.sys.util.PageHelper;
import com.chengyong.sys.util.SysLogInfoVo;
import com.fasterxml.jackson.annotation.JsonFormat;

public class SysLogLogin extends SysLogInfoVo{
    private Short loginid;

    private String loginname;

    private String loginip;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss") //接收前台的时间格式发送到后台
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss") //接收后台的时间格式发送给前台,北京时间 东八区 timezone=”GMT+8” 
    private Date logintime;
    
    private Short[] ids;

    public Short[] getIds() {
    	return ids;
    }

    public void setIds(Short[] ids) {
    	this.ids = ids;
    }

    public Short getLoginid() {
        return loginid;
    }

    public void setLoginid(Short loginid) {
        this.loginid = loginid;
    }

    public String getLoginname() {
        return loginname;
    }

    public void setLoginname(String loginname) {
        this.loginname = loginname;
    }

    public String getLoginip() {
        return loginip;
    }

    public void setLoginip(String loginip) {
        this.loginip = loginip;
    }

	public Date getLogintime() {
		return logintime;
	}

	public void setLogintime(Date logintime) {
		this.logintime = logintime;
	}




}