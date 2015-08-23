<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div id="header">
  <div class="topbar">
    <div class="topnav">
      <div class="tel">免费专业顾问：400-6262-121</div>
      
      <div class="subnav">
      	<c:if test="${null == user}">
      		<a href="<%=request.getContextPath() %>/authentication/login.jsp">登录</a> | <a href="<%=request.getContextPath() %>/authentication/register.jsp">免费注册</a> | <a href="<%=request.getContextPath() %>/authentication/regarding.jsp">关于我们</a>
      	</c:if> 
      	<c:if test="${null != user}"> 	 
      		   	${user.secUserName}
	   	<c:if test="${user.userType == 10}">
	   		【普通会员】
	   	</c:if>  
	   	<c:if test="${user.userType == 25}">
	   		【管理员】
	   	</c:if>
	   	 | <a href="<%=request.getContextPath()%>/authentication/user.jsp">我的9点财讯</a>
	   	 | <a href="<%=request.getContextPath()%>/product/customer.jsp">在线客服</a> 
	   	 | <a href="<%=request.getContextPath()%>/authentication/logout">安全退出</a>
	   	 | <a href="<%=request.getContextPath() %>/authentication/regarding.jsp">关于我们</a>
	    </c:if> 
      </div>
    </div>
  </div>
  <div class="logobar">
    <div class="logo"><a href="<%=request.getContextPath() %>/"><img src="<%=request.getContextPath()%>/images/logo.png"></a><img src="<%=request.getContextPath()%>/images/sloga.png"></div>
    <div class="topsearch">
        <table width="304" border="0" cellspacing="0" cellpadding="0">
        <form name="form1" method="post" action="<%=request.getContextPath() %>/product/product.jsp">
	          <tr>
	            <td width="242"><input type="text" name="search_text" id="search_text">
	            <input type="submit" name="button" id="button" value="提交"></td>
	            <td width="62"><a href="<%=request.getContextPath() %>/product/product.jsp">理财产品<br>高级筛选</a></td>
	          </tr>
          </form>
        </table>
    </div>
  </div>
</div>
