<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>9点财讯-最新理财产品资讯</title>
<link href="css/style.css" rel="stylesheet" type="text/css">
<script src="http://libs.baidu.com/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="js/superslide.2.1.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/main.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="product_item">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <th>产品名称</th>
            <th>发行时间</th>
			<# if(products.list.length > 0 && products.list[0].profitId == 42) {#>
            <th>期限</th>
            <th>利率</th>
			<#}#>
            <th>认购起点</th>
            <th>产品类型</th>
            <th>操作</th>
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
<div id="header">
  <div class="topbar">
    <div class="topnav">
      <div class="tel">免费专业顾问：400-6262-121</div>
      
      <div class="subnav">
      	<c:if test="${null == user}">
      		<a href="<%=request.getContextPath() %>/authentication/login.jsp">登录</a> | <a href="<%=request.getContextPath() %>/authentication/register.jsp">免费注册</a> | <a href="<%=request.getContextPath() %>/authentication/regarding.jsp">关于我们</a>
      	</c:if> 
      	<c:if test="${null != user}"> 	 
      		   	${user.secUserName}
	   	<c:if test="${user.userType == 10}">
	   		【普通会员】
	   	</c:if>  
	   	<c:if test="${user.userType == 25}">
	   		【管理员】
	   	</c:if>
	   	 | <a href="<%=request.getContextPath()%>/authentication/user.jsp">我的121金融</a>
	   	 | <a href="<%=request.getContextPath()%>/product/customer.jsp">在线客服</a> 
	   	 | <a href="<%=request.getContextPath()%>/authentication/logout">安全退出</a>
	   	 | <a href="<%=request.getContextPath() %>/authentication/regarding.jsp">关于我们</a>
	    </c:if> 
      </div>
    </div>
  </div>
  <div class="logobar">
    <div class="logo"><img src="images/logo.png"><img src="images/sloga.png"></div>
    <div class="topsearch">
        <table width="304" border="0" cellspacing="0" cellpadding="0"><form name="form1" method="post" action="<%=request.getContextPath() %>/product/product.jsp">
          <tr>
            <td width="242"><input type="text" name="textfield" id="textfield">
            <input type="submit" name="button" id="button" value="提交"></td>
            <td width="62"><a href="<%=request.getContextPath() %>/product/product.jsp">理财产品<br>高级筛选</a></td>
          </tr></form>
        </table>
    </div>
  </div>
</div>
<!-- 头部结束，焦点图开始 -->
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
                <li _src="url(images/02.jpg)" style="background:#c20d02 center 0 no-repeat;"><a href="<%=request.getContextPath() %>/authentication/regarding.jsp"></a></li>
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
        <p>短期高回报产品</p>
        <p>长期稳定高收益产品</p>
      </li>
      <li>
        <h2><a href="<%=request.getContextPath() %>/authentication/regarding.jsp">金融折扣</a></h2>
        <p>短期高回报产品</p>
        <p>长期稳定高收益产品</p>
      </li>
      <li>
        <h2><a href="<%=request.getContextPath() %>/authentication/transfer.jsp">产品转让</a></h2>
        <p>短期高回报产品</p>
        <p>长期稳定高收益产品</p>
      </li>
    </ul>
  </div>
  
  <div class="ind_table">
    <div class="gdsy">
      <p>标准化金融产品</p>
      <p>实力公司背景</p>
      <p>本金金额全保障</p>
      <p>锁定极端亏损</p>
    </div>
    <div class="ind_tablebox">
      <ul class="ind_tab">
        <li class="over" id="one1" onmouseover="setTab('one',1,3)">待发行</li>
        <li id="one2" onmouseover="setTab('one',2,3)">正发行</li>
        <li id="one3" onmouseover="setTab('one',3,3)">已发行</li>
      </ul>
      <div id="con_one_1" class="hometable">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_one_2" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_one_3" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
    </div>
  </div>  
  <div class="ind_table">
    <div class="fdsy">
      <p>标准化金融产品</p>
      <p>实力公司背景</p>
      <p>本金金额全保障</p>
      <p>锁定极端亏损</p>
    </div>
    <div class="ind_tablebox">
      <ul class="ind_tab">
        <li class="over" id="two1" onmouseover="setTab('two',1,3)">待发行</li>
        <li id="two2" onmouseover="setTab('two',2,3)">正发行</li>
        <li id="two3" onmouseover="setTab('two',3,3)">已发行</li>
      </ul>
      <div id="con_two_1" class="hometable">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_two_2" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
      <div id="con_two_3" class="hometable" style="display:none;">
		 <table width="100%" border="0" cellspacing="0" cellpadding="0">
		 </table>
      </div>
    </div>
  </div>
  
</div>
<!-- 表格结束 -->
<div class="links">
  <div class="linksbox">
    <h2>合作伙伴</h2>
    <ul>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
      <li><a href="#" target="_blank"><img src="images/links.jpg"></a></li>
    </ul>
  </div>
  <div class="clear"></div>
</div>
<div id="footer">9点财讯 Copyright © 2014 All rights reserved  | <a href="http://www.miibeian.gov.cn"  target="_blank">京ICP证20158984号 </a> | <a href="<%=request.getContextPath()%>/authentication/reading.jsp"  target="_blank">使用9点财讯前必读</a></div>
</body>
</html>
