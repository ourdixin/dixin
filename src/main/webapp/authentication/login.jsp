<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>登录</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/login.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div class="wrap">
    <div class="maintitle">
     <div id="title_font">会员登录</div>
     <div class="dqwz">当前位置：<a href="<%=request.getContextPath()%>/">首页</a> &gt; 会员登录</div>
   </div>
<div class="table_c">
<form id="loginForm">
<input type="hidden" name="backurl" value="${backurl}"  style="display: none;" />
  <table width="100%" cellpadding="0" cellspacing="0">
      <tbody>
      <tr>
      	<td height="54" colspan="2" align="center" bgcolor="#f2f2f2" style="font-weight:bold;border-bottom:1px solid #dddddd;">进入我的9点财讯</td>
      </tr>
      <tr>
      <td height="60" align="right"><span class="t">您的帐号： </span></td>
        <td width="55%"><input maxlength="11" id="username" name="username" class="itstyle lt it log_user" type="text"  value="请输入手机号或会员名" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" ></td>
      </tr>
      <tr>
      <td height="60" align="right"><span class="t">登录密码：</span></td>
        <td width="55%"><input maxlength="12" class="itstyle lt it" name="password" id="pass" type="password">
        
        <a href="<%=request.getContextPath()%>/authentication/forgetpassword.jsp" class="blue" style="font-size:12px;line-height:26px;">忘记密码？</a></td>
      </tr>
      <tr>
      <td width="45%" height="60"></td>
      <td width="55%"><span class="bnt_ok" style="cursor:pointer;">立即登录</span><br /></td>
      </tr>
    </tbody>
</table>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
  <p>&nbsp;</p>
</div>

<br class=" clear" />

</div>
</div>

<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
