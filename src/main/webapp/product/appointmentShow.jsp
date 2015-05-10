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
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div class="con" style="display: block">
			<div id="title_font">产品预约</div>
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
					<c:forEach var="appointment" items="${appointmentList.list}">
						<tr>
							<td>${appointment.product.name}</td>
							<td><fmt:formatDate pattern="yyyy年MM月dd"
									value="${appointment.reserve_date}" /></td>
							<td>${appointment.amount}</td>
							<td>${appointment.msg}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="page_menu">
          <a class="item"> < </a>
          <c:forEach var="i" begin="0" end="${appointment.pages}">
         	 <a class="item">${i+1}</a>
          </c:forEach>
          <a class="item"> > </a>
			</div>
		</div>

	</div>

	<br class=" clear" />

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</body>
</html>
