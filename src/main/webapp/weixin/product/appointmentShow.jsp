<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我购买的产品</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style>
<script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
<link href="<%=request.getContextPath() %>/weixin/css/style.css"rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/appointment.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>

<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">我购买的产品</div>
 <c:forEach var="appointment" items="${appointments}">
<div class="cplb">
  <h2>${appointment.product.name}</h2>
  <div class="linkk" id=${appointment.id}>
    <h1>1500.62</h1>
    <p>利息收益(元)</p>
  </div>
  <div class="cplb_zy">
    <ul>
      <li class="cplb_red">购买${appointment.amount}万元</li>
      <li><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.product.payDate}"/> 派息</li>
      <li><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.product.dueDate}"/> 到期</li>
    </ul>
  </div>
</div>
 </c:forEach>
<div class="center"></div>
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
