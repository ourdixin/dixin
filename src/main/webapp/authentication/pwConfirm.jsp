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
			<div class="user_title">修改密码</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td height="50" align="right">当前密码：</td>
					<td><input maxlength="12" class="itstyle lt it" name="pass3"
						id="pass4" type="password" /></td>
				</tr>
				<tr>
					<td height="35" align="right" valign="bottom">新密码：</td>
					<td valign="bottom"><input maxlength="12"
						class="itstyle lt it" name="pass6" id="pass7" type="password" /></td>
				</tr>
				<tr>
					<td height="25" colspan="2" align="right"><font
						style="font-size: 12px; color: #999">密码6-12位数字组成，区分大小写，不含空格。</font></td>
				</tr>
				<tr>
					<td height="50" align="right">密码强度：</td>
					<td><div class="safe_grade" style="margin-left: 0">
							<p id="safetyLevel2"></p>
						</div></td>
				</tr>
				<tr>
					<td height="50" align="right">确认新密码：</td>
					<td><input maxlength="12" class="itstyle lt it" name="pass3"
						id="pass4" type="password" /></td>
				</tr>
				<tr>
					<td height="50" align="right">&nbsp;</td>
					<td><span class="bnt_ok_pw">修改</span><a href="#">忘记新密码？</a></td>
				</tr>
			</table>
			<br /> <br />
		</div>
	</div>
	<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
