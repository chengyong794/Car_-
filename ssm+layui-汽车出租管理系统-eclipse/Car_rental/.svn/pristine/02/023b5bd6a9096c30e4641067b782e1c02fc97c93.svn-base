package com.chengyong.sys.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chengyong.sys.entity.SysUsers;
import com.chengyong.sys.service.SysUsersService;

/**
 * 用户头像上传
 * @author PC
 *
 */
@Controller
@RequestMapping("headUpload/")
@Secured({"ROLE_SYS","ROLE_SUPER"})
public class HeadFielUpLoadController {
	@Autowired
	private SysUsersService sysUsersService;
	
	@RequestMapping("headFileUpLoad")	
	   @ResponseBody
	   public Map<String,Object> FileUpLoad(MultipartFile mf,@RequestParam("logname")String logname,HttpServletRequest request) throws IOException{
		   Map<String,Object> map = new HashMap<String,Object>();
		 //获取文件类型
		 		String fileType = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".")+1,mf.getOriginalFilename().length());
		 		//获取项目本身的地址根目录
		 		String path = "D:\\carRentHeadPic";

		 		InputStream in = mf.getInputStream();
		 		File file = new File(path);
		 		//如果这个文件夹不存在就创建一个
//		 		if(!file.exists()){
//		 			file.mkdir();
//		 		}
		 		String filename = new Date().getTime()+"."+fileType;
		 		OutputStream out = new FileOutputStream(file+"\\"+filename);
		 		byte[] b = new byte[1024];
		 		int len = 0;
		 		while((len=in.read(b))!=-1){
		 			out.write(b, 0, len);
		 		}
		 		in.close();
		 		out.close();
		 		SysUsers sysUsers = new SysUsers();
		 		sysUsers.setHeadpic("/headImg/"+filename);
		 		sysUsers.setLogname(logname);
		 		sysUsersService.uesrHeadPicUpdate(sysUsers);
		 		
		 		map.put("src", "/headImg/"+filename);
		 		return map;
	   }
}
