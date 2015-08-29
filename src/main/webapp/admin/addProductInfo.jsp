<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="token" uri="spring/mvc/token"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>添加产品信息</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/addproductinfo.js"></script>
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
				<form id="addproductInfoForm" name="addproductInfoForm" method="post" action="<%=request.getContextPath()%>/productinfo/add">
					<!-- token:token/ -->
					<table>
						<tbody>
							<tr>
								<td class="t" width="100">产品代码：</td>
								<td><%=request.getParameter("code")==null?"":request.getParameter("code")%>
								<input hidden class="itstyle lt it" id="productID" name="productID"
									value="<%=request.getParameter("productId")==null?"":request.getParameter("productId")%>" type="text" />	
									</td>
								<td class="t" width="100">产品名称：</td>
								<td><%=request.getParameter("name")==null?"":request.getParameter("name")%></td>
							</tr>
							<tr>
								<td class="t">信息类型：</td>
								<td><select class="itstyle"
									name="infoType" id="infoType">
										<option value="201" selected>净值</option>
										<option value="200">派息</option>
										<option value="202">分红</option>
										<!-- option value="203">期限</option -->
									</select>
								</td>
								<td class="t">日期：</td>
								<td><input class="itstyle lt it" id="infoDate"
									name="infoDate" value="" type="text" />(格式：yyyy-MM-dd)</td>
							</tr>
							<tr>
								<td class="t">数值：</td>
								<td><input class="itstyle lt it" id="value" name="value"
									value="" type="text" /></td>
								<td class="t"></td>
								<td></td>
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
