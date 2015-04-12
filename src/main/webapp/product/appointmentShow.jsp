<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<div id="main_body">
		<div id="main_left">
			<ul>
				<dt>我的121金融</dt>
				<dd>
					<a href="about.html"><img src="images/ico_03.png" width="12"
						height="12" />我购买的产品</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_18.png" width="15"
						height="15" />我的预约</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_13.png" width="20"
						height="16" />产品转让</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_06.png" width="13"
						height="20" />我的专属财富经理</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_10.png" width="16"
						height="17" />风险评估</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_17.png" width="18"
						height="20" />帐户设置</a>
				</dd>
				<dd>
					<a href="about.html"><img src="images/ico_20.png" width="17"
						height="20" />安全退出</a>
				</dd>
			</ul>

		</div>
		<div id="main_right">

			<div class="con" style="display: block">

				<table border="0" cellpadding="0" cellspacing="0"
					class="ui compact table segment">
					<thead>
						<tr>
							<th width="13%">预约产品</th>
							<th width="12%">预约日期</th>
							<th width="10%">预约金额</th>
							<th width="17%">备注</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="appointment" items= "${appointmentList.list}">
							<tr>
								<td>${appointment.product.name}</td>
								<td><fmt:formatDate pattern="yyyy年MM月dd" value="${appointment.reserve_date}"/></td>
								<td>${appointment.amount}</td>
								<td>${appointment.msg}</td>
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

		<br class=" clear" />
	</div>

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</body>
</html>
