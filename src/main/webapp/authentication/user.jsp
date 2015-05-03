<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>用户中心</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/authentication/user.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">

	<table width="100%" border="0" cellpadding="0" cellspacing="0">
      <thead>
      <tr>
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
			  <td><a href="<#=products.list[i].fundManagerUrl#>" target="_blank">  <#=products.list[i].fundManager#></a> </td>
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
              <td><span class="sg_tab"><a href="<%=request.getContextPath()%>/product/view?productId=<#=products.list[i].id#>" >详细</a></span></td>
            </tr>
		    <# } #>

      </tbody>
</table> 
        <div class="page_menu">
		<a class="item">  <  </a>
		<# for(i = 0; i < products.pages; i++){ #> 
			<# if(products.pages.pageNum == i){ #>
				<a class="item" name="<#=id#>" href="#none"  ><#=i+1#></a>
			<#} else {#>
            	<a class="item" name="<#=id#>" href="#none" ><#=i+1#></a>
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
			<div class="jg font_red">
				<img src="<%=request.getContextPath()%>/images/ico_21.png"
					width="25" height="18" /><strong>您还未进行合格投资人风险测评调查问卷测试，<a
					href="#" style="color: #F00; text-decoration: underline">请点击此处进行了解</a></strong>
			</div>
			<div class="jg">
				<img src="<%=request.getContextPath()%>/images/ico_21.png"
					width="25" height="18" />您的个人相关信息尚未完善，<a href="#"
					style="color: #F00; text-decoration: underline">请点击此处完善您的信息</a>。我们会根据您提供的个人信息，提供专属客户服务。
			</div>
			<div class="jg2">
				<img src="<%=request.getContextPath()%>/images/ico_22.png"
					width="11" height="11" />正在发行的产品
			</div>
			<div class="con_table" style="display: block">

				<!-- table width="100%" border="0" cellpadding="0" cellspacing="0">
					<thead>
						<tr>
							<th width="13%">产品名称</th>
							<th width="12%">期限/月</th>
							<th width="10%">总规模（元）</th>
							<th width="17%">预期年化收益率（%）</th>
							<th width="17%">了解更多</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>衡阳城投二期</td>
							<td>12个月</td>
							<td>1000万元</td>
							<td>9%-9.3%</td>
							<td><span name="view" style="padding: 3px 15px; background: #F90"><a
									href="#">详细</a></span><span name="reservation" style="padding: 3px 15px; background: #F90"><a
									href="#">预约</a></span></td>
						</tr>

					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div -->
				
			</div>

		</div>

		<br class=" clear" />
	</div>


	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>