package com.chengyong.advice;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@Component
@ControllerAdvice
public class HandlerControllerException{

//	@ExceptionHandler(AccessDeniedException.class)
//	public String handlerException() {
//		return "redirect:/403.jsp";
//	}
//	
//	
//	@ExceptionHandler(RuntimeException.class)
//	public String runtimehandlerException() {
//		return "redirect:/500.jsp";
//	}
	
	//--------------------------上下是两种方法--------------------------------------------------------------------
	
	// 继承接口  HandlerExceptionResolver 实现该方法
//	/**
//	 * handler 出现异常的对象
//	 * ex 出现的异常信息
//	 */
//	@Override
//	public ModelAndView resolveException(HttpServletRequest request, HttpServletResponse response, Object handler,
//			Exception ex) {
//		ModelAndView mod = new ModelAndView();
//		if(ex instanceof AccessDeniedException) {
//			mod.setViewName("redirect:/403.jsp");
//		}else {
//			mod.setViewName("redirect:/500.jsp");
//		}
//		return mod;
//	}

}
