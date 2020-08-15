package com.chengyong.sys.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.chengyong.sys.entity.SysMenus;

@Controller
@RequestMapping("sys/")
public class SysController {
	/**
	 * 公告页面跳转
	 * @return
	 */
	@RequestMapping("desk")
	public String desk() {
		return "system/main/deskManager";
	}
	
	
}
