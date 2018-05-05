package cn.itcast.shop.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.util.StringUtils;

public class MyStringUtils {

	/**
	 * 判断字符串是否为空
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isEmpty(String str) {
		if (str == null || str.equals(""))
			return true;
		else
			return false;
	}

	/**
	 * 手机号加密
	 * 
	 * @param phone
	 *            手机号
	 */
	public static String encrypt(String phone) {
		String result =phone.substring(0, 3)+"****"+phone.substring(7,phone.length());
		return result;
	}

	/**
	 * list转换字符串
	 * 
	 * @param list
	 * @return
	 */

	public static String toString(List<String> list) {
		if (list == null || list.size() < 0) {
			return null;
		}
		StringBuffer result = new StringBuffer();
		for (String str : list) {
			result.append(str).append(",");
		}
		result.deleteCharAt(result.length() - 1);
		return result.toString();
	}

	/**
	 * 将字符串用','分割
	 * 
	 * @param str
	 * @return
	 */
	public static List<String> toList(String str) {
		if (StringUtils.isEmpty(str)) {
			return null;
		}
		String[] result = str.split(",");
		return Arrays.asList(result);
	}

}
