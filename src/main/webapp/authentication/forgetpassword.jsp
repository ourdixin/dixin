<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>忘记密码</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/forgetpassword.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
	<div class="wrap">
    	<div class="maintitle">
     		<div id="title_font">忘记密码</div>
     		<div class="dqwz">当前位置：<a href="<%=request.getContextPath()%>/">首页</a> &gt; 忘记密码</div>
   		</div>
	<div class="table_c">
<form action="" method="post" id="forgetpasswordForm">
  <table>
    <tbody>
      <tr>
        <td width="31%" height="52" align="right">手机号码： </td>
        <td width="69%"><input maxlength="11" id="mobile" name="mobile" class="itstyle lt it log_user" type="text"  value="请输入手机号或会员名" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}" />          <div class="input-r-tips lt"></div></td>
      </tr>
       <tr>
           <td align="right" class="t">图形验证码：</td>
           <td><input maxlength="6" class="itstyle lt it" id="randCode" name="randCode" style="width:100px;" type="text"><div class="code_box"><div class="dis_getcode lt"><img id="randCodeImg" src="<%=request.getContextPath() %>/authentication/getPic" /></div></td>
         </tr>
         <tr>
      		<td height="52" align="right" class="t">短信验证码：</td>
           <td><input maxlength="6" class="itstyle lt it" id="verifyCode" name="verifyCode" style="width:100px;" type="text"><div class="dis_getcode lt" id="getVerifyCode"><label>获取验证码</label></div><div class="input-r-tips lt"></div></td>
         </tr>
      <tr>
        <td height="52" align="right">请重置您的登录密码：</td>
        <td><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password" />
          <div class="input-r-tips"></div>
          密码由6-12位字符组成，区分大小写。</td>
      </tr>
      <tr>
        <td height="52" align="right">密码强度：</td>
        <td id="level" class="pw-defule"><div class="pw-bar"></div></td>
      </tr>
      <tr>
        <td height="52" align="right">重新输入：</td>
        <td><input maxlength="12" class="itstyle lt it" id="rpassword" name="rpassword"type="password" />
          <div class="input-r-tips"></div></td>
      </tr>
      <tr>
        <td height="60"></td>
        <td><span class="bnt_ok">确定</span></td>
      </tr>
    </tbody>
    </table>
</form>
</div>

</div>


<br class=" clear" />
</div>


<!---foot底部---->
<div class="footer">
<div class="footer_text">21金融 Copyright © 2014  All rights reserved  | 京ICP证20158984号  |  使用121金融前必读 </div>

</div>
<!---foot底部结束---->
</body>
</html>
