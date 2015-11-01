<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高级筛选</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/product/product.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">

	<table class="ui compact table segment">
      <thead>
      <tr><th>产品代码</th>
      <th>产品名称</th>
      <th>发行时间</th>
      <th>期限</th>
      <th>利率</th>
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
              <td><#=products.list[i].term#>
			 <#if(63==products.list[i].termUnit){#>
				年<#}else if(64==products.list[i].termUnit){#>
				月
				<#}else{#>
				日
				<#}#>
				</td>		  
	            <td><#=products.list[i].rate#></td>
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
		<a class="item" name="1" href="javascript:void(0)"> <  </a>
		<# if( 0 < (products.pageNum-6) ){ #>
		  ...
		<# } #>
		<# for(i = 0>(products.pageNum-6)?0:(products.pageNum-6); i < ((products.pageNum+6)<products.pages?(products.pageNum+6):products.pages); i++){ #> 
			<# if(products.pageNum == i){ #>
				<a class="item" name="<#=i+1#>" href="javascript:void(0)" ><#=i+1#></a>
			<#} else {#>
            	<a class="item" name="<#=i+1#>" href="javascript:void(0)" ><#=i+1#></a>
		<# } }#>
		<# if((products.pageNum+6)<products.pages){ #>
		  ...
		<# } #>
          <a class="item" name="<#=products.pages#>" href="javascript:void(0)"> >  </a>
        </div>
</script>

</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div class="wrap">

    <div class="maintitle">
      <div id="title_font">高级筛选</div>
      <div class="dqwz">当前位置：<a href="<%=request.getContextPath()%>/">首页</a> &gt; 高级筛选</div>
    </div>
<div class="box14_c">
		<div class="t"><b>投资专区</b> &gt;
		<!--  span name="" id="">利率：不限<a href="javascript:void(0)">X</a></span><i>></i><span>期限：1月以下<a href="javascript:void(0)" >X</a></span -->
		</div>
        <span class="clear" style="height:0;overflow:hidden;"></span>
	<div class="box_d">
			<dl>
				<dt id="profitType">产品收益：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="42" href="javascript:void(0)" target="_self">固定收益</a><a id="43" href="javascript:void(0)" target="_self">浮动收益</a></dd>
			</dl>			
			<dl>
				<dt id="productType">金融机构：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="1" href="javascript:void(0)" target="_self">债券</a><a id="2" href="javascript:void(0)" target="_self">银行</a><a id="3" href="javascript:void(0)" target="_self">基金公司</a><a id="4" href="javascript:void(0)" target="_self">证券公司</a><a id="5" href="javascript:void(0)" target="_self">信托公司</a><a id="6" href="javascript:void(0)" target="_self">资产管理公司</a></dd>
			</dl>
			<dl>
				<dt id="state">产品状态：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="59" href="javascript:void(0)" target="_self">待定</a><a id="60" href="javascript:void(0)" target="_self">在售</a><a id="61" href="javascript:void(0)" target="_self">预约</a><a id="63" href="javascript:void(0)" target="_self">待发布</a><a id="64" href="javascript:void(0)" target="_self">正发布</a><a id="65" href="javascript:void(0)" target="_self">已发布</a><a id="62" href="javascript:void(0)" target="_self">售罄</a></dd>
			</dl>
			<dl>
				<dt id="minAmount">投资起点：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="1" href="javascript:void(0)" target="_self">50万以下</a><a id="2" href="javascript:void(0)" target="_self">50-100万</a><a id="3" href="javascript:void(0)" target="_self">100-300万</a><a id="4" href="javascript:void(0)" target="_self">300万以上</a></dd>
			</dl>
			<dl>
				<dt id="term">投资期限：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="1" href="javascript:void(0)" target="_self">12个月以下 </a><a id="2" href="javascript:void(0)" target="_self">12-24个月</a><a id="3" href="javascript:void(0)" target="_self">24-36个月</a><a id="4" href="javascript:void(0)" target="_self">36个月以上</a></dd>
			</dl>
			<dl>
				<dt id="rate">预期收益：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="1" href="javascript:void(0)" target="_self">6%以下</a><a id="2" href="javascript:void(0)" target="_self">6%-10%</a><a id="3" href="javascript:void(0)" target="_self">10%-15%</a><a id="4" href="javascript:void(0)" target="_self">15%以上</a></dd>
			</dl>	
            <dl>
				<dt id="direction">资金投向：</dt>
				<dd><a id="-1" style="color:#F60" href="javascript:void(0)" target="_self">不限</a><a id="49" href="javascript:void(0)" target="_self">金融市场</a><a id="52" href="javascript:void(0)" target="_self">房地产</a><a id="53" href="javascript:void(0)" target="_self">工商企业</a><a id="54" href="javascript:void(0)" target="_self">基础设施</a><a id="57" href="javascript:void(0)" target="_self">资金池</a>
				<a id="77" href="javascript:void(0)" target="_self">货币型</a><a id="78" href="javascript:void(0)" target="_self">债券型</a><a id="79" href="javascript:void(0)" target="_self">股票型</a><span ></span><a id="80" href="javascript:void(0)" target="_self">私募股权</a><a id="81" href="javascript:void(0)" target="_self">定向增发</a><a id="82" href="javascript:void(0)" target="_self">海外市场</a><a id="83" href="javascript:void(0)" target="_self">量化对冲</a><a id="84" href="javascript:void(0)" target="_self">指数型</a><a id="85" href="javascript:void(0)" target="_self">新三版</a><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="86" href="javascript:void(0)" target="_self">结构型</a><a id="87" href="javascript:void(0)" target="_self">混合型</a><a id="88" href="javascript:void(0)" target="_self">FOF</a><a id="58" href="javascript:void(0)" target="_self">其它</a></dd>
			</dl>		
			<dl>
				<dt>产品名称：</dt>
				<dd><input id="search_text" type="text" class="serch_text" style="margin-right:8px;height:24px;line-height:24px;font-size:14px;float:left;" value="<%=request.getParameter("search_text")==null?"":request.getParameter("search_text")%>"/><button id="search_text_button" type="button" style="height:30px;">查询 </button></dd>
			</dl>	

    </div>
</div>
<div id="tab_products" class="con" >
	
</div>

<br class=" clear" />
</div>
</div>


<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
