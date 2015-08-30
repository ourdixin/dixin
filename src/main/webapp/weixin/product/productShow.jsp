<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<link href="<%=request.getContextPath() %>/weixin/css/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath() %>/weixin/js/product.js"></script>
	<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<title>产品详情</title>
</head>

<body>
<div class="head">产品详情</div>
<div class="center">
  <span class="hb" style="margin-top:20px;"></span>
  <div class="cplb">
    <h2>${product.name}</h2>
    <div class="linkk" style="background:none;">
      <p style="float:left;padding-top:30px;padding-right:20px;">预计年化收益率</p><h1 style="float:left;">${product.rate}</h1>
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
		 </li>
         <li>
					<c:choose>
						<c:when test="${product.minAmount>10000}">  
							${product.minAmount/10000} 万元      
						</c:when>
						<c:otherwise> 
							${product.minAmount} 元
						</c:otherwise>
					</c:choose>起购
		  </li>
          <li><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${product.releaseDate}"/>发行</li>
      </ul>
    </div>
  </div>
  
  <div class="listable">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <th width="100">发行截止</th>
        <td><fmt:formatDate pattern="yyyy/MM/dd hh:mm" value="${product.endDate}"/></td>
      </tr>
      <tr>
        <th>产品规模</th>
        <td>${product.amount/100000000}亿</td>
      </tr>
      <tr>
        <th>投资起点</th>
        <td><c:choose>
				<c:when test="${product.minAmount>10000}">  
					${product.minAmount/10000} 万元      
				</c:when>
				<c:otherwise> 
					${product.minAmount} 元
				</c:otherwise>
			</c:choose>
			+
			<c:choose>
				<c:when test="${product.appendAmount>10000}">  
					${product.appendAmount/10000} 万元      
				</c:when>
				<c:otherwise> 
					${product.appendAmount} 元
				</c:otherwise>
			</c:choose>
			整数倍
		</td>
      </tr>
      <tr>
        <th>付息方式</th>
        <td>${product.payTypeInfo}</td>
      </tr>
      <tr>
        <th>资金投向</th>
        <td>${product.directionInfo}</td>
      </tr>
      <tr>
        <th>产品详情</th>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2"><a href="<%=request.getContextPath() %>/weixin/product/appointment.jsp?productid=${product.id}" class="btn_red">我要购买</a></td>
      </tr>
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
