package com.chengyong.sys.util;

import java.util.List;

import com.chengyong.sys.entity.SysUsers;

public class DataView {
   private Integer code;
   private String msg;
   private Long count;
   private Object data;

	public DataView(Long count, Object list) {
		this.code = 0;
		this.msg = "";
		this.count = count;
		this.data = list;
	}
	
	public DataView(Object list) {
		this.code = 0;
		this.msg = "";
		this.data = list;
	}

	public Integer getCode() {
		return code;
	}

	public void setCode(Integer code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public Long getCount() {
		return count;
	}

	public void setCount(Long count) {
		this.count = count;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

   
}
