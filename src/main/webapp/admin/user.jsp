<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"rel="stylesheet" type="text/css" />
<script type="text/javascript"src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
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

			<div class="main_width">
				<div class="con_table">
					<table width="100%">
						<thead>
							<tr>
								<th width="13%">注册时间</th>
								<th width="13%">客户姓名</th>
								<th width="12%">QQ</th>
								<th width="13%">地址</th>
								<th width="13%">是否通过认证</th>
								<th colspan="2">会员权限审核</th>
								<th width="19%">操作</th>
							</tr>
						</thead>
						<tbody>
						<c:forEach var="user" items="${userList.list}"
								varStatus="i">
							<tr>
								<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${user.regDate}" /></td>
								<td>${user.name}</td>
								<td>${user.qq}</td>
								<td>${user.address}</td>
								<c:if test="${user.authType >0}"><td>通过</td></c:if>
								<c:if test="${user.authType <=0}"><td>未通过</td></c:if>
								<c:choose>
									<c:when test="${user.institutionId > 0}">
										<td width="9%">高级</td>
									</c:when>
									<c:otherwise>
										<td width="9%">普通</td>
									</c:otherwise>
								</c:choose>
								<td width="8%"><span><a href="<%=request.getContextPath()%>/admin/updateAuthType?id=${user.id}&authType=1">通过</a></span><i><a href="<%=request.getContextPath()%>/admin/updateAuthType?id=${user.id}&authType=0">拒绝</a></i></td>
								<td><span><a href="<%=request.getContextPath()%>/admin/userDetail?id=${user.id}">详细</a></span></span><i><a href="<%=request.getContextPath()%>/admin/addsalesdata.jsp?userid=${user.id}">添加产品</a></i></td>
							</tr>
						</c:forEach>	
						</tbody>
					</table>

				</div>
			</div>
		</div>

		<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
