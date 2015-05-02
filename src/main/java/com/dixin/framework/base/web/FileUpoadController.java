package com.dixin.framework.base.web;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.TimeZone;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.dixin.finance.product.vo.PageDataItem;


@Controller
public class FileUpoadController {
	
	@Autowired  
    private HttpServletRequest request;  
	
	/*单文件上传
	 * <form action="fileUpload.html" method="post" enctype="multipart/form-data">  
    	选择文件:<input type="file" name="file">  
    	<input type="submit" value="提交">   
		</form> 
	 */
	@RequestMapping(value = "/fileupload", method = RequestMethod.POST)  
    public String handleFormUpload(@RequestParam("file") MultipartFile file) {  
        //MultipartFile是对当前上传的文件的封装，当要同时上传多个文件时，可以给定多个MultipartFile参数  
        if (!file.isEmpty() && !saveFile(request,file).isEmpty()) {  
           return "redirect:uploadSuccess";  
       } else {  
           return "redirect:uploadFailure";  
       }  
    }  
	
	/*
	 * 多文件上传
	 * <form action="filesUpload.html" method="post"  
        enctype="multipart/form-data">  
        <p>  
            选择文件:<input type="file" name="files">  
        <p>  
            选择文件:<input type="file" name="files">  
        <p>  
            选择文件:<input type="file" name="files">  
        <p>  
            <input type="submit" value="提交">  
    </form>  
	 */
	   @RequestMapping("/filesupload")  
	    public @ResponseBody BaseWebResult filesUpload(@RequestParam("files") MultipartFile[] files) {  
		   BaseWebResult webResult = new BaseWebResult();
		   List<String> result = new ArrayList<String>();
	        
	        //判断file数组不能为空并且长度大于0  
	        if(files!=null&&files.length>0){  
	            //循环获取file数组中得文件  
	            for(int i = 0;i<files.length;i++){  
	                MultipartFile file = files[i];  
	                //保存文件  
	                String filename = saveFile(request,file); 
	                result.add(filename);
	            }  
	        }
	        
	        webResult.setSuccess(true);
	        webResult.setResult(result);
	        return webResult;  
	    } 	
	   
	   
	   public static String saveFile(HttpServletRequest request,MultipartFile file) {  
	        String token = UUID.randomUUID().toString();
	        // 判断文件是否为空  
	        if (!file.isEmpty()) {  
	            try {  
	                // 文件保存路径  
	                String rootPath = request.getSession().getServletContext().getRealPath("/") ;
	                String fileName = "upload/" + token +  file.getOriginalFilename();
	                String filePath = rootPath + fileName;
	                // 转存文件  
	                file.transferTo(new File(filePath));  
	                
	                return fileName;  
	            } catch (Exception e) {  
	                e.printStackTrace();  
	            }  
	        }  
	        
	        return "";  
	    }
	   
	   @RequestMapping("/list")  
	    public ModelAndView list() {  
	        String filePath = request.getSession().getServletContext().getRealPath("/") + "upload/";  
	        ModelAndView mav = new ModelAndView("list");  
	        File uploadDest = new File(filePath);  
	        String[] fileNames = uploadDest.list();  
	        for (int i = 0; i < fileNames.length; i++) {  
	            //打印出文件名  
	            System.out.println(fileNames[i]);  
	        }  
	        return mav;  
	    }  
}
