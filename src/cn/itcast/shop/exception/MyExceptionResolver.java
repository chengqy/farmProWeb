package cn.itcast.shop.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * 全局异常处理器
 * 
 * @author cqy
 * 
 */
public class MyExceptionResolver implements HandlerExceptionResolver {

	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		MyException myException = null;
		if (ex instanceof MyException) {
			myException = (MyException) ex;
		} else {
			myException = new MyException("未知错误");
		}
		// 错误信息
		String message = myException.getMessage();
		ModelAndView modelAndView = new ModelAndView();
		// 将错误信息传至页面
		modelAndView.addObject("message", message);
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
