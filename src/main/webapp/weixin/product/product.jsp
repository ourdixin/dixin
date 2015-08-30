<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>已发行</title>
<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/product.js"></script>
	<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
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
					<span>${firstProduct.rate}</span>
				</p>
				<p>
					<a id = "detail" href="<%=request.getContextPath()%>/weixin/product/productdetail?productid=${firstProduct.id}">查看详情&gt;</a>
				</p>
			</div>
			<ul>
				<li class="zy_qx">期限<span>
								<c:if test="${product.profitId==42}">
									${product.term}
									<c:choose>
										<c:when test="${product.termUnit==63}">年</c:when>
										<c:when test="${product.termUnit==64}">月</c:when>
										<c:otherwise>天</c:otherwise>
									</c:choose>
								</c:if>
							</span></li>
		    	<li class="zy_qg"><span>
							<c:choose>
								   <c:when test="${firstProduct.minAmount>10000}">  
								         ${firstProduct.minAmount/10000} 万元      
								   </c:when>
								   <c:otherwise> 
								  	  ${firstProduct.minAmount} 元
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
								         ${product.minAmount/10000} 万元      
								</c:when>
							   <c:otherwise> 
							    ${product.minAmount} 元
							   </c:otherwise>
							 </c:choose>
						</li>
						<li><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${product.releaseDate}"/>发行</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="nav">
		<ul>
			<li><a href="#">待发行</a></li>
			<li><a href="#">正发行</a></li>
			<li><a href="#">已发行</a></li>
			<li><a href="#">登 录</a></li>
		</ul>
	</div>
</body>
</html>
