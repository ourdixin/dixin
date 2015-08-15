<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>9点财讯</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/pptBox.js"></script>
<script src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script src="http://libs.baidu.com/jqueryui/1.10.2/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/js.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/manage.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">

	<table class="ui compact table segment">
      <thead>
      <tr><th>产品代码</th>
      <th>产品名称</th>
      <th>发行时间</th>
	  <# if(getprofitType() == 42) {#>
      <th>期限</th>
      <th>利率</th>
	  <# }#>
	  <th>认购起点</th>
	  <# if(getprofitType() == 42) {#>
	   <th>付息方式</th>
	  <# }else{#>
	  <th>认购费</th>
	  <th>基金经理</th>
	  <# }#>
	  <th>资金投向</th>
      <th>状态</th>
      <th>推荐指数</th>
      <th>操作</th>
      </tr>
      </thead>
      <tbody>
      
		    <# for(i = 0; i < products.list.length; i++){ #> 
            <tr>
              <td><#=products.list[i].code#></td>
              <td><#=products.list[i].name#></td>
              <td>
				<#if(products.list[i].releaseDate >= products.list[i].invalidDate) {#>
					待定
				<#}else{#>
					<#=products.list[i].releaseDate#>
				<#}#>
			  </td>
			<# if(getprofitType() == 42) {#>
              <td>
				<#if(products.list[i].term > 0 ){#>
					<#=products.list[i].term#>
					<#if(63==products.list[i].termUnit){#>
						年
					<#}else if(64==products.list[i].termUnit){#>
						月
					<#}else{#>
						天
					<#}#>
				<#}#>
				</td>	
				<td><#=products.list[i].rate#></td>
			<#}#>	                
			  <td>
				<#if(products.list[i].minAmount>10000) {#>
				 <#=products.list[i].minAmount/10000#>万元
				<#}else{#>
				 <#=products.list[i].minAmount#>元
				<#}#>
			  </td>
 			  <# if(getprofitType() == 42) {#>
			  <td><#=products.list[i].payTypeInfo#> </td>
			  <#}else{#>
			  <td><#=products.list[i].buyFee#></td>
			  <td><#==products.list[i].fundManagerHtml#></td>
			  <#}#>
			  <td><#=products.list[i].directionInfo#></td>

			   <#if(products.list[i].state == 59){#>
              <td>待定</td>
				<#}else if(products.list[i].state == 60){#>
              <td>在售</td>
				<#}else if(products.list[i].state == 61){#>
              <td>预约</td>
				<#}else{#>
              <td>售罄</td>
				<#}#>
              <td>
              	<# for(j = 0; j < products.list[i].star; j ++){ #> 
              		<img src="<%=request.getContextPath()%>/images/xx.png" width="16" height="13" />
              	<# } #>
              </td>
              <td>
				<span class="sg_tab"><a href="<%=request.getContextPath()%>/admin/productview?productId=<#=products.list[i].id#>" >详细</a></span>
				<span class="sg_tab"><a href="<%=request.getContextPath()%>/admin/changeproduct?productId=<#=products.list[i].id#>" >修改</a></span>
				<#if(products.list[i].recommend == 0){#>
					<span class="sg_tab"><a href="javascript:void(0)" onclick="recommendproduct('<#=products.list[i].name#>',<#=products.list[i].id#>)" >首推</a></span>
				<#}else{#>
					<span class="sg_tab"><a href="javascript:void(0)" onclick="cancelrecommendproduct('<#=products.list[i].name#>',<#=products.list[i].id#>)" >首删</a></span>
				<# } #>
				<span class="sg_tab"><a href="javascript:void(0)" onclick="delProduct('<#=products.list[i].name#>',<#=products.list[i].id#>)" >删除</a></span>
			  </td>
            </tr>
		    <# } #>

      </tbody>
</table> 
        <div class="page_menu">
		<a class="item">  <  </a>
		<# for(i = 0; i < products.pages; i++){ #> 
			<# if(products.pages.pageNum == i){ #>
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
		<div id="tab1_con_<#=i+1#>" class="con" style=" display:block">
		<#} else {#>
		<div id="tab1_con_<#=i+1#>" class="con" style=" display:none">
		<# }  #>
               <# include('product_item' , result[i]) #>
		</div>
	<# } #>
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
<!---TAB部份----> 


      <div class="index_serch" style="width:700px">
         <div class="serch_a"><a id="fixIncome" href="javascript:void(0)" style="color:#F60">固定收益</a>&nbsp; <a id="UnfixIncome" href="javascript:void(0)" style="color:#F00">浮动收益</a></div>
          <form id="searchForm">
           <div class="serch_b">
           	<input id="search_text" type="text" class="serch_text"/>
           	<a id="query" href="javascript:void(0)" >查询</a> 
           </div>
           </form>
           <div id="tab_search" class="senior">
           	<a href="<%=request.getContextPath() %>/admin/product.jsp">理财产品高级筛选</a>
           </div>
           &nbsp;&nbsp;
           <div id="tab_search" class="senior">
           	<a href="<%=request.getContextPath() %>/admin/addFixProduct.jsp">添加固定收益产品</a>
           </div>
           &nbsp; &nbsp;          
           <div id="tab_search" class="senior">
           	<a href="<%=request.getContextPath() %>/admin/addFloatingProduct.jsp">添加浮动收益产品</a>
           	<a href="<%=request.getContextPath() %>/admin/import.jsp">批量导入产品</a>
           </div>   
           &nbsp;&nbsp;         
            <div id="tab_search" class="senior">
           	<a href="<%=request.getContextPath() %>/admin/import.jsp">批量导入产品</a>
           </div>   
                         
           </div>
			<ul class="ul_1" style="margin-top:10px;">
                <li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,7)">债 券</li>
                <li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,7)">银行理财</li>
                <li class="tab1_3_off"  id="tab1_3" onMouseOver="set_tab('tab1', 3 ,7)">基金</li>
                <li class="tab1_4_off" id="tab1_4" onMouseOver="set_tab('tab1', 4 ,7)">券商理财</li>
                <li class="tab1_5_off" id="tab1_5" onMouseOver="set_tab('tab1', 5 ,7)">信托</li>
                <li class="tab1_6_off"  id="tab1_6" onMouseOver="set_tab('tab1', 6 ,7)">资管</li>
                <!-- li class="tab1_7_off" id="tab1_7" onMouseOver="set_tab('tab1', 7 ,7)">p2p</li -->
            </ul>
         <div class="content">
      </div>     
    <br class="clear" />
            
     <!-- div id="tab1_con_7" class="con"  style=" display:none">       
       
     </div -->     
	<!---TAB结束---->
	
	</div>
	<br class=" clear" />
	</div>            

<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
