<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/appointment.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";</script>
<script type="text/html" id="appointment">
	<div class="con_table">
	<table width="1200">
		<thead>
			<tr>
				<th width="100">提交时间</th>
				<th width="50">客户姓名</th>
				<th width="100">产品名称</th>
				<th width="110">金额(万元)</th>
		 		<th width="90">打款日期</th>
		 		<th>预约留言</th>
				<th width="80">联系</th>
				<th width="50">联系记录</th>
				<th width="50">结果</th>
	 		</tr>
 		</thead>
   			<tbody>
   				<# for(i = 0; i < list.length; i++) { #>
   					<tr>
   						<td>
   							<#=list[i].createTime#>
   						</td>
   						<td>
   							<#=list[i].user.name#>
   						</td>
   						<td>
   							<#=list[i].product.name#>
   						</td>
   						<td>
   							<#=list[i].amount#>
   						</td>
   						<td>
   							<#=list[i].reserve_date#>
   						</td>
   						<td>
   							<#=list[i].msg#>
   						</td>
   						<td>
   							<span><a href="">拔打电话</a></span><br/>
              				<i><a href="">发短信</a></i>
   						</td>
   						<td>
							<#if(list[i].contact != null && list[i].contact.lastContactRecordVO != null){#>
   								<#=list[i].contact.lastContactRecordVO.record#>
							<#}#>
							<#if(list[i].contact != null){#>
   								<span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact?firstContactId=<#=list[i].contact.id#>&appointmentId=<#=list[i].id#>&userId=<#=list[i].userId#>">添加</a></span>
                				<i><a href="<%=request.getContextPath()%>/admin/appointment-contact?firstContactId=<#=list[i].contact.id#>&appointmentId=<#=list[i].id#>&userId=<#=list[i].userId#>">更多</a></i>
							<#}else{#>
   								<span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact?appointmentId=<#=list[i].id#>&userId=<#=list[i].userId#>">添加</a></span>
                				<i><a href="<%=request.getContextPath()%>/admin/appointment-contact?appointmentId=<#=list[i].id#>&userId=<#=list[i].userId#>">更多</a></i>
							<#}#>
   						</td>
   						
   							<#if(list[i].constant==104){#>
   								<td>
   									已购买<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=<#=list[i].user.name#>&reservationId=<#=list[i].id#>&productName=<#=list[i].product.name#>">详细</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=<#=list[i].id#>&constant=<#=list[i].constant#>&userId=<#=list[i].userId#>&productId=<#=list[i].product.id#>">修改</a></i>
   								</td>
   							<#}else if(list[i].constant==105){#>
   								<td>
   									购买中<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=<#=list[i].user.name}&reservationId=<#=list[i].id#>&productName=<#=list[i].product.name#>">进程</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=<#=list[i].id#>&constant=<#=list[i].constant#>&userId=<#=list[i].userId#>&productId=<#=list[i].product.id#>">修改</a></i>
   								</td>
   							<#}else if(list[i].constant==106){#>
   								<td>
   									不购买<br/>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-detail?userName=<#=list[i].user.name#>&reservationId=<#=list[i].id#>&productName=<#=list[i].product.name#>">进程</a></span>
        							<i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=<#=list[i].id}&constant=<#=list[i].constant#>&userId=<#=list[i].userId#>&productId=<#=list[i].product.id#>">修改</a></i>
   								</td>
							<#}else{#>
   								<td>
   									<span><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp?reservationId=<#=list[i].id#>&constant=<#=list[i].constant#>&userId=<#=list[i].userId#>&productId=<#=list[i].product.id#>">处理</a></span>
   								</td>
							<#}#>
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
