<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-个人资料</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/LTT_user.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/authentication/personaldata.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div id="tab1_con_1" style="display: block; clear: both;">
				<div class="user_title">证券客户认证</div>
				<form action="" method="post" id="baseInfoForm">
					<input name="id" id="id" type = "hidden" value="${user.id}">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td height="50" align="right">资金帐户：</td>
							<td><input maxlength="12" class="itstyle lt it"
								name="account" id="account" type="text" value="${user.account}"></td>
						</tr>
						<tr>
							<td height="50" align="right">认证公司：</td>
							<td><select name="financialInstitution.id" id="financialInstitution.id">
									<c:forEach var="finanic" items="${financialList}">
										<option value="${finanic.id}" <c:if test="${user.financialInstitution.id==finanic.id}">selected="selected"</c:if>>${finanic.name}</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td height="50" align="right">&nbsp;</td>
							<td><span class="bnt_ok_person_base">提交</span></td>
						</tr>
					</table>
				</form>
				<br />
			</div>
		</div>
		<br class=" clear" />
	</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
