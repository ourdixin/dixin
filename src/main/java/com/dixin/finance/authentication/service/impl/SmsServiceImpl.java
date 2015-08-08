package com.dixin.finance.authentication.service.impl;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cloopen.rest.sdk.CCPRestSmsSDK;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.framework.tools.ConfigInfo;

@Service
public class SmsServiceImpl implements ISmsService {

	@Autowired
	private  ConfigInfo m_configInfo;
	
	@Override
	public boolean sendSms(String strMsg, List<String> phoneList) {
		
		String phone = new String();
		
		for(int i = 0; i < phoneList.size(); i++)  
        {  
			if( i == 0 )
				phone += phoneList.get(i);  
			else
				phone += "," + phoneList.get(i);
        }
		
		doPost(strMsg , phone);
		
		return true;
	}

	@Override
	public boolean sendMms(String strMsg, List<String> phoneList) {
		// TODO Auto-generated method stub
		return true;
	}

	/** 
     * 鎵ц涓�涓狧TTP GET璇锋眰锛岃繑鍥炶姹傚搷搴旂殑HTML 
     * 
     * @param url                 璇锋眰鐨刄RL鍦板潃 
     * @param queryString 璇锋眰鐨勬煡璇㈠弬鏁�,鍙互涓簄ull 
     * @return 杩斿洖璇锋眰鍝嶅簲鐨凥TML 
     */ 
	
	//鍙戦�佺煭淇�
	
	//鍙戦�佺煭淇�
	public void doPost(String strMsg, String phoneList) { 
		try{
			//鍙戦�丳OST璇锋眰
            URL url = new URL(m_configInfo.getSmsUrl());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setUseCaches(false);
            conn.setDoOutput(true);
           	//String postData = "account=" + m_configInfo.getSmsAccount() + "&password=" + m_configInfo.getSmsPassword() + "&phonelist=" + phoneList + "&subject=" + java.net.URLEncoder.encode( strMsg + "銆�" + m_configInfo.getSmsSign() + "銆�","utf-8");
           	String postData = "account=" + m_configInfo.getSmsAccount() + "&password=" + m_configInfo.getSmsPassword() + "&phonelist=" + phoneList + "&subject=" + java.net.URLEncoder.encode( strMsg + "【9点财讯】","utf-8");
           	System.out.println(postData);
            conn.setRequestProperty("Content-Length", "" + postData.length());
            OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(postData.toString());
            out.flush();
            out.close();

            //鑾峰彇鍝嶅簲鐘舵��
            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                System.out.println("connect failed!");
            }
            //鑾峰彇鍝嶅簲鍐呭浣�
            String line, result = "";
            BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
            while ((line = in.readLine()) != null) {
                result += line + "\n";
            }
            in.close();
            System.out.println(result);  
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	public void sendMessage(String tel,String code,String time) {
		HashMap<String, Object> result = null;

		//初始化SDK
		CCPRestSmsSDK restAPI = new CCPRestSmsSDK();
		
		//******************************注释*********************************************
		//*初始化服务器地址和端口                                                       *
		//*沙盒环境（用于应用开发调试）：restAPI.init("sandboxapp.cloopen.com", "8883");*
		//*生产环境（用户应用上线使用）：restAPI.init("app.cloopen.com", "8883");       *
		//*******************************************************************************
		restAPI.init("sandboxapp.cloopen.com", "8883");
		
		//******************************注释*********************************************
		//*初始化主帐号和主帐号令牌,对应官网开发者主账号下的ACCOUNT SID和AUTH TOKEN     *
		//*ACOUNT SID和AUTH TOKEN在登陆官网后，在“应用-管理控制台”中查看开发者主账号获取*
		//*参数顺序：第一个参数是ACOUNT SID，第二个参数是AUTH TOKEN。                   *
		//*******************************************************************************
		restAPI.setAccount("8a48b5514ee36774014eed4fe09c08bf", "1169245d99aa4db3a561f379b4c3ba53");
		
		
		//******************************注释*********************************************
		//*初始化应用ID                                                                 *
		//*测试开发可使用“测试Demo”的APP ID，正式上线需要使用自己创建的应用的App ID     *
		//*应用ID的获取：登陆官网，在“应用-应用列表”，点击应用名称，看应用详情获取APP ID*
		//*******************************************************************************
		restAPI.setAppId("8a48b5514ee36774014eed59b5f008d2");
		
		
		//******************************注释****************************************************************
		//*调用发送模板短信的接口发送短信                                                                  *
		//*参数顺序说明：                                                                                  *
		//*第一个参数:是要发送的手机号码，可以用逗号分隔，一次最多支持100个手机号                          *
		//*第二个参数:是模板ID，在平台上创建的短信模板的ID值；测试的时候可以使用系统的默认模板，id为1。    *
		//*系统默认模板的内容为“【云通讯】您使用的是云通讯短信模板，您的验证码是{1}，请于{2}分钟内正确输入”*
		//*第三个参数是要替换的内容数组。																														       *
		//**************************************************************************************************
		
		//**************************************举例说明***********************************************************************
		//*假设您用测试Demo的APP ID，则需使用默认模板ID 1，发送手机号是13800000000，传入参数为6532和5，则调用方式为           *
		//*result = restAPI.sendTemplateSMS("13800000000","1" ,new String[]{"6532","5"});																		  *
		//*则13800000000手机号收到的短信内容是：【云通讯】您使用的是云通讯短信模板，您的验证码是6532，请于5分钟内正确输入     *
		//*********************************************************************************************************************
		result = restAPI.sendTemplateSMS(tel,"1" ,new String[]{code,time});
		
		System.out.println("SDKTestGetSubAccounts result=" + result);
		if("000000".equals(result.get("statusCode"))){
			//正常返回输出data包体信息（map）
			HashMap<String,Object> data = (HashMap<String, Object>) result.get("data");
			Set<String> keySet = data.keySet();
			for(String key:keySet){
				Object object = data.get(key);
				System.out.println(key +" = "+object);
			}
		}else{
			//异常返回输出错误码和错误信息
			System.out.println("错误码=" + result.get("statusCode") +" 错误信息= "+result.get("statusMsg"));
		}
	}
	
	//添加验证码
	public String getSMSCode(String tel) {
		String codeRandom = m_configInfo.getSmsCode();
		String time = m_configInfo.getSmsTime();
		String[] array = codeRandom.split(",");
		int a = Integer.parseInt(array[0]);
		int b = Integer.parseInt(array[1]);
		int code = (int)((b-a)*Math.random()+a);
		//发短信
		sendMessage(tel,String.valueOf(code),time);
		return String.valueOf(code);
	}
	
	/*
    public static void doPost(String strMsg, String phoneList) { 
    	CloseableHttpClient httpclient = HttpClients.createDefault();
        try {
            HttpPost httpPost = new HttpPost("http://122.200.77.96/sendSMS");
            CloseableHttpResponse response = null;
        	try {
        		List<NameValuePair> nvps = new ArrayList<NameValuePair>();  
                nvps.add(new BasicNameValuePair("account", "zxzq"));  
                nvps.add(new BasicNameValuePair("password", "zxzq123"));  
                nvps.add(new BasicNameValuePair("phonelist", phoneList));  
                strMsg += "銆�121閲戣瀺銆�";
                nvps.add(new BasicNameValuePair("subject", strMsg)); 
                httpPost.addHeader("Content-Type", "application/x-www-form-urlencoded");
                httpPost.setEntity(new UrlEncodedFormEntity(nvps));  
				response = httpclient.execute(httpPost);
				//EntityUtils.consume(response.getEntity());
			} catch (ClientProtocolException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				try {
					response.close();
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
        	 System.out.println("----------------------------------------");
        	 System.out.println(response.getStatusLine());
        	 System.out.println(response.getEntity());
        	 HttpEntity resEntity = response.getEntity(); 
        	 InputStreamReader reader = null;
			try {
				reader = new InputStreamReader(resEntity.getContent(), "utf-8");
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
             char[] buff = new char[1024]; 
             int length = 0; 
             try {
				while ((length = reader.read(buff)) != -1) { 
				         System.out.println(new String(buff, 0, length)); 
				         //httpclient.getConnectionManager().shutdown(); 
				 }
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} 
        } finally {
            try {
				httpclient.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
        }
    } 	
    */
	
}
