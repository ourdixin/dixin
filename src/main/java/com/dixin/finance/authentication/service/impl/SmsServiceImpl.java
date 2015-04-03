package com.dixin.finance.authentication.service.impl;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
 






import org.apache.http.NameValuePair;  
import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.ResponseHandler;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.tools.ConfigInfo;

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
     * 执行一个HTTP GET请求，返回请求响应的HTML 
     * 
     * @param url                 请求的URL地址 
     * @param queryString 请求的查询参数,可以为null 
     * @return 返回请求响应的HTML 
     */ 
	
	//发送短信
	
	//发送短信
	public void doPost(String strMsg, String phoneList) { 
		try{
			//发送POST请求
            URL url = new URL(m_configInfo.getSmsUrl());
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded;charset=utf-8");
            conn.setRequestProperty("Connection", "Keep-Alive");
            conn.setUseCaches(false);
            conn.setDoOutput(true);
           	//String postData = "account=" + m_configInfo.getSmsAccount() + "&password=" + m_configInfo.getSmsPassword() + "&phonelist=" + phoneList + "&subject=" + java.net.URLEncoder.encode( strMsg + "【" + m_configInfo.getSmsSign() + "】","utf-8");
           	String postData = "account=" + m_configInfo.getSmsAccount() + "&password=" + m_configInfo.getSmsPassword() + "&phonelist=" + phoneList + "&subject=" + java.net.URLEncoder.encode( strMsg + "【的信金融】","utf-8");
           	System.out.println(postData);
            conn.setRequestProperty("Content-Length", "" + postData.length());
            OutputStreamWriter out = new OutputStreamWriter(conn.getOutputStream(), "UTF-8");
            out.write(postData.toString());
            out.flush();
            out.close();

            //获取响应状态
            if (conn.getResponseCode() != HttpURLConnection.HTTP_OK) {
                System.out.println("connect failed!");
            }
            //获取响应内容体
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
                strMsg += "【121金融】";
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
