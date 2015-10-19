<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="token" uri="spring/mvc/token"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/adduser.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div id="title_xi"></div>
		<div class="register">
			<div class="info_frm">
				<form id="adduserForm" name="adduserForm" method="post"
					action="">
					<!-- token:token/ -->
					<table>
						<tbody>
							<tr>
								<td class="t" width="100">客户姓名：</td>
								<td><input class="itstyle lt it" id="name" name="name"
									value="" type="text" /></td>
								<td class="t" width="100">手机号：</td>
								<td><input class="itstyle lt it" id="mobile" name="mobile"
									value="" type="text" /></td>
							</tr>
							<tr>
								<td class="t">QQ：</td>
								<td><input class="itstyle lt it" id="qq" name="qq"
									value="" type="text" /></td>
								<td class="t">密码：</td>
								<td><input class="itstyle lt it" id="password" name="password"
									value="" type="text" /></td>
							</tr>
							<tr>
								<td class="t">所在地区：</td>
								<td >
								<select class="itstyle lt it" name="province" id="province" style="width:180px">
								</select>
								<select class="itstyle lt it" name="areaId" id="areaId" style="width:180px">
									<option></option>
								</select>
								</td>
								<td class="t">邮编：</td>
								<td><input class="itstyle lt it" id="zipCode" name="zipCode"
									value="" type="text" /></td>
							</tr>
							<tr>
								<td class="t">详细地址：</td>
								<td colspan="3"><input class="itstyle lt it" id="address" name="address"
									value="" type="text"  style="width:90%"/>
								</td>

							</tr>
							<tr>
								<td colspan="4">
									<center>
										<span style="height:30px;cursor:pointer;" class="bnt_ok">添加</span>
									</center>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
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
