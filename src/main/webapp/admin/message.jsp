<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>在线留言</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/message.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="message">
<div class="con_table">
	<table>
		<thead>
			<tr>
			<th>留言时间</th>
			<th>客户姓名</th>
			<th>分类问题</th>
			<th>留言内容</th>
			<th>最后留言</th>
			<th>内容回复</th>
			</tr>
 		</thead>
  			<tbody>
  				<# for(i = 0; i < list.length; i++){ #> 
  					<tr>
  						<td>
  							<#=list[i].msgTime#>
  						</td>
  						<td><#=list[i].userVO.name#></td>
  						<td>
  								<#if(list[i].catogryId==74){#>
  									浮动类收益产品
  								<#}else if(list[i].catogryId==75){#>
  									固定类收益产品
  								<#}else{#>
  									其他
  								<#}#>
  						</td>
  						<td><#=list[i].msg#></td>
  							<#if(list[i].lastMessage == null || list[i].lastMessage.userVO.userType==25){#>
  								<td></td>
  							<#}else{#>
  								<td><#=list[i].lastMessage.msg#></td>
							<#}#>
  							<#if(list[i].lastMessage == null || list[i].lastMessage.userVO.userType!=25){#>
  								<td><i><a href="<%=request.getContextPath()%>/admin/MessageReply?id=<#=list[i].id#>&catogryId=<#=list[i].catogryId#>">回复</a></i></td>
							<#}else{#>
  								<td><i style="background:gray;"><a href="<%=request.getContextPath()%>/admin/MessageReply?id=<#=list[i].id#>&catogryId=<#=list[i].catogryId#>">回复</a></i></td>
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
