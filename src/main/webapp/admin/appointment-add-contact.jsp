<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约（添加联系记录）</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/appointment-add-contact.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
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
	<table width="100%">
  		<thead>
  			<tr>
    			<th>联系时间</th>
  				<th>联系人</th>
  				<th>联系记录</th>
  			</tr>
  		</thead>
  		<tbody>
  			<c:choose>
  				<c:when test="${empty list}">
  				</c:when>
  				<c:otherwise>
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
  				</c:otherwise>
  			</c:choose>
     	</tbody>
       </table>
</div>
</div>
<form action="<%=request.getContextPath() %>/admin/appointment-add-contact"  method ="post" id="addcontactForm">
	<input type="hidden" id="a1" name="firstContactId" value="${param.firstContactId}"/>
	<input type="hidden" id="a2" name="appointmentId" value="${param.appointmentId}"/>
	<input type="hidden" id="a3" name="userId" value="${param.userId}"/>
	<table width="100%" border="0" cellspacing="0" cellpadding="0">
  		<tr>
    		<td align="center"><textarea name="record" rows="4"  class="tareastyle tarea" id="pass2"></textarea></td>
  		</tr>
  		<tr>
    		<td align="center">
			<p><span class="bnt_ok">提交联系记录</span></p></td>
 		 </tr>
 		 
	</table>
</form>
</div>

<br class=" clear" />
<blockquote>&nbsp;</blockquote>
<blockquote>&nbsp;	</blockquote>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
