package cn.itcast.shop.pojo;

import java.util.HashMap;
import java.util.Map;

public class UserValidatorParam {
	private String phone;
	private String code;
	private String password;
	private String password2;
	// 定义成员变量errors,用于封装表单验证时的错误信息
	private Map<String, String> errors = new HashMap<String, String>();

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public boolean validate() {
		boolean flag = true;
		if (phone == null || phone.trim().equals("")) {
			errors.put("phone", "请输入手机号");
			flag = false;
		} else if (!phone
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			errors.put("phone", "请输入正确手机号码.");
			flag = false;
		}else if (code == null || code.trim().equals("")) {
			errors.put("code", "请输入验证码");
			flag = false;
		}
		if (password == null || password.trim().equals("")) {
			errors.put("password", "请输入密码.");
			flag = false;
		} else if (!password.matches("^[\\da-zA-Z]{6,10}$")) {
			errors.put("password", "请输入6-12个由数字和英文字母组成的字符.");
			flag = false;
		}
		if (password != null && !password.equals(password2)) {
			errors.put("password2", "两次输入的密码不匹配.");
			flag = false;
		}
		return flag;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	// 向Map集合errors中添加错误信息
	public void setErrorMsg(String err, String errMsg) {
		if ((err != null) && (errMsg != null)) {
			errors.put(err, errMsg);
		}
	}
}
