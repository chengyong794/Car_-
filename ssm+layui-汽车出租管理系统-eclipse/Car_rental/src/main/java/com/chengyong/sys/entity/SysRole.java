package com.chengyong.sys.entity;

public class SysRole {
    private Short roleid;

    private String rolename;

    private String roledesc;
    
    private Short roletype;
    
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

	public Short getRoletype() {
		return roletype;
	}

	public void setRoletype(Short roletype) {
		this.roletype = roletype;
	}

	public Short getRoleid() {
        return roleid;
    }

    public void setRoleid(Short roleid) {
        this.roleid = roleid;
    }

    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    public String getRoledesc() {
        return roledesc;
    }

    public void setRoledesc(String roledesc) {
        this.roledesc = roledesc;
    }
}