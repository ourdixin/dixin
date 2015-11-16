﻿<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<title>9点财讯</title>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/weixin/js/login.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/weixin/css/reg_style.css">
<style type="text/css">
.sourceWrap {
	display: none;
}

.sourceWrap.active {
	display: block;
}

.inviteCode {
	border: 1px solid #ccc;
	border-radius: 5px;
	padding: 10px 5px;
	margin-bottom: 15px;
}

header {
	height: 44px;
	background: url("/page/static/v0.14/images/zt/header.png") no-repeat
		scroll center center #EE3939;
	background-size: auto 50%;
}

.banner {
	border-bottom:3px solid #a12234;
	text-align:center;
	margin:0;
	padding:0;
}
.banner img{border:none;margin:0;padding:0;}
.logo {
	padding-top: 48px;
	float: left;
}

.sloga {
	float: right;
	padding-top: 94px;
}

.bannerImg {
	max-width: 100%;
	display: block;
	margin: 0px auto;
}

.bannerWrap {
	margin: 0px auto;
	display: inline-block;
}

.WrapBox {
	text-align: center;
}

.slider {
	height: 146px;
	overflow: hidden;
}

.slider img {
	max-width: 100%;
}

.focus span {
	width: 10px;
	height: 10px;
	margin-right: 10px;
	border-radius: 50%;
	background: #666;
	font-size: 0
}

.focus span.current {
	background: #fff
}
</style>
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
<script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
</head>

<body class=" hPC" style="padding-bottom: initial;">
<div class="act_wrapper zoom ">
  <div class="act_content">
	<div class="head">登 录</div>
	<div class="tab">
      <ul>
        <li id="normal_login" class="over">普通方式</li>
        <li id="mobile_login" >手机动态密码</li>
      </ul>
    </div>
    <div class="box">
    	<form action="<%=request.getContextPath() %>/authentication/user" method="post" id="loginForm">
    	<input type="hidden" name="backurl" value="${backurl}"  style="display: none;" />
    	<section class="box-content box-reg">
 			<p class="box-inp">
				<span class="icon"></span> <input class="inp" type="text"
					placeholder="请输入手机号码" value="" name="mobile" id="mobile">
			</p>   	
    	</section>
		<section id="normal_login_box" class="box-content box-reg">
			<p class="box-inp">
		    <span class="icon1"></span> <input class="inp" type="password"
					placeholder="请输入登录密码" value="" name="password" id="password">
			</p>
		</section>
		
		<section id="mobile_login_box" class="box-content box-reg" style="display: none;">
		  <p class="box-inp"><span class="icon1"></span><input class="inp" type="text"
					placeholder="请输入短信验证码" value="" name="verifyCode" id="verifyCode">
				 <span class="code-btn"> <span class="getCode" id="getVerifyCode" style="width:180px;">获取验证码</span> </span>
			</p>

		</section>
		
		<section>
		
			<p style="padding-top:25px;">
				<a class="login-btn"
					href="#" id="regBtn">登 录</a>
		  </p>
            <p style="padding-top:25px;">
				<a class="login-btn-zc"
					href="<%=request.getContextPath()%>/weixin/register.jsp" id="regBtn">注 册</a>
			</p>		
		</section>
		</form>
	</div>
</div></div>
</body>
</html>