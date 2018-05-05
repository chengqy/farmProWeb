package cn.itcast.shop.exception;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

/**
 * ȫ���쳣������
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
			myException = new MyException("δ֪����");
		}
		// ������Ϣ
		String message = myException.getMessage();
		ModelAndView modelAndView = new ModelAndView();
		// ��������Ϣ����ҳ��
		modelAndView.addObject("message", message);
		modelAndView.setViewName("error");
		return modelAndView;
	}

}
