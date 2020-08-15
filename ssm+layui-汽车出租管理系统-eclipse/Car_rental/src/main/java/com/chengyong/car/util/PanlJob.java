package com.chengyong.car.util;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.chengyong.car.services.JobService;

/**
 * 定时任务 定时删除汽车图片
 * @author PC
 *
 */
@Component
public class PanlJob{
	@Autowired
	private JobService jobService;

	public void clearCarPic() {
		jobService.clearCarPic();
	}

}
