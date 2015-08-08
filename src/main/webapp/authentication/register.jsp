<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>注册</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/register.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div id="title_xi"></div>
<div id="title_font">9点财讯</div>
<div class="register">
<div class="info_frm">
<form action="<%=request.getContextPath() %>/authentication/user" method="post" id="regForm">
<table>
	          <tbody><tr>
	            <td class="t" width="15%">手机号码： </td>
	            <td width="85%"><input maxlength="11" id="mobile" name="mobile" class="itstyle lt it" type="text"><div class="input-r-tips lt"></div></td>
	          </tr>
	           <tr>
	            <td class="t">图形验证码：</td>
	            <td><input maxlength="6" class="itstyle lt it" id="randCode" name="randCode" style="width:100px;" type="text"><div class="code_box"><div class="dis_getcode lt"><img id="randCodeImg" src="<%=request.getContextPath() %>/authentication/getPic" /></div></td>
	          </tr>
	          <tr>
	            <td class="t">验证码：</td>
	            <td><input maxlength="6" class="itstyle lt it" id="verifyCode" name="verifyCode" style="width:100px;" type="text"><div class="dis_getcode lt" id="getVerifyCode"><label>获取验证码</label></div><div class="input-r-tips lt"></div></td>
	          </tr>
	          <tr>
	            <td class="t">登录密码：</td>
	            <td><input maxlength="12" class="itstyle lt it" name="password" id="password" type="password"><div class="input-r-tips"></div></td>
	          </tr>
	          <tr>
	            <td class="t">密码强度：</td>
	            <td id="level" class="pw-defule">
	              <div class="pw-bar"></div>
	            </td>
	          </tr>
	          <tr>
	            <td class="t">确认密码：</td>
	            <td><input maxlength="12" class="itstyle lt it" name="rpassword" id="rpassword" value="" type="password"><div class="input-r-tips"></div></td>
	          </tr>
	          <tr>
	            <td></td>
	            <td><label><input checked="checked" id="agree" class="checkbox" type="checkbox">我已阅读并同意</label><a href="<%=request.getContextPath()%>/authentication/Agreement.jsp" >《121金融注册协议》</a></td>
	          </tr>
	          <tr>
	            <td></td>
	            <td>
	              <div style="position:relative;" class="mtop25 clearfix">
	               <span class="bnt_ok">立即注册</span><span class="input-r-tips">已有账号，直接<a href="<%=request.getContextPath()%>/authentication/login.jsp" style="color:#F60">登录</a></span>
	              </div>
	            </td>
	          </tr>
	        </tbody></table>
</form>
</div>

</div>


<br class=" clear" />
</div>

<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
