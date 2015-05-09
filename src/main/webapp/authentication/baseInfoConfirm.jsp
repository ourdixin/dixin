<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
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
	src="<%=request.getContextPath()%>/js/js.js"></script>
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
				<div class="user_title">个人资料</div>
				<form action="" method="post" id="baseInfoForm">
					<input name="id" id="id" type = "hidden" value="${user.id}">
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td width="11%" height="50" align="right">用户名：</td>
							<td colspan="2">${user.name}</td>
						</tr>
						<tr>
							<td height="50" align="right">QQ：</td>
							<td colspan="2"><input maxlength="12" class="itstyle lt it"
								name="qq" id="qq" type="text"></td>
						</tr>
						<tr>
							<td height="50" align="right">所在地区：</td>
							<!-- 
							<td width="15%"><select name="select" id="select">
									<option>请选择</option>
									<option>北京</option>
									<option>上海</option>
									<option>深圳</option>
									<option>广州</option>
							</select></td>
							<td width="74%"><select name="select2" id="select2">
									<option>北京</option>
							</select></td>
							 -->
						</tr>
						<tr>
							<td height="50" align="right">邮政编码：</td>
							<td colspan="2"><input maxlength="12"
								class="itstyle lt  it160" name="zipCode" id="zipCode"
								type="text" /></td>
						</tr>
						<tr>
							<td height="50" align="right">联系地址：</td>
							<td colspan="2"><input maxlength="12" class="itstyle lt it"
								name="address" id="address" type="text" /></td>
						</tr>
						<tr>
							<td height="50" align="right">&nbsp;</td>
							<td colspan="2"><span class="bnt_ok_person_base">提交</span></td>
						</tr>
					</table>
				</form>
				<br />
			</div>
		</div>
		<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
