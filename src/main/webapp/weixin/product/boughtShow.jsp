<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>9点财讯</title>
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
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/bought.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>

<div class="act_wrapper zoom ">
  <div class="act_content">
<div class="head">我购买的产品</div>
 <c:forEach var="purchase" items="${purchaseList}">
<div class="cplb">
  <h2>${purchase.product.name}</h2>
  <c:if test="${product.profitId==42}">
  	<div class="linkk" id=${purchase.id}>
  </c:if>
  <c:if test="${product.profitId!=42}">
  <div id=${purchase.id}>
  </c:if>
    <h1><font size="66px" color="#c91e22">
    	<fmt:formatNumber value="${purchase.product.uPnl}" type="currency" pattern="#,#00.00"/> 
    </font></h1>
    <p>累计预估收益(元)</p>
  </div>
  <div class="cplb_zy" >
  <table  width="100%" height="56" border="0" cellpadding="0" cellspacing="0">
  <tr>
  <td height="32" style="margin:5px;">
<ul>
      <li class="cplb_red">购买
		<c:choose>
			<c:when test="${purchase.amount>10000}">  
				<fmt:formatNumber value="${purchase.amount/10000}"  minFractionDigits="2"/>万元      
			</c:when>
			<c:otherwise> 
				<fmt:formatNumber value="${purchase.amount}"  minFractionDigits="2"/>元
			</c:otherwise>
		</c:choose>
	  </li>
	  <li class="cplb_red">年化利率
	  <c:choose>
		<c:when test="${purchase.product.partA == 0 || (purchase.amount >= purchase.product.partA &&(purchase.product.partB ==0  || (purchase.product.partB !=0 &&purchase.amount < purchase.product.partB)))}">${purchase.product.rateA}%</c:when>
		<c:when test="${purchase.amount >= purchase.product.partB && (purchase.product.partC == 0 || (purchase.product.partC !=0 &&purchase.amount < purchase.product.partC))}">${purchase.product.rateB}%</c:when>
		<c:when test="${purchase.amount <= purchase.product.partC && (purchase.product.partD ==0 || (purchase.product.partD !=0 &&purchase.amount < purchase.product.partD))}">${purchase.product.rateC}%</c:when>
		<c:otherwise>${purchase.product.rateD}%</c:otherwise>
	  </c:choose>
	  </li>
	  
    </ul>
  </td>
  </tr>
  <tr>
   <td height="32" style="padding-top:5px;">
      <ul>
	  <li ><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.valueDate}"/> 起息</li>
      <li><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.payDate}"/> 派息</li>
	  <li><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.dueDate}"/> 到期</li>
    </ul>
  </td>
  </tr>
  </table>
	<div hidden  style="display: none;" >
    <ul>
      <li class="cplb_red">购买
		<c:choose>
			<c:when test="${purchase.amount>10000}">  
				<fmt:formatNumber value="${purchase.amount/10000}"  minFractionDigits="2"/>万元      
			</c:when>
			<c:otherwise> 
				<fmt:formatNumber value="${purchase.amount}"  minFractionDigits="2"/>元
			</c:otherwise>
		</c:choose>
	  </li>
	  <li ><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.valueDate}"/> 起息</li>
    </ul>
	</div>
	<div hidden  style="display: none;" >
    <ul>
      <li><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.payDate}"/> 派息</li>
	  <li><fmt:formatDate pattern="yyyy-MM-dd" value="${purchase.product.dueDate}"/> 到期</li>
    </ul>
	</div>	
  </div>
</div>
 </c:forEach>
<br class=" clear" />
<br class=" clear" />
	<!---foot底部---->
	<c:import url="../nav.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</div>
</div>
</body>
</html>
