<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/tab.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/assignment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/product/popwindow.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";</script>
<script type="text/html" id="product_item">
		<div>
		<table width="100%">
			<thead>
				<tr>
					<th>客户姓名</th>
					<th>产品名称</th>
					<th>转让金额/万元</th>
					<th>联系人</th>
					<th>发布时间</th>
					<th>有效性</th>
					<th>查看详情</th>
				</tr>
			</thead>
			<tbody >
			<# for(i = 0; i < list.length; i++){ #> 
			<tr>
				<td><#=list[i].user.name#></td>
				<td><#=list[i].product.name#></td>
				<td><#=list[i].amount#></td>
				<td><#=list[i].contactor#></td>
				<td><#=list[i].assign_date#></td>
				<td id="">未转让</td>
				<td>
					<span class="sg_tab">
						<a href="<%=request.getContextPath()%>/admin/assignmentManagerDetail.jsp?amount=<#=list[i].amount#>&contactor=<#=list[i].contactor#>&tel=<#=list[i].tel#>&assign_type=<#=list[i].assign_type#>&pname=<#=list[i].product.name#>&releaseDate=<#=list[i].product.releaseDate#>&payType=<#=list[i].product.payType#>">详细</a>
					</span>
				</td>
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
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
<div id="main_right">
  <div class="con_table">
	<form action="<%=request.getContextPath()%>/product/assignment"
		method="post" id="assiForm">
		<input name="productId" id="productId" value="${param.productId}" type="hidden"  style="display: none;" />
			<div id="content">
			
			</div>
	</form>
  </div>
</div>
<br class=" clear" />
</div>
	<blockquote>&nbsp;</blockquote>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
