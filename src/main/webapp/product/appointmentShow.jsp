<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/product/appointmentShow.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="appointment">
			<table border="0" cellpadding="0" cellspacing="0"
				class="ui compact table segment">
				<thead>
					<tr>
						<th width="13%">预约产品</th>
						<th width="12%">预约日期</th>
						<th width="10%">预约金额</th>
						<th width="17%">备注</th>
					</tr>
				</thead>
				<tbody>
					<# for(i = 0; i < list.length; i++){ #> 
						<tr>
							<td><#=list[i].product.name#></td>
							<td><#=list[i].reserve_date#></td>
							<td><#=list[i].amount#>万元</td>
							<td><#=list[i].msg#></td>
						</tr>
					<# } #>
				</tbody>
			</table>
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
		<div class="con" style="display: block">

		</div>

	</div>

	<br class=" clear" />
</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</body>
</html>
