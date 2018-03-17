package cn.itcast.shop.utils;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.util.StringUtils;

public class MyStringUtils {

	/**
	 * �ж��ַ����Ƿ�Ϊ��
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
	 * �ַ������� numΪ�գ�����β�м��ַ���*����
	 * 
	 * @param str
	 *            �ַ���
	 * @param num
	 *            ͷβ����Ҫ���ܵ��ַ�����
	 * @return
	 */
	public static String encrypt(String str, Integer num) {
		String result = str;
		if (num == null) {
			for (int i = 0; i < str.length(); i++) {

				if ((i != 0) && (i != str.length() - 1)) {
					String replace = str.substring(i, i + 1);
					result = result.replace(replace, "*");
				}
			}
		} else {
			for (int i = 0; i < str.length(); i++) {
				if ((i >= num.intValue())
						&& (i < str.length() - num.intValue())) {
					String replace = str.substring(i, i + 1);
					result = result.replace(replace, "*");
				}
			}
		}
		return result;
	}

	/**
	 * listת���ַ���
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
	 * ���ַ�����','�ָ�
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

//	public static void main(String[] args) {
//		String str = "13425438256";
//		String str2 = "saf";
//		String str3 = "fhz";
//		List<String> list = new ArrayList<String>();
//		list.add(str);
//		list.add(str2);
//		list.add(str3);
//		System.out.println(encrypt(str, 3));
//		String res = toString(list);
//		System.out.println(res);
//		for (String strr : toList(res))
//			System.out.println(strr);
//		String str="2018-3-11 10:23:00";
//		Date date1=DateUtils.parseDate(str,DateUtils.TIMESTAMP_PATTERN);
//		Date date2=DateUtils.parseDate("2018-3-11 10:13:24",DateUtils.TIMESTAMP_PATTERN);
//		long min=((date1.getTime()-date2.getTime())/(60*1000));
//		System.out.println(min);
//	}
}
