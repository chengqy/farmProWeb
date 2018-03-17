package cn.itcast.shop.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.util.StringUtils;

public class DateUtils {
	public static final String DATE_PATTERN = "yyyy-MM-dd";
	public static final String TIMESTAMP_PATTERN = "yyyy-MM-dd HH:mm:ss";

	/**
	 * ���������ַ���ת�������ڸ�ʽ<br>
	 * 
	 * @param dateStr
	 * @param pattern
	 * @return
	 */
	public static Date parseDate(String dateStr, String pattern) {
		try {
			SimpleDateFormat format = null;
			if (StringUtils.isEmpty(dateStr))
				return null;
			if (!StringUtils.isEmpty(pattern)) {
				format = new SimpleDateFormat(pattern);
				return format.parse(dateStr);
			}
			return new SimpleDateFormat(DATE_PATTERN).parse(dateStr);
		} catch (Exception e) {
			throw new RuntimeException("�޷����������ַ�[" + dateStr + "]");
		}
	}

	/**
	 * ���������ַ���ת�������ڸ�ʽ<br>
	 * 
	 * @param dateStr
	 * @return
	 */
	public static Date parseDate(String dateStr) {
		try {
			if (StringUtils.isEmpty(dateStr))
				return null;
			return new SimpleDateFormat(DATE_PATTERN).parse(dateStr);
		} catch (Exception e) {
			throw new RuntimeException("�޷����������ַ�[" + dateStr + "]");
		}
	}

	/**
	 * ���ڸ�ʽ��
	 * 
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String parseDate(Date date, String pattern) {
		try {
			SimpleDateFormat format = null;
			if (StringUtils.isEmpty(date))
				return null;
			if (!StringUtils.isEmpty(pattern)) {
				format = new SimpleDateFormat(pattern);
				return format.format(date);
			}
			return new SimpleDateFormat(DATE_PATTERN).format(date);
		} catch (Exception e) {
			throw new RuntimeException("�����ַ�[" + date + "]��ʽ������");
		}
	}

	/**
	 * ���ڸ�ʽ��
	 * 
	 * @param date
	 * @param pattern
	 * @return
	 */
	public static String parseDate(Date date) {
		try {
			SimpleDateFormat format = null;
			if (StringUtils.isEmpty(date))
				return null;
			return new SimpleDateFormat(DATE_PATTERN).format(date);
		} catch (Exception e) {
			throw new RuntimeException("�����ַ�[" + date + "]��ʽ������");
		}
	}
}
