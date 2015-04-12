<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/register.js"></script>

</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div id="title_xi"></div>
<div id="title_font">忘记密码</div>
<div class="register">
<div class="info_frm">
<form action="<%=request.getContextPath() %>/authentication/user" method="post" id="regForm">
  <table>
    <tbody>
      <tr>
        <td class="t" width="21%">手机号码： </td>
        <td width="79%"><input maxlength="11" id="mobile" name="mobile" class="itstyle lt it log_user" type="text"  value="请输入手机号或会员名" onfocus="if(value==defaultValue){value='';this.style.color='#999'}" onblur="if(!value){value=defaultValue;this.style.color='#999'}" />          <div class="input-r-tips lt"></div></td>
      </tr>
      <tr>
        <td class="t">验证码：</td>
        <td><input maxlength="6" class="itstyle lt it" id="verifyCode" name="verifyCode" style="width:100px;" type="text" />
          <div class="dis_getcode lt" id="getVerifyCode">
            <label>获取验证码</label>
          </div>
          <div class="input-r-tips lt"></div></td>
      </tr>
      <tr>
        <td class="t">请重置您的登录密码：</td>
        <td><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password" />
          <div class="input-r-tips"></div>
          密码由6-12位字符组成，区分大小写。</td>
      </tr>
      <tr>
        <td class="t">密码强度：</td>
        <td id="level" class="pw-defule"><div class="pw-bar"></div></td>
      </tr>
      <tr>
        <td class="t">重新输入：</td>
        <td><input maxlength="12" class="itstyle lt it" id="rpassword" value="" type="password" />
          <div class="input-r-tips"></div></td>
      </tr>
      <tr>
        <td></td>
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
