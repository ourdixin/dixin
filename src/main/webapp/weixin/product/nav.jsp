<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<div class="nav" style="position:fixed; bottom:0;width:100%">
	<ul>
		<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=1">待发行</a></li>
		<li><a href="<%=request.getContextPath() %>/weixin/product/productlist?type=2">正发行</a></li>
		<li><a href="<%=request.getContextPath() %>/weixin/login.jsp">登 录</a></li>
	</ul>
</div>