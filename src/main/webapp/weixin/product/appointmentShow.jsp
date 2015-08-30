<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我购买的产品</title>
<link href="<%=request.getContextPath() %>/weixin/css/style.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/appointment.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<div class="head">我购买的产品</div>
<div class="tab">
  <ul>
    <li>固定收益</li>
    <li class="over">浮动收益</li>
  </ul>
</div>
<div class="center">
  <div class="listable" style="padding:15px 20px;">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th style="text-align:left;">产品名称</th>
        <th style="text-align:left;">购买金额</th>
        <th style="text-align:left;">利息</th>
        <th style="text-align:left;">到期日</th>
      </tr>
      <c:forEach var="appointment" items="${appointments}">
	      <tr>
	        <td>${appointment.product.name}</td>
	        <td>${appointment.amount}万</td>
	        <td>万</td>
	        <td><fmt:formatDate pattern="yyyy-MM-dd" value="${appointment.reserve_date}"/></td>
	      </tr>
     </c:forEach>
    </table>
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
</body>
</html>
