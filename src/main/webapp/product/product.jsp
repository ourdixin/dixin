<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高级筛选</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/product/product.js"></script>
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
              <td><#=products.list[i].releaseDate#></td>
              <td><#=products.list[i].term#>月</td>
              <# // TODO 设计确实 #>
              <td><#=products.list[i].rateA#></td>
              <td><#=products.list[i].state#></td>
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
<div id="main_body">
<div class="padding_top_10"></div>
<div class="box14_c">
		<div class="t"><b>投资专区</b><i>></i>
		<!--  span name="" id="">利率：不限<a href="javascript:void(0)">X</a></span><i>></i><span>期限：1月以下<a href="javascript:void(0)" >X</a></span -->
		</div>
	<div class="box_d">
			<dl>
				<dt id="productType">金融机构：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="2" href="#" target="_self">银行</a><a id="3" href="#" target="_self">基金公司</a><a id="4" href="#" target="_self">证券公司</a><a id="5" href="#" target="_self">信托公司</a><a id="6" href="#" target="_self">资产管理公司</a></dd>
			</dl>
			<dl>
				<dt id="state">产品状态：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="60" href="#" target="_self">在售</a><a id="61" href="#" target="_self">预约</a><a id="62" href="#" target="_self">售罄</a></dd>
			</dl>
			<dl>
				<dt id="minAmount">投资起点：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="1" href="#" target="_self">50万以下</a><a id="2" href="#" target="_self">50-100万</a><a id="3" href="#" target="_self">100-300万</a><a id="4" href="#" target="_self">300万以上</a></dd>
			</dl>
			<dl>
				<dt id="term">投资期限：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="1" href="#" target="_self">12个月以下 </a><a id="2" href="#" target="_self">12-24个月</a><a id="3" href="#" target="_self">24-36个月</a><a id="4" href="#" target="_self">36个月以上</a></dd>
			</dl>
			<dl>
				<dt id="rate">预期收益：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="1" href="#" target="_self">6%以下</a><a id="2" href="#" target="_self">6%-10%</a><a id="3" href="#" target="_self">10%-15%</a><a id="4" href="#" target="_self">15%以上</a></dd>
			</dl>	
            <dl>
				<dt id="direction">资金投向：</dt>
				<dd><a id="-1" href="#" target="_self">不限</a><a id="49" href="#" target="_self">金融市场</a><a id="50" href="#" target="_self">公益</a><a id="51" href="#" target="_self">金融机构</a><a id="52" href="#" target="_self">房地产</a><a id="53" href="#" target="_self">工商企业</a><a id="54" href="#" target="_self">基础设施</a><a id="55" href="#" target="_self">实业企业</a><a id="56" href="#" target="_self">保障房</a><a id="57" href="#" target="_self">酒店类</a><a id="58" href="#" target="_self">其它</a></dd>
			</dl>		
	

    </div>
</div>
<div id="tab_products" class="con" >
	
</div>

<br class=" clear" />
</div>


<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
