<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>留言回复</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/myReplybyuser.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	
<form action="<%=request.getContextPath() %>/authentication/myReplybyuser"  method ="post" id="myReplyForm">
<input type="hidden" id="id" name="id" value="${param.id}" style="display: none;" />
<input type="hidden" id="catogryId" name="catogryId" value="${param.catogryId}" style="display: none;" />
<div id="main_right">
<div class="main_width">
<div class="con_table">
<table>
	<thead>
		<tr>
    		<th>留言时间</th>
    		<%--<th>客户代码</th>  --%>
   			<th>客户姓名</th>
   			<th>问题分类</th>
    		<th>问题描述/回复</th>
    	</tr>
	</thead>
	<tbody>
		<c:forEach var="message" items="${list}">
			<tr>
				<td>
					<fmt:formatDate value="${message.msgTime}" pattern="yyyy-MM-dd HH:mm"/>
				</td>
				<%-- <td>${message.userId}</td> --%>
				<td>${message.userVO.name}</td>
				<td>
					<c:choose>
  								<c:when test="${message.catogryId==74}">
  									浮动类收益产品
  								</c:when>
  								<c:when test="${message.catogryId==75}">
  									固定类收益产品
  								</c:when>
  								<c:otherwise>
  									其他
  								</c:otherwise>
  					</c:choose>
  				</td>
  				<td>${message.msg}</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
</div>
</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td align="center"><textarea name="msg" rows="4"  class="tareastyle tarea" id="pass2"></textarea></td>
  </tr>
  <tr>
    <td align="center" height="60">
		<p><span class="bnt_ok">提交联系记录</span></p>
	</td>
  </tr>
</table>
</div>
</form>
<br class=" clear" />
</div>
<blockquote>&nbsp;</blockquote>

<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
