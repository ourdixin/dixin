<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品销售数据</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/purchasestatistics.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
<script type="text/html" id="products">

			<div class="con_table">
				<table width="1200">
					<thead>
						<tr>
							<th>产品名称</th>
							<th>类型</th>
							<th>购买人数</th>
							<th>购买份额</th>
							<th>销售金额</th>
							<th>状态</th>
							<th>备注</th>
							<th width=50>操作</th>
						</tr>
					</thead>
					<tbody>
					<# for(i = 0; i < list.length; i++){ #> 
						<tr>
							<td><#=list[i].product.name#></td>
							<td>
								<#if(list[i].product.profitId == 42) {#>
									固定
								<# } else { #>
									浮动
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
							<td>无</td>
							<td>
								<span><a href="<%=request.getContextPath()%>/admin/SalesData-detail.jsp?id=<#=list[i].productId#>">明细</a></span>
								<span><a href="<%=request.getContextPath()%>/admin/changeproduct?productId=<#=list[i].productId#>">修改</a></span>
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
