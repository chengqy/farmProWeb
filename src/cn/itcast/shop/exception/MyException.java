package cn.itcast.shop.exception;

/**
 * �Զ����쳣��
 * 
 * @author cqy
 * 
 */
public class MyException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	// �쳣��Ϣ
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
