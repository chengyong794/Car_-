package com.chengyong.car.util;

import java.io.File;

import javax.servlet.http.HttpServletRequest;

/**
 * 汽车图片上传，工具类
 * @author PC
 *
 */
public class FileUtil {
	/**
	 * 修改图片的后缀名称
	 * @param suffix
	 * @param request
	 * @return
	 */
    public static String FileUpdate(String suffix,HttpServletRequest request) {
    	String GML_PATH = (String)request.getSession().getAttribute("GML_PATH");
    	String XM_PATH = (String)request.getSession().getAttribute("XM_PATH");
    	if(GML_PATH!=null) {
    		String Carpic = XM_PATH.replace(suffix,""); //如果进行添加修改操作 实现了保存那么就 要去掉temp
        	File f = new File(GML_PATH); //获得该 刚刚上传的汽车图片文件地址
        	try {
    			if(f.exists()) {  //如果该路径存在 那么就替换掉该 带有后缀的文件
    				f.renameTo(new File(GML_PATH.replace(suffix,""))); //替换掉该路径下的文件
    			}
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
        	return Carpic;
    	}else {
    		return null;
    	}
    	
    }
    
    /**
     * 删除指定路径下的图片
     * @param carimg
     */
    public static  void removeFileByPath(String carimg){
        try{
            File file = new File(carimg);
            if(file.exists()){
                file.delete();
            }
        }catch (Exception e){
            System.out.println(e);
        }
    }
    
}
