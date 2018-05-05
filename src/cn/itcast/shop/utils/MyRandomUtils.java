package cn.itcast.shop.utils;

import java.util.Random;

public class MyRandomUtils {
	public static String genRandomNum() {
		int maxNum = 36;
		int i;
		int count = 0;
		char[] str = { 'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K',
				'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W',
				'X', 'Y', 'Z', '0', '1', '2', '3', '4', '5', '6', '7', '8', '9' };
		StringBuffer pwd = new StringBuffer("");
		Random r = new Random();
		while (count < 8) {
			i = Math.abs(r.nextInt(maxNum));
			if (i >= 0 && i < str.length) {
				pwd.append(str[i]);
				count++;
			}
		}
		return pwd.toString();
	}

	/**
	 * 生成num位随机数
	 * 
	 * @param num
	 * @return
	 */
	public static String RandomNumber(int num) {
		if (num <= 0) {
			return null;
		}
		StringBuilder str=new StringBuilder();
		for (int i = 0; i < num; i++) {
			str.append((int) (10 * (Math.random())));
		}
		return str.toString();
	}

}
