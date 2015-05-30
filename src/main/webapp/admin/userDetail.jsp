<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div class="user_title">基本信息</div>
		<div class="main_width">
			<div class="con_table">
				<table width="100%">
					<thead>
						<tr>
							<th>姓名</th>
							<th>用户名</th>
							<th>地址</th>
							<th>QQ</th>
							<th>注册时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${user.name}</td>
							<td>${user.userName}</td>
							<td>${user.address}</td>
							<td>${user.qq}</td>
							<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${user.regDate}" /></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<div class="tab1">
			<div class="user_title">产品购买信息</div>

			<ul class="ul_1">
				<li class="tab1_1_on" id="tab1_1"
					onMouseOver="set_tab('tab1', 1 ,4)">固定收益</li>
				<li class="tab1_2_off" id="tab1_2"
					onMouseOver="set_tab('tab1', 2 ,4)">浮动收益</li>
			</ul>
			<div id="tab1_con_1" class="con" style="display: block; clear: both;">
				<table border="0" cellpadding="0" cellspacing="0"
					class="ui compact table segment">
					<thead>
						<tr>
							<th>产品代码</th>
							<th>产品名称</th>
							<th>发行时间</th>
							<th>期限</th>
							<th>利率</th>
							<th>认购起点</th>
							<th>付息方式</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="fixProduct" items="${fixProductList}" varStatus="i">
							<tr>
								<td>${fixProduct.product.code}</td>
								<td>${fixProduct.product.name}</td>
								<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${fixProduct.product.releaseDate}" /></td>
								<td>${fixProduct.product.term}
								<c:choose>
									<c:when test="${fixProduct.product.termUnit==63}">年</c:when>
									<c:when test="${fixProduct.product.termUnit==64}">月</c:when>
									<c:otherwise>日</c:otherwise>
								</c:choose>
								</td>
								<td>${fixProduct.product.rate}</td>
								<td>
								<c:choose>
									<c:when test="${fixProduct.product.minAmount>10000}">${fixProduct.product.minAmount/10000}万元</c:when>
									<c:otherwise>${fixProduct.product.minAmount}元</c:otherwise>
								</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${fixProduct.product.payType==66}">自然季度付息</c:when>
									<c:when test="${fixProduct.product.payType==67}">自然半年度付息</c:when>
									<c:when test="${fixProduct.product.payType==68}">自然年度付息</c:when>
									<c:when test="${fixProduct.product.payType==69}">季度付息</c:when>
									<c:when test="${fixProduct.product.payType==70}">半年度付息</c:when>
									<c:when test="${fixProduct.product.payType==71}">年度付息</c:when>
									<c:when test="${fixProduct.product.payType==72}">到期还本付息</c:when>
									<c:when test="${fixProduct.product.payType==73}">其他付息方式</c:when>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
			<div id="tab1_con_2" class="con" style="display: none; clear: both;">
				<table class="ui compact table segment">
					<thead>
						<tr>
							<th>产品代码</th>
							<th>产品名称</th>
							<th>发行时间</th>
							<th>期限</th>
							<th>利率</th>
							<th>认购起点</th>
							<th>付息方式</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="proProduct" items="${proProductList}" varStatus="i">
							<tr>
								<td>${proProduct.product.code}</td>
								<td>${proProduct.product.name}</td>
								<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${proProduct.product.releaseDate}" /></td>
								<td>${proProduct.product.term}
								<c:choose>
									<c:when test="${proProduct.product.termUnit==63}">年</c:when>
									<c:when test="${proProduct.product.termUnit==64}">月</c:when>
									<c:otherwise>日</c:otherwise>
								</c:choose>
								</td>
								<td>${proProduct.product.rate}</td>
								<td>
								<c:choose>
									<c:when test="${proProduct.product.minAmount>10000}">${proProduct.product.minAmount/10000}万元</c:when>
									<c:otherwise>${proProduct.product.minAmount}元</c:otherwise>
								</c:choose>
								</td>
								<td>
								<c:choose>
									<c:when test="${proProduct.product.payType==66}">自然季度付息</c:when>
									<c:when test="${proProduct.product.payType==67}">自然半年度付息</c:when>
									<c:when test="${proProduct.product.payType==68}">自然年度付息</c:when>
									<c:when test="${proProduct.product.payType==69}">季度付息</c:when>
									<c:when test="${proProduct.product.payType==70}">半年度付息</c:when>
									<c:when test="${proProduct.product.payType==71}">年度付息</c:when>
									<c:when test="${proProduct.product.payType==72}">到期还本付息</c:when>
									<c:when test="${proProduct.product.payType==73}">其他付息方式</c:when>
								</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
		</div>

		<div class="tab1">
			<div class="user_title">在线留言</div>
			<div class="main_width">
				<div class="con_table">
					<table width="100%">
						<thead>
							<tr>
								<th>留言时间</th>
								<th>客户姓名</th>
								<th>分类问题</th>
								<th>问题描述</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="message" items="${messageList}" varStatus="i">
							<tr>
								<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${message.msgTime}" /></td>
								<td>${message.userVO.name}</td>
								<td>产品预约</td>
								<td>我有100万的产品需要转让，如何转让啊</td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>

				</div>
			</div>

		</div>
	</div>

	<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
