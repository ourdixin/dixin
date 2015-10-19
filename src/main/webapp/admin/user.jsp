<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/user.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";</script>
<script type="text/html" id="user">
				<div class="con_table">
					<table width="100%">
						<thead>
							<tr>
								<th width="13%">注册时间</th>
								<th width="13%">客户姓名</th>
								<th width="12%">QQ</th>
								<th width="13%">地址</th>
								<th width="13%">是否通过认证</th>
								<th colspan="2">会员权限审核</th>
								<th width="19%">操作</th>
							</tr>
						</thead>
						<tbody>
						<# for(i = 0; i < list.length; i++){ #>
							<tr>
								<td><#=list[i].regDate#></td>
								<td><#=list[i].name#></td>
								<td><#=list[i].qq#></td>
								<td><#=list[i].address#></td>
								<td>
									<#if(list[i].authType >0){#>
										通过
									<#}else{#>
										未通过
									<#}#>
								</td>
								<td width="9%">
									<#if(list[i].institutionId >0){#>
										高级
									<#}else{#>
										普通
									<#}#>
								</td>
								<td width="8%"><span><a href="<%=request.getContextPath()%>/admin/updateAuthType?id=<#=list[i].id#>&authType=1">通过</a></span><i><a href="<%=request.getContextPath()%>/admin/updateAuthType?id=<#=list[i].id#>&authType=0">拒绝</a></i></td>
								<td><span><a href="<%=request.getContextPath()%>/admin/userDetail?id=<#=list[i].id#>">详细</a></span></span><i><a href="<%=request.getContextPath()%>/admin/addsalesdata.jsp?userid=<#=list[i].id#>">添加产品</a></i></td>
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
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
		<div id="main_right">
			<div >
			<span style="background: #d9b36a;"> <a class="item"  href="<%=request.getContextPath()%>/admin/addUser.jsp"  >添加用户</a></span>
			</div>
			<br>
			<div class="main_width">

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
