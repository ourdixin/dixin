<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-个人资料</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/LTT_user.css"	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/personaldata.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>
	";
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
		<div class="user_right">
			<div class="user_title">基本信息</div>
			<div class="layout_a per_data">
				<div class="title clearfix"
					style="background: #f2f2f2; padding: 0 1em;">
					<h3>个人资料</h3>
					<ul class="wsd_box lt"></ul>
					<a class="rt"
						href="<%=request.getContextPath()%>/authentication/baseInfoConfirm.jsp">编辑></a>
				</div>
			</div>
			<div class="user_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="11%" align="right">用户名：</td>
						<td colspan="2">${user.userName}</td>
					</tr>
					<tr>
						<td align="right">QQ：</td>
						<td colspan="2">${user.qq}</td>
					</tr>
					<tr>
						<td align="right">所在地区：</td>
						<td>${user.area.name}</td>
					</tr>
					<tr>
						<td align="right">邮政编码：</td>
						<td>${user.zipCode}</td>
					</tr>
					<tr>
						<td align="right">联系地址：</td>
						<td>${user.address}</td>
					</tr>
				</table>
			</div>
			<div class="layout_a per_data">
				<div class="title clearfix"
					style="background: #f2f2f2; padding: 0 1em;">
					<h3>安全中心</h3>
					<div class="safe_grade lt"></div>
				</div>
			</div>
			<div class="user_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="12%" align="right">登录密码：</td>
						<td width="31%"><input style="border: none;" type="password"
							disabled="disabled" value="${user.password}"></td>
						<td width="56%"><a
							href="<%=request.getContextPath()%>/authentication/pwConfirm.jsp">修改</a></td>
					</tr>
					<tr>
						<td align="right">手机号码：</td>
						<td>${user.mobile}</td>
						<td width="56%"><a
							href="<%=request.getContextPath()%>/authentication/mobileConfirm.jsp">修改</a></td>
					</tr>
				</table>
			</div>

			<div class="layout_a per_data">
				<div class="title clearfix"
					style="background: #f2f2f2; padding: 0 1em;">
					<h3>会员权限</h3>
					<div class="safe_grade lt"></div>
					<a class="rt"
						href="<%=request.getContextPath()%>/authentication/getFinanicalList">编辑></a>
				</div>
			</div>
			<div class="user_table">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td width="14%" align="right">资金帐户：</td>
						<td width="30%">${user.account}</td>
					</tr>
					<tr>
						<td align="right">认证公司：</td>
						<td>${user.financialInstitution.name}</td>
					</tr>
					<tr>
						<td align="right">&nbsp;</td>
						<td>&nbsp;</td>
						<td>&nbsp;</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<br class=" clear" />
	</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
