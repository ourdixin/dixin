package com.dixin.finance.tools;

import java.io.UnsupportedEncodingException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component("configInfo")
public class ConfigInfo {
    @Value("${sms.url}")
    private String smsUrl;

    @Value("${sms.account}")
    private String smsAccount;
        
    @Value("${sms.password}")
    private String smsPassword;
    
    @Value("${sms.sign}")
    private String smsSign;

	public String getSmsUrl() {
		return smsUrl;
	}

	public String getSmsAccount() {
		return smsAccount;
	}
	public String getSmsPassword() {
		return smsPassword;
	}

	public String getSmsSign() {
		byte[] bs = smsSign.getBytes();
		   //用新的字符编码生成字符串
		   try {
			return new String(bs, "GBK");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return smsSign;
	}
    
}