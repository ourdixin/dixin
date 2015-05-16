<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<body>
	<div class="header_top">
		<div class="body_width">
			<i>欢迎进入121金融个人理财中心</i> 
			<span id='login_span'> 
				<c:if test="${null == user}">
					<a href="<%=request.getContextPath()%>/admin/login.jsp">登录</a>
				</c:if> 
				<c:if test="${null != user}"> 
   					${user.name}<a href="<%=request.getContextPath()%>/authentication/logout">安全退出</a>
				</c:if>
			</span>
		</div>
	</div>
	<div id="top">
		<div class="main_top">
			<a href="<%=request.getContextPath()%>/"><img src="<%=request.getContextPath()%>/images/index_03.jpg" width="408"
				height="50" /></a>
		</div>
	</div>
</body>
</html>