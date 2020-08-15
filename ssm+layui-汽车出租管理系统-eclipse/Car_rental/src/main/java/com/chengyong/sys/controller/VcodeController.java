package com.chengyong.sys.controller;

import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.map.HashedMap;
import org.apache.poi.util.Removal;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.chengyong.sys.util.CpachaUtil;

@Controller
@RequestMapping("code/")
public class VcodeController {
   
	@RequestMapping("vcode")
	public void vcode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		CpachaUtil  cpachaUtil = new CpachaUtil(4,116,36); //使用验证码工具类设置大小
		String vcode = cpachaUtil.generatorVCode();  // 生成字母
		
		request.getSession().setAttribute("code", vcode);
		
		BufferedImage generatorVCodeImage = cpachaUtil.generatorVCodeImage(vcode, true);  //生成图片将字母 写入图片，并且加斜线
		//将图片发送给前端页面,1.要发送的图片，2.发送的图片格式，3.发送
		ImageIO.write(generatorVCodeImage, "png", response.getOutputStream());
	}
	
	/*
	 * 验证前台输入验证码是否正确
	 */
	@RequestMapping("codeValid")
	@ResponseBody
	public Map<String,Object> codeValid(@RequestParam("code") String code,HttpServletRequest request) {
		String c = (String)request.getSession().getAttribute("code");
		Map<String,Object> map = new HashedMap<String, Object>();
		if(code.toUpperCase().equals(c.toUpperCase())) {
			
			map.put("msg", 1);
		}else {
			map.put("msg", "验证码错误");
		}
		
		return map;
	}
}
