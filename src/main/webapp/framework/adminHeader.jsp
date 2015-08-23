<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
  <div class="topbar">
    <div class="topnav">
      <div class="tel">免费专业顾问：400-6262-121</div>
      <div class="subnav">
			<c:if test="${null == user}">
				<a href="<%=request.getContextPath()%>/admin/login.jsp">登录</a>
			</c:if> 
			<c:if test="${null != user && (user.userType==30 || user.userType==25)}"> 
  					${user.secUserName}【管理员】&nbsp;&nbsp;&nbsp;&nbsp;<a href="<%=request.getContextPath()%>/authentication/logout">安全退出</a>
			</c:if>
	  </div>
    </div>
  </div>
  <div class="logobar">
    <div class="logo"><a href="<%=request.getContextPath()%>/admin"><img src="<%=request.getContextPath()%>/images/logo.png" /></a><img src="<%=request.getContextPath()%>/images/sloga.png" /></div>
    <div class="topsearch">
      <table width="304" border="0" cellspacing="0" cellpadding="0">
        
      </table>
    </div>
  </div>
</div>