<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="nav" style="position:fixed; bottom:0;width:100%">
	<ul>
		<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=1">待发行</a></li>
		<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=2">正发行</a></li>
		<c:if test="${null == user}">
			<li><a href="<%=request.getContextPath() %>/weixin/login.jsp">登 录</a></li>
		</c:if>
		<c:if test="${null != user}">
			<li><a href="<%=request.getContextPath() %>/weixin/authentication/user.jsp">我的</a></li>
		</c:if>		
	</ul>
</div>