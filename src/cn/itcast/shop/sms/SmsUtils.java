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
	 * �������6λ������Ϊ��֤��
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

		System.setProperty("sun.net.client.defaultConnectTimeout", "10000");// �����޸�
		System.setProperty("sun.net.client.defaultReadTimeout", "10000");// �����޸�
		IClientProfile profile = DefaultProfile.getProfile("cn-hangzhou",
				accessKey, secret);// "***"�ֱ���д�Լ���AccessKey ID��Secret
		DefaultProfile.addEndpoint("cn-hangzhou", "cn-hangzhou", "Dysmsapi",
				"dysmsapi.aliyuncs.com");// �����޸�
		IAcsClient acsClient = new DefaultAcsClient(profile);// �����޸�
		SendSmsRequest request = new SendSmsRequest();// �����޸�
		request.setPhoneNumbers(phoneNumber);// ****����д���շ����ֻ�����
		request.setSignName(signName);// �˴���д������Ķ���ǩ��
		request.setTemplateCode(templateCode);// �˴���д��õĶ���ģ��CODE
		request.setTemplateParam("{\"code\":\"" + code + "\"}");// ���ߵĶ���ģ������${code},
																// ��˴˴���Ӧ��д��֤��
		SendSmsResponse sendSmsResponse = acsClient.getAcsResponse(request);// �����޸�
		return sendSmsResponse;

	}
}
