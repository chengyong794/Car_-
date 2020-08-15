package com.chengyong.car.servicesimpl;

import java.io.File;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.chengyong.car.services.JobService;
import com.chengyong.car.util.ClearCarPic;

//定时删除图片
@Service
public class JobServiceImpl implements JobService{

	public void clearCarPic() {
		File file= new File("D:\\upload");
		ClearCarPic.deleteFile(file);
	}

}
