<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>9点财讯-最新理财产品资讯</title>
<link href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/superslide.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
<script type="text/javascript">
var HOST_PATH = "<%=request.getContextPath() %>";
</script>
<script type="text/html" id="product_item">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th>产品名称</th>
            <th width="120">发行时间</th>
			<# if(products.list.length > 0 && products.list[0].profitId == 42) {#>
            <th width="50">期限</th>
            <th width="116">利率</th>
			<#}#>
            <th width="60">认购起点</th>
            <th width="60">产品类型</th>
            <th width="60">操作</th>
          </tr>
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
			<# if(products.list[i].profitId == 42) {#>
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
            <td><#=products.list[i].productType#></td>
            <td class="red"><a href="<%=request.getContextPath()%>/product/view?productId=<#=products.list[i].id#>">了解更多</a></td>
          </tr>
          <# } #>
        </table>
		<p class="tablemore"><a href="<%=request.getContextPath() %>/product/product.jsp">更多产品 &gt;&gt;</a></p>
</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="banner">
	<c:if test="${null == user}">
	  <div class="loginbox">
	    <h2><strong>九点财讯</strong>助您获取年化收益</h2>
	    <h1>15%</h1>
	    <h3><span class="red">20</span>倍银行活期存款收益</h3>
	    <p><a href="<%=request.getContextPath() %>/authentication/register.jsp"><img src="images/loginboxbtn.png" width="216" height="42" vspace="12"></a></p>
	    <p align="right">已有帐号？<a href="<%=request.getContextPath() %>/authentication/login.jsp">立即登录</a></p>
	    
	  </div>
	</c:if>  
  <div class="banner">
      <div class="fullSlide">
        <div class="bd">
            <ul>
                <li _src="url(images/01.jpg)" style="background:#fde9a4 center 0 no-repeat;"><a href="<%=request.getContextPath() %>/product/product.jsp"></a></li>
                <li _src="url(images/02.jpg)" style="background:#c20d02 center 0 no-repeat;"><a href="<%=request.getContextPath() %>/authentication/quote.jsp"></a></li>
                <li _src="url(images/03.jpg)" style="background:#5ac6ea center 0 no-repeat;"><a href="<%=request.getContextPath() %>/authentication/transfer.jsp"></a></li>
            </ul>
        </div>
        <div class="hd"><ul></ul></div>
        <span class="prev"></span>
        <span class="next"></span>
      </div>
      <script type="text/javascript"> 
    $(".fullSlide").hover(function(){
        $(this).find(".prev,.next").stop(true, true).fadeTo("show", 0.5)
    },
    function(){
        $(this).find(".prev,.next").fadeOut()
    });
    $(".fullSlide").slide({
        titCell: ".hd ul",
        mainCell: ".bd ul",
        effect: "fold",
        autoPlay: true,
        autoPage: true,
        trigger: "click",
        startFun: function(i) {
            var curLi = jQuery(".fullSlide .bd li").eq(i);
            if ( !! curLi.attr("_src")) {
                curLi.css("background-image", curLi.attr("_src")).removeAttr("_src")
            }
        }
    });
    </script>
    </div>
</div>
<!-- 焦点图结束 -->
<div id="wrap">
  <div class="zst">
    <ul>
      <li>
        <h2><a href="<%=request.getContextPath() %>/product/product.jsp">金融超市</a></h2>
        <p>债券 银行理财 基金</p>
        <p>券商理财 信托  资管</p>
      </li>
      <li>
        <h2><a href="<%=request.getContextPath() %>/authentication/quote.jsp">金融折扣</a></h2>
        <p>A股开户 期货开户 港股开户</p>
        <p>交易费最低</p>
      </li>
      <li hidden  style="display: none;" >
        <h2><a href="<%=request.getContextPath() %>/authentication/transfer.jsp">产品转让</a></h2>
        <p>短期高回报产品</p>
        <p>长期稳定高收益产品</p>
      </li>
    </ul>
  </div>
  
  <div class="ind_table">
    <div class="gdsy">
      <p>合规金融产品</p>
      <p>远离非法集资</p>
      <p>本金金额保障</p>
      <p>固定期限收益</p>
    </div>
    <div class="ind_tablebox">
      <ul class="ind_tab">
        <li class="over" id="one1" onmouseover="setTab('one',1,2)">待发行</li>
        <li id="one2" onmouseover="setTab('one',2,2)">正发行</li>
        <!-- li id="one3" onmouseover="setTab('one',3,3)">已发行</li -->
      </ul>
      <div id="con_one_1" class="hometable">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_one_2" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <!-- div id="con_one_3" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div -->
    </div>
  </div>  
  <div class="ind_table">
    <div class="fdsy">
      <p>合规金融产品</p>
      <p>远离全权委托</p>
      <p>投资风险很低</p>
      <p>专业基金经理</p>
    </div>
    <div class="ind_tablebox">
      <ul class="ind_tab">
        <li class="over" id="two1" onmouseover="setTab('two',1,2)">待发行</li>
        <li id="two2" onmouseover="setTab('two',2,2)">正发行</li>
        <!-- li id="two3" onmouseover="setTab('two',3,3)">已发行</li -->
      </ul>
      <div id="con_two_1" class="hometable">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_two_2" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <!-- div id="con_two_3" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div -->
    </div>
  </div>
  
</div>
<!-- 表格结束 -->
<div class="links">
  <div class="linksbox">
    <h2>合作伙伴</h2>
    <ul style="display:table;margin:0 auto;">
      <li><a href="http://trust.ecitic.com/" target="_blank"><img src="images/zxzq.jpg"></a></li>
      <li><a href="http://www.fd-trust.com/" target="_blank"><img src="images/fzdyxt.jpg"></a></li>
      <li><a href="http://www.natrust.cn/home/cn/" target="_blank"><img src="images/gmxt.jpg"></a></li>
      <li><a href="http://www.zhongtaitrust.com/cn/index.jsp" target="_blank"><img src="images/ztxt.jpg"></a></li>
    </ul>
  </div>
  <div class="clear">
 </div>
</div>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
