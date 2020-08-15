package com.chengyong.advice;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

/**
 * springmvc的拦截器拦截非法登录
 * @author PC
 *
 */
public class LoginInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Object user = request.getSession().getAttribute("userName");
		if(user==null){
			//添加的拦截
				//Map<String,String> map = new HashMap<String,String>();
				//map.put("type", "error");
				//map.put("msg", "登录状态已经失效，请重新登录!!");
			//response.getWriter().write(JSONObject.fromObject(map).toString());
			response.sendRedirect(request.getContextPath()+"/system/main/login.jsp");
			return false;
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub
		
	}
  
}
