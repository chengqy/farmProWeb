package cn.itcast.shop.exception;

/**
 * 自定义异常类
 * 
 * @author cqy
 * 
 */
public class MyException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// 异常信息
	public String message;

	public MyException(String message) {
		super(message);
		this.message = message;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

}
