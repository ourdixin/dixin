<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/assignment.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<!---用户左侧共用部份---->
<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
<!---用户左侧共用部份结束---->
<form action="<%=request.getContextPath() %>/product/assignment" method="post" id="assiForm">
	<div id="main_right">  
		<ul class="ul_1">
			<li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">发布产品</li>
			<li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">已发布产品</li>
		</ul>
		<div id="tab1_con_1" class=" table_c" style=" display:block; clear:both;">
				<table width="100%" >
					<tbody>
						  <tr>
						      <td width="18%" height="30" align="right">产品ID：</td>
						      <td width="82%"><input maxlength="" id="productId" name="productId" class="itstyle lt it" type="text" /></td>
						   </tr>
						  <tr>
						    <td height="30" align="right">产品类型/信托/资管：</td>
						    <td><input maxlength="" id="" name="" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">成立时间：</td>
						    <td><input maxlength="" id="" name="" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">期限：</td>
						    <td><input maxlength="" id="" name="" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">收益分配：</td>
						    <td><input maxlength="" id="" name="" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">金额：</td>
						    <td><input maxlength="" id="amount" name="amount" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">联系人：</td>
						    <td><input maxlength="" id="contactor" name="contactor" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">联系电话：</td>
						    <td><input maxlength="" id="tel" name="tel" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">转让时间：</td>
						    <td><input  id="assign_date" name="assign_date" class="itstyle lt it" type="date" /></td>
						  </tr>
						  <tr>
						    <td height="55" align="right">&nbsp;</td>
						    <td><span class="bnt_ok" style="padding:5px 50px; font-size:14px;">发布</span></td>
						  </tr>
			      </tbody>
			</table>
		</div>
		<br class=" clear" />
	</div>
</form>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
