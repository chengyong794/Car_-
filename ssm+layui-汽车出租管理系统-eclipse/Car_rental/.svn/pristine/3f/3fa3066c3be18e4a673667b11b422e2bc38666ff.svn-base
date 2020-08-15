package com.chengyong.car.util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class DateRandm {
    public static String dateRandm() {
    	SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmssSSS");
    	Date date = new Date();
    	String time = format.format(date);
    	Random rand = new Random();
    	Integer r = rand.nextInt(10000)+999;
    	return time+r;
    }
}
