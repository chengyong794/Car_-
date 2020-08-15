package com.chengyong.sys.entity;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.chengyong.sys.util.PageHelper;
import com.chengyong.sys.util.SysNewsVo;
import com.fasterxml.jackson.annotation.JsonFormat;

public class SysNews extends SysNewsVo{
    private Short newsid;

    private String title;

    private String content;
    
    @DateTimeFormat(pattern = "yyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyy-MM-dd HH:mm:ss")
    private Date createtime;

    private String opername;

    public Short getNewsid() {
        return newsid;
    }

    public void setNewsid(Short newsid) {
        this.newsid = newsid;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getOpername() {
        return opername;
    }

    public void setOpername(String opername) {
        this.opername = opername;
    }
}