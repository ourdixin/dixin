<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">

<div class="main_width">
<div class="con_table">
	<table width="1200">
		<thead>
			<tr>
				<th width="100">提交时间</th>
				<th width="50">客户姓名</th>
				<th width="100">产品名称</th>
				<th width="110">金额(万元)</th>
		 		<th width="90">打款日期</th>
		 		<th>预约留言</th>
				<th width="80">联系</th>
				<th width="50">联系记录</th>
				<th width="50">结果</th>
	 		</tr>
 		</thead>
		 <c:choose>
			<c:when test="${empty list}">
			</c:when>
			<c:otherwise>
   			<tbody>
   				<c:forEach var="appointment" items="${list}">
   					<tr>
   						<td>
   							<fmt:formatDate value="${appointment.createTime}" pattern="yyyy-MM-dd HH:mm"/>
   						</td>
   						<td>
   							${appointment.user.name}
   						</td>
   						<td>
   							${appointment.product.name}
   						</td>
   						<td>
   							${appointment.amount}
   						</td>
   						<td>
   							<fmt:formatDate value="${appointment.reserve_date}" pattern="yyyy-MM-dd"/>
   						</td>
   						<td>
   							${appointment.msg}
   						</td>
   						<td>
   							<span><a href="">拔打电话</a></span><br/>
              				<i><a href="">发短信</a></i>
   						</td>
   						<td>
   							${appointment.contact.lastContactRecordVO.record}
   							<span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact?firstContactId=${appointment.contact.id}&appointmentId=${appointment.id}&userId=${appointment.userId}">添加</a></span>
                			<i><a href="<%=request.getContextPath()%>/admin/appointment-contact?firstContactId=${appointment.contact.id}&appointmentId=${appointment.id}&userId=${appointment.userId}">更多</a></i>
   						</td>
   						<c:choose>
   							<c:when test="${appointment.constant==104}">
   								<td>
   									已购买<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=${appointment.user.name}&reservationId=${appointment.id}&productName=${appointment.product.name}">详细</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=${appointment.id}&constant=${appointment.constant}&userId=${appointment.userId}&productId=${appointment.product.id}">修改</a></i>
   								</td>
   							</c:when>
   							<c:when test="${appointment.constant==105}">
   								<td>
   									购买中<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=${appointment.user.name}&reservationId=${appointment.id}&productName=${appointment.product.name}">进程</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=${appointment.id}&constant=${appointment.constant}&userId=${appointment.userId}&productId=${appointment.product.id}">修改</a></i>
   								</td>
   							</c:when>
   							<c:when test="${appointment.constant==106}">
   								<td>
   									不购买<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=${appointment.user.name}&reservationId=${appointment.id}&productName=${appointment.product.name}">进程</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=${appointment.id}&constant=${appointment.constant}&userId=${appointment.userId}&productId=${appointment.product.id}">修改</a></i>
   								</td>
   							</c:when>
   							<c:otherwise>
   								<td>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=${appointment.id}&constant=${appointment.constant}&userId=${appointment.userId}&productId=${appointment.product.id}">处理</a></span>
   								</td>
   							</c:otherwise>
   						</c:choose>
   					</tr>
   				</c:forEach>
   			</tbody>
		</c:otherwise>
	</c:choose>	
</table>
</div>
</div>
</div>

<br class=" clear" />
</div>
<blockquote>&nbsp;</blockquote>
<blockquote>&nbsp;	</blockquote>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
