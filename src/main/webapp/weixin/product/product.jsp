<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
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
<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/product.js"></script>
	<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<div class="act_wrapper zoom ">
  <div class="act_content">
	<div class="head">
	<c:if test="${state==1}">待发行</c:if>
	<c:if test="${state==2}">正发行</c:if>
	<c:if test="${state==3}">已发行</c:if>
	</div>
	
	<div class="center">
		<div class="zy">
			<span class="hot"></span>
			<h2>${firstProduct.name}</h2>
			<div class="zy_yq">
				<p>预计年化收益率</p>
				<p>
					<span>${firstProduct.rateA}%</span>
				</p>
				<p>
					<a id = "detail" href="<%=request.getContextPath()%>/weixin/product/productdetail?productid=${firstProduct.id}">查看详情&gt;</a>
				</p>
			</div>
			<ul>
				<li class="zy_qx">期限<span>
								<c:if test="${firstProduct.profitId==42}">
									${firstProduct.term}
									<c:choose>
										<c:when test="${firstProduct.termUnit==63}">年</c:when>
										<c:when test="${firstProduct.termUnit==64}">月</c:when>
										<c:otherwise>天</c:otherwise>
									</c:choose>
								</c:if>
							</span></li>
		    	<li class="zy_qg"><span>
							<c:choose>
								   <c:when test="${firstProduct.minAmount>10000}">  
								         <fmt:formatNumber value="${firstProduct.minAmount/10000}"  minFractionDigits="0"/>万元      
								   </c:when>
								   <c:otherwise> 
								  	  <fmt:formatNumber value="${firstProduct.minAmount}"  minFractionDigits="0"/>元
								   </c:otherwise>
							 </c:choose>
							 </span>起购</li>
				<li class="zy_fx"><span><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${firstProduct.releaseDate}"/>发行</span></li>
			</ul>
		</div>
		
		<c:forEach var="product" items="${products}" varStatus="xh">
			<div class="cplb">
				<h2>${product.name}</h2>
				<div class="linkk" id=${product.id}>
					<h1>${product.rate}</h1>
					<p>预计年化收益率</p>
				</div>
				<div class="cplb_zy">
					<ul>
						<li class="cplb_red">期限
							<c:if test="${product.profitId==42}">
								${product.term}
								<c:choose>
									<c:when test="${product.termUnit==63}">年</c:when>
									<c:when test="${product.termUnit==64}">月</c:when>
									<c:otherwise>天</c:otherwise>
								</c:choose>
							</c:if>
						<li>
							<c:choose>
							    <c:when test="${product.minAmount>10000}">  
								    <fmt:formatNumber value="${product.minAmount/10000}"  minFractionDigits="0"/>万元 
								</c:when>
							   <c:otherwise> 
							   	<fmt:formatNumber value="${product.minAmount}"  minFractionDigits="0"/>元
							   </c:otherwise>
							 </c:choose>起购
						</li>
						<li><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${product.releaseDate}"/>发行</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<!---foot底部---->
	<c:import url="../nav.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
	 </div>
</div>
</body>
</html>
