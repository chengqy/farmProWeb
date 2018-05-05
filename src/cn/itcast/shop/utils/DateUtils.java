package cn.itcast.shop.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
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
			if (StringUtils.isEmpty(date))
				return null;
			return new SimpleDateFormat(DATE_PATTERN).format(date);
		} catch (Exception e) {
			throw new RuntimeException("�����ַ�[" + date + "]��ʽ������");
		}
	}
	/**
	 * ��ȡһ�쿪ʼʱ��<br>
	 * 
	 * @param date
	 * @return
	 */
	public static Date getDayBegin(Date date) {
		String format = new SimpleDateFormat(DATE_PATTERN).format(date);
		return parseDate(format.concat(" 00:00:00.000"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * ��ȡһ�����ʱ��<br>
	 * 
	 * @param date
	 * @return
	 */
	public static Date getDayEnd(Date date) {
		String format = new SimpleDateFormat(DATE_PATTERN).format(date);
		return parseDate(format.concat(" 23:59:59.999"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * ��ȡ����Ŀ�ʼʱ��
	 * 
	 * @return
	 */
	public static Date getCurrentDayStartTime() {
		String format = new SimpleDateFormat(DATE_PATTERN).format(new Date());
		return parseDate(format.concat(" 00:00:00.000"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * ��ȡ����Ľ���ʱ��
	 * 
	 * @return
	 */
	public static Date getCurrentDayEndTime() {
		String format = new SimpleDateFormat(DATE_PATTERN).format(new Date());
		return parseDate(format.concat(" 23:59:59.999"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * ���n���ʱ��
	 * 
	 * @param date
	 * @param n
	 * @return
	 */
	public static Date getAfterDays(Date date, Integer n) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.add(Calendar.DATE, n);
		return c.getTime();
	}
	
	/**
	 * ��ǰ�¿�ʼʱ��
	 * 
	 * @return
	 */
	public static Date getCurrentMonthStartTime() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, 1);
		String format =  new SimpleDateFormat(DATE_PATTERN).format(c.getTime());
		return parseDate(format.concat(" 00:00:00.000"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * ��ǰ�½���ʱ��
	 * 
	 * @return
	 */
	public static Date getCurrentMonthEndTime() {
		Calendar c = Calendar.getInstance();
		c.set(Calendar.DATE, 1);
		c.add(Calendar.MONTH, 1);
		c.add(Calendar.DATE, -1);
		String format =new SimpleDateFormat(DATE_PATTERN).format(c.getTime());
		return parseDate(format.concat(" 23:59:59.999"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * �¿�ʼʱ��
	 * 
	 * @return
	 */
	public static Date getMonthStartTime(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DATE, 1);
		String format = new SimpleDateFormat(DATE_PATTERN).format(c.getTime());
		return parseDate(format.concat(" 00:00:00.000"), DATE_PATTERN + " HH:mm:ss.SSS");
	}

	/**
	 * �½���ʱ��
	 * 
	 * @return
	 */
	public static Date getMonthEndTime(Date date) {
		Calendar c = Calendar.getInstance();
		c.setTime(date);
		c.set(Calendar.DATE, 1);
		c.add(Calendar.MONTH, 1);
		c.add(Calendar.DATE, -1);
		String format = new SimpleDateFormat(DATE_PATTERN).format(c.getTime());
		return parseDate(format.concat(" 23:59:59.999"), DATE_PATTERN + " HH:mm:ss.SSS");
	}
	/**  
     * ������������֮����������  
     * @param smdate ��С��ʱ�� 
     * @param bdate  �ϴ��ʱ�� 
     * @return ������� 
     * @throws ParseException  
     */    
    public static int daysBetween(Date smdate,Date bdate) throws Exception    
    {    
        SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");  
        smdate=sdf.parse(sdf.format(smdate));  
        bdate=sdf.parse(sdf.format(bdate));  
        Calendar cal = Calendar.getInstance();    
        cal.setTime(smdate);    
        long time1 = cal.getTimeInMillis();                 
        cal.setTime(bdate);    
        long time2 = cal.getTimeInMillis();         
        long between_days=(time2-time1)/(1000*3600*24);  
            
       return Integer.parseInt(String.valueOf(between_days));           
    } 
}
