package com.chengyong.car.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.chengyong.sys.util.DataView;

/**
 * 车辆图片上传
 * @author PC
 *
 */
@Controller
@RequestMapping("upload/")
@Secured({"ROLE_BUSINESS","ROLE_SUPER"})
public class FileUpLoadController {
	
   @RequestMapping("FileUpLoad")	
   @ResponseBody
   public Map<String,Object> FileUpLoad(MultipartFile mf,HttpServletRequest request) throws IOException{
	   Map<String,Object> map = new HashMap<String,Object>();
	 //获取文件类型
	 		String fileType = mf.getOriginalFilename().substring(mf.getOriginalFilename().lastIndexOf(".")+1,mf.getOriginalFilename().length());
	 		//获取项目本身的地址根目录
	 		String path = "D:\\upload";

	 		InputStream in = mf.getInputStream();
	 		File file = new File(path);
	 		//如果这个文件夹不存在就创建一个
//	 		if(!file.exists()){
//	 			file.mkdir();
//	 		}
	 		String filename = new Date().getTime()+"."+fileType+"_temp";
	 		OutputStream out = new FileOutputStream(file+"\\"+filename);
	 		byte[] b = new byte[1024];
	 		int len = 0;
	 		while((len=in.read(b))!=-1){
	 			out.write(b, 0, len);
	 		}
	 		in.close();
	 		out.close();
	 		map.put("src", "/CarImg/"+filename);
	 		request.getSession().setAttribute("GML_PATH",path+"\\"+filename); //如果 上传汽车图片没有保存 那么就会加上后缀
	 		request.getSession().setAttribute("XM_PATH","/CarImg/"+filename); //tomcat下的虚拟路径 不然图片无法显示
	 		return map;
   }
}
