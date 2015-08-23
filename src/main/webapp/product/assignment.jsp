<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/assignment.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">
			<div>
				<table class="ui compact table segment">
					<thead>
						<tr>
							<th>产品名称</th>
							<th>金额</th>
							<th>联系人</th>
							<th>发行时间</th>
						</tr>
					</thead>
					<tbody>
						<# for(i = 0; i < list.length; i++){ #>
						<tr>
							<td><#=list[i].product.name#></td>
							<td><#=list[i].amount#></td>
							<td><#=list[i].contactor#></td>
							<td><#=list[i].assign_date#></td>
						</tr>
						<# } #>
					</tbody>
				</table>
			</div>
		<div class="page_menu">
		<a class="item">  <  </a>
			<# for(i = 0; i < pages; i++){ #> 
				<# if(pages.pageNum == i){ #>
					<a class="item" name="<#=id#>" href="javascript:void(0)"  ><#=i+1#></a>
				<#} else {#>
            		<a class="item" name="<#=id#>" href="javascript:void(0)" ><#=i+1#></a>
			<# } } #>
        <a class="item"> >  </a>
		</div>
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
	<form action="<%=request.getContextPath() %>/product/assignment" method="post" id="assiForm">
	<input  name="productId" id="productId" value="${param.productId}" type="hidden" />
		<ul class="ul_1">
			<li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">发布产品</li>
			<li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">已发布产品</li>
		</ul>
		<div id="tab1_con_1" class=" table_c" style=" display:block; clear:both;">
				<table width="100%" >
					<tbody>
						  <tr>
						      <td width="18%" height="30" align="right">产品名称：</td>
						      <td width="82%">${param.productName}</td>
						   </tr>
						  <!-- tr>
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
						  </tr -->
						  <tr>
						    <td height="30" align="right">转让条件：</td>
						    <td><input maxlength="" id="assign_type" name="assign_type" class="itstyle lt it" type="text" /></td>
						  </tr>
						  <tr>
						    <td height="30" align="right">金额：</td>
						    <td><input maxlength="" id="amount" name="amount" class="itstyle lt it" type="text" /> (万)</td>
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
			<div id="tab1_con_2" class="con" style="display: none; clear: both;">

			</div>
		</form>
</div>
<br class=" clear" />
</div>
<blockquote>&nbsp;</blockquote>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
