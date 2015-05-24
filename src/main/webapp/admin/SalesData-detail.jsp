<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品销售数据(明细)</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/salesdatadetail.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>"; var productId = ${param.id};
</script>
<script type="text/html" id="purchaselist">

			<div class="con_table">
				<table width="100%">
  				<thead>
  				  <tr>
    				<th>购买日期</th>
  					<th>客户姓名</th>
					<th>购买份额</th>
  					<th>购买金额</th>
  				  </tr>
  				</thead>
					<tbody>
					<# for(i = 0; i < list.length; i++){ #> 
						<tr>
							<td><#=list[i].buyDate#></td>
							<td><#=list[i].user.name#></td>
							<td><#=list[i].volume#></td>
							<td><#=list[i].amount#></td>
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
<blockquote>&nbsp;</blockquote>
<blockquote>&nbsp;	</blockquote>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
