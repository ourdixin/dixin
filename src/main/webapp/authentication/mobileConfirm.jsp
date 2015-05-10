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
		<form action="" method="post" id="baseInfoForm">
		<input type="hidden" id="_vCode" name = "_vCode" value="<%=session.getAttribute("vCode") %>">
		<div id="tab1_con_1" style="display: block; clear: both;">
			<div class="user_title">修改手机号</div>
			<table border="0" cellspacing="0" cellpadding="0">
				<!--
				<tr>
					<td width="74" height="50" align="right">当前手机：</td>
					<td colspan="2"><input maxlength="12" class="itstyle lt it"
						name="pass7" id="pass8" type="password" /></td>
				</tr>
				-->
				<tr>
					<td height="50" align="right">新手机：</td>
					<td colspan="2"><input maxlength="12" class="itstyle lt it"
						name="mobile" id="mobile" type="text" /></td>
				</tr>
				<tr>
					<td height="50" align="right">验证码：</td>
					<td width="82"><input maxlength="12" class="itstyle lt it160"
						name="vCode" id="vCode" type="text" /></td>
					<td width="154"><font
						style="border: 1px solid #ccc; padding: 3px 10px; background: #f1f1f1"><a
							href="<%=request.getContextPath()%>/authentication/verificationCode">验证码</a></font></td>
				</tr>
				<tr>
					<td height="50" align="right">&nbsp;</td>
					<td colspan="2"><span class="bnt_ok_mobile">提交</span></td>
				</tr>
			</table>
			<br/> <br/>
		</div>
		</form>
	</div>
	<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
