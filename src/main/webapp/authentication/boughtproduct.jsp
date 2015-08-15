<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-已购买的产品</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" 
    rel="stylesheet" type="text/css" />
<script type="text/javascript" 
     src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" 
     src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/authentication/boughtproduct.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">
	<table border="0" cellpadding="0" cellspacing="0" class="ui compact table segment">
      <thead>
      <tr>
         <th>产品名称</th>
         <th>购买金额</th>
		<# if(id == 43) {#> 
		 <th>购买份额</th>
		<#}#> 
         <th>浮动盈亏</th>
         <th>操作</th>
      </tr>
      </thead>
      <tbody>
      
		    <# for(i = 0; i < purchaseList.list.length; i++){ #> 
            <tr>
              <td><#=purchaseList.list[i].product.name#></td>
			  <td>
				<#if(purchaseList.list[i].amount>10000) {#>
				 <#=purchaseList.list[i].amount/10000#>万元
				<#}else{#>
				 <#=purchaseList.list[i].amount#>元
				<#}#>
			  </td>
			  <# if(id == 43) {#> 
			  	<td><#=purchaseList.list[i].volume#></td>
			  <#}#> 
			  <td><#=purchaseList.list[i].pnl#>元</td>
              <td><span style="padding: 3px 15px; background: #F90">
				<a href="<%=request.getContextPath()%>/product/view?productId=<#=purchaseList.list[i].product.id#>" >详细</a></span>
				<span name="reservation" style="padding: 3px 15px; background: #F90"><a	href="<%=request.getContextPath()%>/product/assignment.jsp?productId=<#=purchaseList.list[i].product.id#>&productName=<#=purchaseList.list[i].product.name#>">转让</a></span>
				</td>
            </tr>
		    <# } #>

      </tbody>
</table> 
        <div class="page_menu">
		<a class="item">  <  </a>
		<# for(i = 0; i < purchaseList.pages; i++){ #> 
			<# if(purchaseList.pages.pageNum == i){ #>
				<a class="item" name="<#=id#>" href="javascript:void(0)"  ><#=i+1#></a>
			<#} else {#>
            	<a class="item" name="<#=id#>" href="javascript:void(0)" ><#=i+1#></a>
		<# } } #>
          <a class="item"> >  </a>
        </div>
</script>
<script type="text/html" id="product_list">
	<# for(i = 0; i < result.length; i++){ #> 
		<# if( i==0){ #>
		<div id="tab1_con_<#=i+1#>" class="con" style=" display:block; clear:both;">
		<#} else {#>
		<div id="tab1_con_<#=i+1#>" class="con" style=" display:none; clear:both;">
		<# }  #>
               <# include('product_item' , result[i]) #>
		</div>
	<# } #>
</script>

</head>
<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->

	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	
	<div  id="main_right">
		<ul class="ul_1">
			<li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">固定收益</li>
		    <li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">浮动收益</li>
		</ul>
		<!-- div id="tab1_con_1" class="con" style=" display:block; clear:both;">
		 
		</div>
		<div id="tab1_con_2" class="con"  style=" display:none;clear:both;">
		 
		</div -->
	</div>
	
	    
	 
	<br class=" clear" />
</div>
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
