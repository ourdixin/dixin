<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约（联系记录）</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">

<div class="main_width">
<div class="con_table">
	<c:choose>
		<c:when test="${empty list}">
			<span style="color:red;font-family:微软雅黑">暂时没有联系记录，请稍后查看！</span>
		</c:when>
		<c:otherwise>
			<table width="100%">
  				<thead>
  					<tr>
    					<th>联系时间</th>
  						<th>联系人</th>
  						<th>联系记录</th>
  					</tr>
  				</thead>
  				<tbody>
  					<c:forEach var="contact" items="${list}">
  						<tr>
  							<td>
  								<fmt:formatDate value="${contact.contactTime}" pattern="yyyy年MM月dd日"/>
  							</td>
  							<td>
  								${contact.user.name}
  							</td>
  							<td>
  								${contact.record}
  							</td>
  						</tr>
  					</c:forEach>
  				</tbody>
      	 	</table>
		</c:otherwise>
	</c:choose>

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
