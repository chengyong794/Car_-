package com.chengyong.car.util;

import java.io.File;

public class ClearCarPic {
	 /**
     * 定时删除图片
     * @param file
     */
    public static void deleteFile(File file){
      if(null!=file){
          File[] listFile = file.listFiles(); //获取文件的集合该文件夹下所有文件
          if(null!=listFile&&listFile.length>0){
              for (File f:listFile) { //遍历文件
                  if(f.isFile()){ //如果是文件就进行判断
                      if(f.getName().endsWith(Publicvalue.Carpic)){
                          f.delete();
                      }
                  }else{//否则，如果是文件夹的情况下 ，进行递归
                      deleteFile(f);
                  }
              }
          }
      }
    }
}
