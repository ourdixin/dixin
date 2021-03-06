<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品销售数据</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/purchasestatistics.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
<script type="text/html" id="hotproducts">
			<div class="con_table">
				<table width="1200">
					<thead>
						<tr>
							<th>产品名称</th>
							<th>类型</th>
							<th>派息日</th>
							<th>到期日</th>
							<th>购买人数</th>
							<th>购买份额</th>
							<th>销售金额</th>
							<th>状态</th>
							<th width=250>操作</th>
						</tr>
					</thead>
					<tbody>
				<#if(result != null) {#>
					<# for(i = 0; i < result.length; i++){ #> 
						<#if(result[i].product.daysNowToPayDate <= 7 || result[i].product.daysNowToDueDate <= 7) {#>						
							<tr 
							<#if(result[i].product.daysNowToDueDate <= 7) {#>
								style="background:red;" 
							<# } else { #>
								style="background:yellow;" 
							<# } #>
							>
							<td><#=result[i].product.name#></td>
							<td>
								<#if(result[i].product.profitId == 42) {#>
									固定
								<# } else { #>
									浮动
								<# } #>
							</td>
							<td>
							<#if(result[i].product.payDate < result[i].product.invalidDate) {#>
								<#=result[i].product.payDate#>  
							<# } else { #>
								待定
							<# } #>	
							</td>
							<td>
							<#if(result[i].product.dueDate < result[i].product.invalidDate) {#>
								<#=result[i].product.dueDate#>  
							<# } else { #>
								待定
							<# } #>								
							</td>
							<td><#=result[i].userNum#></td>
							<td><#=result[i].volume#></td>
							<td><#=result[i].amount#></td>
							<td>
								<#if(result[i].product.profitId == 42 && result[i].product.status == 121 ) { #>
									到期
								<# } else { #>
									存续期
								<# } #>
							</td>
							<td>
								<span><a href="<%=request.getContextPath()%>/admin/SalesData-detail.jsp?id=<#=result[i].productId#>">销售明细</a></span>
								<span><a href="<%=request.getContextPath()%>/admin/changeproduct?productId=<#=result[i].productId#>">修改产品</a></span>
								<span><a href="<%=request.getContextPath()%>/admin/addProductInfo.jsp?productId=<#=result[i].productId#>&code=<#=result[i].product.code#>&name=<#=result[i].product.name#>">添加产品信息</a></span>
							</td>
						</tr>
						<# } #>
					<# } #>
					<# } #>
					</tbody>
				</table>
			</div>
</script>
<script type="text/html" id="products">

			<div class="con_table">
				<table width="1200">
					<thead>
						<tr>
							<th>产品名称</th>
							<th>类型</th>
							<th>派息日</th>
							<th>到期日</th>
							<th>购买人数</th>
							<th>购买份额</th>
							<th>销售金额</th>
							<th>状态</th>
							<th width=250>操作</th>
						</tr>
					</thead>
					<tbody>
					<# for(i = 0; i < list.length; i++){ #> 
						<tr 

							<#if(list[i].product.daysNowToDueDate <= 7) {#>
								style="background:red;" 
							<# } else if(list[i].product.daysNowToPayDate <= 7 ) { #>
								style="background:yellow;" 
							<# } #>

						>
							<td><#=list[i].product.name#></td>
							<td>
								<#if(list[i].product.profitId == 42) {#>
									固定
								<# } else { #>
									浮动
								<# } #>
							</td>
							<td>
							<#if(list[i].product.payDate < list[i].product.invalidDate) {#>
								<#=list[i].product.payDate#>  
							<# } else { #>
								待定
							<# } #>	
							</td>
							<td>
							<#if(list[i].product.dueDate < list[i].product.invalidDate) {#>
								<#=list[i].product.dueDate#>  
							<# } else { #>
								待定
							<# } #>								
							</td>
							<td><#=list[i].userNum#></td>
							<td><#=list[i].volume#></td>
							<td><#=list[i].amount#></td>
							<td>
								<#if(list[i].product.profitId == 42 && list[i].product.status == 121 ) { #>
									到期
								<# } else { #>
									存续期
								<# } #>
							</td>
							<td>
								<span><a href="<%=request.getContextPath()%>/admin/SalesData-detail.jsp?id=<#=list[i].productId#>">销售明细</a></span>
								<span><a href="<%=request.getContextPath()%>/admin/changeproduct?productId=<#=list[i].productId#>">修改产品</a></span>
								<span><a href="<%=request.getContextPath()%>/admin/addProductInfo.jsp?productId=<#=list[i].productId#>&code=<#=list[i].product.code#>&name=<#=list[i].product.name#>">添加产品信息</a></span>
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
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
	<div id="main_right">
		<div class="hot_main_width">
		</div>
		
		<div class="main_width">
		</div>
	</div>

	<br class=" clear" />
</div>

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
