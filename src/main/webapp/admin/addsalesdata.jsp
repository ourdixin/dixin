<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="token" uri="spring/mvc/token"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<!-- script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script -->
<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/addsalesdata.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->

	<div id="main_body">
		<div id="title_xi"></div>
		<div class="register">
				<form id="addForm" name="addproductForm" method="post"
					action="<%=request.getContextPath()%>/product/addsalesdata">
					<!-- token:token/ -->
					<table>
						<tbody>
							<tr width="100%">
								<td class="t"  width="80px">产品：</td>
								<td>
									<input id="productName" name="productName" value="" type="text" autocomplete="on" />
									<input id="productId" name="productId" type="hidden" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
								<td class="t"  width="80px">购买时间：</td>
								<td><input class="itstyle lt" id="buyDate" name="buyDate" value="2100-01-01" type="text" width="100px"/>(格式：yyyy-MM-dd)</td>
							</tr>
							<tr>
								<td class="t">数量：</td>
								<td><input class="itstyle lt" id="volume" name="volume" value="" type="text" />(单位:份)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td class="t">金额：</td>
								<td><input class="itstyle lt" id="amount" name="amount" value="" type="text" />(单位:万元)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td class="t">营销机构：</td>
								<td><select class="itstyle" name="institutionId" id="institutionId"  width="100px">
										<option value="0" selected>无</option>
								</select></td>
								<td class="t"></td>
								<td></td>
							</tr>
							<tr>
								<td colspan="4"><center><span class="bnt_ok">添加</span></center></td>
							</tr>
						</tbody>
					</table>

				</form>

		</div>


		<br class=" clear" />
	</div>



	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
