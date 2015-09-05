<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/account.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css">
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
<script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">帐户设置</div>
<div class="center">
  <div class="listable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="150">帐户名</th>
        <td align="right">${user.secUserName}</td>
      </tr>
      <tr>
        <th width="120">登录密码</th>
        <td align="right"><a href="<%=request.getContextPath()%>/weixin/authentication/resetpwd.jsp" >设置 <img src="<%=request.getContextPath()%>/weixin/images/jtx.png" width="11" height="18" hspace="5" vspace="11" align="absmiddle"></a></td>
      </tr>
      <tr>
        <th width="120">已绑定手机</th>
        <td align="right">${user.mobile}</td>
      </tr>
      <tr>
        <td colspan="2"><a href="<%=request.getContextPath()%>/authentication/logout?backurl=/weixin/product/productlist?type=1" class="btn_red">退出帐号</a></td>
      </tr>
    </table>
  </div>
</div>
<br class=" clear" />
<div class="nav" style="position:fixed; bottom:0;width:100%">
  <ul>
	<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=1">待发行</a></li>
	<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=2">正发行</a></li>
	<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=3">已发行</a></li>
	<li><a href="<%=request.getContextPath() %>/weixin/login.jsp">登 录</a></li>
  </ul>
</div>
</div>
</div>
</body>
</html>
