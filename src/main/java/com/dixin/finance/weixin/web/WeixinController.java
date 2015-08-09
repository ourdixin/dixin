package com.dixin.finance.weixin.web;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.ServletInputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dixin.finance.authentication.constant.UserTypeConstant;
import com.dixin.finance.authentication.service.IAreaService;
import com.dixin.finance.authentication.service.IAsmService;
import com.dixin.finance.authentication.service.IFinService;
import com.dixin.finance.authentication.service.IFmrService;
import com.dixin.finance.authentication.service.ISmsService;
import com.dixin.finance.authentication.service.IUserService;
import com.dixin.finance.authentication.vo.UserInfo;
import com.dixin.finance.authentication.vo.UserVO;
import com.dixin.finance.product.constant.ProfitTypeConstant;
import com.dixin.finance.product.service.IMessageService;
import com.dixin.finance.product.service.IPurchaseService;
import com.dixin.finance.product.vo.AssignmentVO;
import com.dixin.finance.product.vo.MessageVO;
import com.dixin.finance.product.vo.PurchaseVO;
import com.dixin.finance.product.web.ProductController;
import com.dixin.finance.weixin.constant.WeixinConstant;
import com.dixin.framework.base.web.BaseWebResult;
import com.dixin.framework.constant.WebConstants;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

/**
 * 微信后台
 *
 */
@Controller
public class WeixinController {

	private static final Logger logger = LoggerFactory
			.getLogger(ProductController.class);

	@Resource
	private IUserService userServiceImpl;

	@Resource
	private ISmsService smsServiceImpl;

	@Resource
	private IFmrService fmrServiceImpl;

	@Resource
	private IAsmService asmServiceImpl;

	@Resource
	private IFinService finServiceImpl;

	@Resource
	private IMessageService messageServiceImpl;

	@Resource
	private IAreaService areaServiceImpl;

	@Resource
	private IPurchaseService PurchaseServiceImpl;

	public IPurchaseService getPurchaseServiceImpl() {
		return PurchaseServiceImpl;
	}

	public void setPurchaseServiceImpl(IPurchaseService purchaseServiceImpl) {
		PurchaseServiceImpl = purchaseServiceImpl;
	}

	public IUserService getUserServiceImpl() {
		return userServiceImpl;
	}

	public void setUserServiceImpl(IUserService userServiceImpl) {
		this.userServiceImpl = userServiceImpl;
	}

	public ISmsService getSmsServiceImpl() {
		return smsServiceImpl;
	}

	public void setSmsServiceImpl(ISmsService smsServiceImpl) {
		this.smsServiceImpl = smsServiceImpl;
	}

	public IFmrService getFmrServiceImpl() {
		return fmrServiceImpl;
	}

	public void setFmrServiceImpl(IFmrService fmrServiceImpl) {
		this.fmrServiceImpl = fmrServiceImpl;
	}

	public IAsmService getAsmServiceImpl() {
		return asmServiceImpl;
	}

	public void setAsmServiceImpl(IAsmService asmServiceImpl) {
		this.asmServiceImpl = asmServiceImpl;
	}

	public IFinService getFinServiceImpl() {
		return finServiceImpl;
	}

	public void setFinServiceImpl(IFinService finServiceImpl) {
		this.finServiceImpl = finServiceImpl;
	}

	public IMessageService getMessageServiceImpl() {
		return messageServiceImpl;
	}

	public void setMessageServiceImpl(IMessageService messageServiceImpl) {
		this.messageServiceImpl = messageServiceImpl;
	}

	public IAreaService getAreaServiceImpl() {
		return areaServiceImpl;
	}

	public void setAreaServiceImpl(IAreaService areaServiceImpl) {
		this.areaServiceImpl = areaServiceImpl;
	}

	void ShowParameter(HttpServletRequest request)
	{
		String qs = request.getQueryString();
		logger.info("QueryString=" + qs);
		Map map = request.getParameterMap();
		Set keSet = map.entrySet();
		for (Iterator itr = keSet.iterator(); itr.hasNext();) {
			Map.Entry me = (Map.Entry) itr.next();
			Object ok = me.getKey(); // 获取参数名
			Object ov = me.getValue(); // 获取参数值
			String[] value = new String[1];
			if (ov instanceof String[]) {
				value = (String[]) ov;
			} else {
				value[0] = ov.toString();
			}
			for (int k = 0; k < value.length; k++) {
				logger.info(ok + "=" + value[k]);
			}
		}
	}
	
	@RequestMapping(value = "/weixin")
	public @ResponseBody String weixin(String signature,String echostr,String timestamp,String nonce,HttpSession session, Model model,HttpServletRequest request,HttpServletResponse response) {

		logger.info("微信后台被访问!");
		ShowParameter(request);
		boolean isGet = request.getMethod().toLowerCase().equals("get"); 
		if(isGet)
			logger.info("Get");
		else
			logger.info("Post");
		
		try {
			ServletInputStream in = request.getInputStream();
			StringBuilder xmlMsg = new StringBuilder();  
	        byte[] b = new byte[4096];  
	        for (int n; (n = in.read(b)) != -1;) {  
	            xmlMsg.append(new String(b, 0, n, "UTF-8"));  
	        }
	        
	        logger.info(xmlMsg.toString());
	        
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		if(check_signature(signature,timestamp,nonce))
			return echostr;
		
		return "";
	}

	public String bytesToHexString(byte[] src) {
		StringBuilder stringBuilder = new StringBuilder("");
		if (src == null || src.length <= 0) {
			return null;
		}
		for (int i = 0; i < src.length; i++) {
			int v = src[i] & 0xFF;
			String hv = Integer.toHexString(v);
			if (hv.length() < 2) {
				stringBuilder.append(0);
			}
			stringBuilder.append(hv);
		}
		return stringBuilder.toString();
	}
	
    private byte charToByte(char c) {
        return (byte) "0123456789ABCDEF".indexOf(c);
    }
    
	public byte[] hexStringToBytes(String hexString) {
		if (hexString == null || hexString.equals("")) {
			return null;
		}
		hexString = hexString.toUpperCase();
		int length = hexString.length() / 2;
		char[] hexChars = hexString.toCharArray();
		byte[] d = new byte[length];
		for (int i = 0; i < length; i++) {
			int pos = i * 2;
			d[i] = (byte) (charToByte(hexChars[pos]) << 4 | charToByte(hexChars[pos + 1]));

		}
		return d;
	}

	public boolean check_signature(String signature, String timestamp,String nonce) {
		String[] arr = new String[] { timestamp, nonce, WeixinConstant.token };
		Arrays.sort(arr);
		String s = arr[0] + arr[1] + arr[2];
		byte[] digest = null;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("SHA-1");
			digest = md.digest(s.getBytes("utf-8"));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.info("check_signature Exception:" + e.toString());
		}
		String mySign = bytesToHexString(digest);
		return signature.equals(mySign);
	}
	
}
