<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/login.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
 <div class="header_top">
   <div class="body_width"><i>欢迎进入121金融个人理财中心</i><span>李东伟【普通会员】 | 我的121金融 | 安全退出</span></div></div>
<div id="top"><div class="main_top"><a href="index.html"><img src="<%=request.getContextPath() %>/images/index_03.jpg" width="408" height="50" /></a></div></div>
<!---TOP结束---->
<div id="main_body">
<div id="title_xi"></div>
<div id="title_font">121金融网站会员登录</div>
<div class="register">
<div class="info_frm">
<form id="loginForm">
<table>
              <tbody><tr>
                <td class="t" width="15%">您的帐号： </td>
                <td width="85%"><input maxlength="11" id="userName" name="userName" class="itstyle lt it log_user" type="text"  value="请输入手机号或会员名" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" ><div class="input-r-tips lt"></div></td>
              </tr>
              <tr>
                <td class="t">登录密码：</td>
                <td><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password"><div class="input-r-tips"></div></td>
              </tr>
              <tr>
                <td></td>
                <td>
                  <span class="bnt_ok">立即登陆</span>
                </td>
              </tr>
            </tbody></table>
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
