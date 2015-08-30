<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>我的留言</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/authentication/myreply.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="myreply">
		<div class="con_table">
		<table>
			<thead>
 				 <tr>
    				<th>留言时间</th>
    				<th>问题分类</th>
    				<th>留言内容</th>
    				<th>客服回复</th>
    				<th>操作</th>
  				</tr>
  			</thead>
  			<tbody>
  				<# for(i = 0; i < list.length; i++){ #> 
  					<tr>
  						<td>
  							<#=list[i].msgTime#>
  						</td>
  						<td><#if(list[i].catogryId==74){#>
  									浮动类收益产品
  								<#}else if(list[i].catogryId==75){#>
  									固定类收益产品
								<#}else{#>
  									其他
								<#}#>
  						</td>
  						<td><#=list[i].msg#></td>
  						<td>
 							<#if(list[i].lastMessage && list[i].lastMessage.userVO.userType==25){#>
  								<#=list[i].lastMessage.msg#>
							<#}#>
						</td>
						<td>
							<#if(list[i].lastMessage && list[i].lastMessage.userVO.userType==25){#>
  								<i ><a href="<%=request.getContextPath()%>/authentication/myReplybyuser?id=<#=list[i].id#>&catogryId=<#=list[i].catogryId#>">回复</a></i></td>
							<#}else{#>
								<i style="background:gray;"><a href="<%=request.getContextPath()%>/authentication/myReplybyuser?id=<#=list[i].id#>&catogryId=<#=list[i].catogryId#>">追问</a></i>
							<#}#>
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
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
	
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
