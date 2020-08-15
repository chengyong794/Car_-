package com.chengyong.sys.util;

import com.chengyong.sys.entity.SysUsers;

public class SysUsersVo extends SysUsers{

   private Short userid;
	
   private Short ids[];
   
   private String oldPwd;
   private String agNewPwd;
   private String newPwd;
   

public String getOldPwd() {
	return oldPwd;
}

public void setOldPwd(String oldPwd) {
	this.oldPwd = oldPwd;
}

public String getAgNewPwd() {
	return agNewPwd;
}

public void setAgNewPwd(String agNewPwd) {
	this.agNewPwd = agNewPwd;
}

public String getNewPwd() {
	return newPwd;
}

public void setNewPwd(String newPwd) {
	this.newPwd = newPwd;
}

public Short getUserid() {
	return userid;
}

public void setUserid(Short userid) {
	this.userid = userid;
}

public Short[] getIds() {
	return ids;
}

public void setIds(Short[] ids) {
	this.ids = ids;
}
   
   
}
