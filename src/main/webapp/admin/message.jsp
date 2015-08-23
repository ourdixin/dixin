<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线留言</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
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


	<table>
		<thead>
			<tr>
			<th>留言时间</th>
			<th>客户姓名</th>
			<th>分类问题</th>
			<th>留言内容</th>
			<th>最后留言</th>
			<th>内容回复</th>
			</tr>
 		</thead>
		<c:choose>
			<c:when test="${empty list}">
			</c:when>
			<c:otherwise>
  			<tbody>
  				<c:forEach var="message" items="${list}">
  					<tr>
  						<td>
  							<fmt:formatDate value="${message.msgTime}" pattern="yyyy-MM-dd HH:mm"/>
  						</td>
  						<td>${message.userVO.name}</td>
  						<td><c:choose>
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
  						<c:choose>
  							<c:when test="${message.lastMessage.userVO.userType==25}">
  								<td></td>
  							</c:when>
  							<c:otherwise>
  								<td>${message.lastMessage.msg}</td>
  							</c:otherwise>
  						</c:choose>
  						<c:choose>
  							<c:when test="${message.lastMessage.userVO.userType!=25}">
  								<td><i><a href="<%=request.getContextPath()%>/admin/MessageReply?id=${message.id}&catogryId=${message.catogryId}">回复</a></i></td>
  							</c:when>
  							<c:otherwise>
  								<td><i style="background:gray;"><a href="<%=request.getContextPath()%>/admin/MessageReply?id=${message.id}&catogryId=${message.catogryId}">回复</a></i></td>
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
