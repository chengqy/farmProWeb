package cn.itcast.shop.pojo;

import java.util.HashMap;
import java.util.Map;

public class UserValidatorParam {
	private String phone;
	private String code;
	private String password;
	private String password2;
	// �����Ա����errors,���ڷ�װ����֤ʱ�Ĵ�����Ϣ
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
			errors.put("phone", "�������ֻ���");
			flag = false;
		} else if (!phone
				.matches("^((13[0-9])|(14[5|7])|(15([0-3]|[5-9]))|(18[0,5-9]))\\d{8}$")) {
			errors.put("phone", "��������ȷ�ֻ�����.");
			flag = false;
		}else if (code == null || code.trim().equals("")) {
			errors.put("code", "��������֤��");
			flag = false;
		}
		if (password == null || password.trim().equals("")) {
			errors.put("password", "����������.");
			flag = false;
		} else if (!password.matches("^[\\da-zA-Z]{6,10}$")) {
			errors.put("password", "������6-12�������ֺ�Ӣ����ĸ��ɵ��ַ�.");
			flag = false;
		}
		if (password != null && !password.equals(password2)) {
			errors.put("password2", "������������벻ƥ��.");
			flag = false;
		}
		return flag;
	}

	public Map<String, String> getErrors() {
		return errors;
	}

	// ��Map����errors����Ӵ�����Ϣ
	public void setErrorMsg(String err, String errMsg) {
		if ((err != null) && (errMsg != null)) {
			errors.put(err, errMsg);
		}
	}
}
