<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>产品详情</title>
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="format-detection" content="telephone=no">
<meta name="format-detection" content="email=no">
<meta name="format-detection" content="address=no">
<meta content="width=device-width,initial-scale=1.0,maximum-scale=1.0,user-scalable=no" name="viewport">
<style type="text/css" id="_zoom">.zoom {zoom:1.0625;-webkit-text-size-adjust:auto!important;}</style><script>
  var _w,_zoom,_hd,_orientationChange,_doc=document,__style=_doc.getElementById("_zoom");__style||(_hd=_doc.getElementsByTagName("head")[0],__style=_doc.createElement("style"),_hd.appendCHild(_style)),_orientationChange=function(){_w=_doc.documentElement.clientWidth||_doc.body.clientWidth,_zoom=_w/640,__style.innerHTML=".zoom {zoom:"+_zoom+";-webkit-text-size-adjust:auto!important;}"},_orientationChange(),window.addEventListener("resize",_orientationChange,!1);
</script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /><link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/appointment.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">产品详情</div>
<div class="cplb">
  <h2>${appointment.product.name}</h2>
  <div>
    <h1>1500.62</h1>
    <p>利息收益(元)</p>
  </div>
  <div class="cplb_zy">
    <ul>
      <li class="cplb_red">购买${appointment.amount}万元</li>
      <li><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.product.payDate}"/> 派息</li>
      <li><fmt:formatDate pattern="yyyy/MM/dd" value="${appointment.reserve_date}"/>到期</li>
    </ul>
  </div>
</div>
<div class="center">
  <div class="listable" style="padding:15px 20px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="210">起息日</th>
        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.product.valueDate}"/></td>
      </tr>
      <tr>
        <th>期限</th>
        <td>
        	<c:if test="${appointment.product.profitId==42}">
				${appointment.product.term}
				<c:choose>
					<c:when test="${appointment.product.termUnit==63}">年</c:when>
					<c:when test="${appointment.product.termUnit==64}">月</c:when>
					<c:otherwise>天</c:otherwise>
				</c:choose>
			</c:if>
		</td>
      </tr>
      <tr>
        <th>预计年化收益率</th>
        <td>${appointment.product.rate}</td>
      </tr>
      <tr>
        <th>付息方式</th>
        <td>${appointment.product.payTypeInfo}</td>
      </tr>
      <tr>
        <th>已派利息</th>
        <td>&nbsp;</td>
      </tr>
    </table>
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
</div>
<div class="nav">
  <ul>
    <li><a href="#">待发行</a></li>
    <li><a href="#">正发行</a></li>
    <li><a href="#">已发行</a></li>
    <li><a href="#">登 录</a></li>
  </ul>
</div>
</div>
</div>
</body>
</html>
