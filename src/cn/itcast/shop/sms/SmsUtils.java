package cn.itcast.shop.sms;

import java.io.BufferedInputStream;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import org.junit.Test;

import com.aliyuncs.DefaultAcsClient;
import com.aliyuncs.IAcsClient;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsRequest;
import com.aliyuncs.dysmsapi.model.v20170525.SendSmsResponse;
import com.aliyuncs.profile.DefaultProfile;
import com.aliyuncs.profile.IClientProfile;

public class SmsUtils {
	/**
	 * 随机生成6位数字作为验证码
	 * 
	 * @return
	 */
	public static String getCode() {
		int code = (int) (Math.random() * 9000 + 100000);
		return code + "";
	}

	public static SendSmsResponse sendSms(String phoneNumber, String code)
			throws Exception {
		InputStream in = new BufferedInputStream(new FileInputStream(
				"../webapps/farmProShop/WEB-INF/classes/sms.properties"));
		Properties p = new Properties();
		p.load(new InputStreamReader(in, "GBK"));
		String accessKey = p.getProperty("ACCESS_KEY_ID");
		String secret = p.getProperty("SECRET");
		String signName = p.getProperty("signName");
		String templateCode = p.getProperty("templateCode");

		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");// 不必修改
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");// 不必修改
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou",
				accessKey, secret);// "***"分别填写自己的AccessKey ID和Secret
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi",
				"dysmsapi.aliyuncs.com");// 不必修改
		IAcsClient acsClient = new DefaultAcsClient(profile);// 不必修改
		SendSmsRequest request = new SendSmsRequest();// 不必修改
		request.setPhoneNumbers(phoneNumber);// ****处填写接收方的手机号码
		request.setSignName(signName);// 此处填写已申请的短信签名
		request.setTemplateCode(templateCode);// 此处填写获得的短信模版CODE
		request.setTemplateParam("{\"code\":\"" + code + "\"}");// 笔者的短信模版中有${code},
																// 因此此处对应填写验证码
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);// 不必修改
		return sendSmsResponse;

	}
}
