package com.chengyong.car.servicesimpl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.chengyong.car.entity.CarRent;
import com.chengyong.car.mapper.CarRentMapper;
import com.chengyong.car.services.CarRentService;
import com.chengyong.car.util.ExcelFileGenerator;
import com.chengyong.sys.util.DataView;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

@Service
public class CarRentServiceImpl implements CarRentService{
	@Autowired
	private CarRentMapper carRentMapper;

	@Override
	public int deleteByPrimaryKey(String rentid) {
		return carRentMapper.deleteByPrimaryKey(rentid);
	}

	@Override
	public int insert(CarRent record) {
		record.setRentflag((short)0);
		return carRentMapper.insert(record);
	}

	@Override
	public int insertSelective(CarRent record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public DataView selectByPrimaryKey(CarRent record) {
		Page<Object> page = PageHelper.startPage(record.getPage(),record.getLimit());
		List<CarRent> list = carRentMapper.selectByPrimaryKey(record);
		PageInfo<CarRent> info = new PageInfo<CarRent>(list);
		return new DataView(info.getTotal(),list);
	}

	@Override
	public int updateByPrimaryKeySelective(CarRent record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateByPrimaryKey(CarRent record) {
		return carRentMapper.updateByPrimaryKey(record);
	}

	@Override
	public CarRent selectByRentid(String rentid) {
		return carRentMapper.selectByRentid(rentid);
	}

	@Override
	public CarRent carRentexport(String rentid,HttpServletResponse response){
		CarRent carRent = carRentMapper.selectByRentid(rentid);
		//组装 数据
		  ArrayList<String> fileName = new ArrayList<String>();
		  fileName.add("出租单号");
		  fileName.add("身份证");
		  fileName.add("车牌号");
		  fileName.add("起租时间");
		  fileName.add("还车时间");
		  fileName.add("出租价格");
		  ArrayList<ArrayList<String>> fieldData = new ArrayList<ArrayList<String>>();
		  ArrayList<String> cRent = new ArrayList<String>();
		  cRent.add(carRent.getRentid());
		  cRent.add(carRent.getCusIdentity());
		  cRent.add(carRent.getCarNumber());
		  cRent.add(carRent.getStartdate());
		  cRent.add(carRent.getReturndate());
		  cRent.add(String.valueOf(carRent.getPrice()));
		  fieldData.add(cRent);
		  ExcelFileGenerator export = new ExcelFileGenerator(fileName,fieldData);
		  
		  //xls文件的 导出流
		SimpleDateFormat format = new SimpleDateFormat("yyyy:MM:dd HH:mm:ss");
		Date date = new Date();
		String time = format.format(date);
		
		String xlsfile = time+"出租数据.xls";
		try {
			xlsfile = new String(xlsfile.getBytes("utf-8"),"iso-8859-1");
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-disposition", "attachment;filename="+xlsfile);
			
			//获取 response 的输出流
			OutputStream out = response.getOutputStream();
			//然后导出生成下载
			export.expordExcel(out);
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}
  
}
