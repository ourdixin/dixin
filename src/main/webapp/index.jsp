<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>无标题文档</title>
<link href="css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/pptBox.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/js.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/index.js"></script>
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
              <td>缺失</td>
              <td><#=products.list[i].state#></td>
              <td>
              	<# for(j = 0; j < products.list[i].star; j ++){ #> 
              		<img src="images/xx.png" width="16" height="13" />
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

<script type="text/html" id="login_span_tpl">
	<#=result.name#>
<# if( result.userType == 10 ) {#>
	【普通会员】
<#} else {#>
	【认证会员】
<# }  #>
 	| <a href="<%=request.getContextPath() %>/user.jsp">我的121金融</a> | <a href="<%=request.getContextPath() %>/logout.jsp">安全退出</a>
</script>

</head>

<body>
<!---TOP头部共用部份---->
 <div class="header_top">
   <div class="body_width">
   <i>欢迎进入121金融个人理财中心</i>
   <span id='login_span'> <a href="<%=request.getContextPath() %>/authentication/login.jsp">登陆 </a>
   | <a href="<%=request.getContextPath() %>/authentication/register.jsp">免费注册</a></span>
   </div>
</div>
<div id="top"><div class="main_top"><a href="index.html"><img src="images/index_03.jpg" width="408" height="50" /></a></div></div>
<!---TOP结束---->
<div id="main_body" style="padding:0; width:1002px;">
<div class="index_login">
<div>登录121金融帐户</div>
<div>
<form id="loginForm">
<input id="username" name="username"  type="text"  value="请输入手机号或会员名" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"  class="log_user"/>
<input name="password" id="pass" type="password" value="" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" class="log_pass" /></div>
<dt><a href="<%=request.getContextPath() %>/authentication/forget_pass.html">忘记密码？</a> <input type="checkbox" name="checkbox" id="checkbox" />记住手机号码</dt>
<span><a class="bnt_ok" href="#none">登录</a></span>
</form>
<del><a href="<%=request.getContextPath() %>/authentication/register.jsp">点击这里注册</a>还没有注册过？</del>

</div>
<div id="xxx" style="width:1002px; height:358px;" >
     <script>
     var box =new PPTBox();
     box.width = 1002; //宽度
     box.height = 358;//高度
     box.autoplayer = 3;//自动播放间隔时间

     //box.add({"url":"图片地址","title":"悬浮标题","href":"链接地址"})
     box.add({"url":"images/index_10.jpg","href":"http://www.baidu.com/","title":"悬浮提示标题1"})
     box.add({"url":"images/tu3.jpg","href":"http://www.baidu.com/","title":"悬浮提示标题3"})
     box.add({"url":"images/tu4.jpg","href":"http://www.baidu.com/","title":"悬浮提示标题4"})
     box.show();
    </script>
</div>
<div><img src="images/index_14.jpg" width="333" height="103" /><a href="about.html"><img src="images/index_15.jpg" width="333" height="103" /></a><a href="transfer.html"><img src="images/index_17.jpg" width="334" height="103" /></a></div>
<!---TAB部份----> 

<ul class="ul_1" style="margin-top:10px;">
                <li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,7)">债 券</li>
                <li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,7)">银行理财</li>
                <li class="tab1_3_off"  id="tab1_3" onMouseOver="set_tab('tab1', 3 ,7)">基金</li>
                <li class="tab1_4_off" id="tab1_4" onMouseOver="set_tab('tab1', 4 ,7)">券商理财</li>
                <li class="tab1_5_off" id="tab1_5" onMouseOver="set_tab('tab1', 5 ,7)">信托</li>
                <li class="tab1_6_off"  id="tab1_6" onMouseOver="set_tab('tab1', 6 ,7)">资管</li>
                <!-- li class="tab1_7_off" id="tab1_7" onMouseOver="set_tab('tab1', 7 ,7)">p2p</li -->
          
         
            </ul>
            <div class="index_serch">
              <!-- div class="serch_a"><a href="#" style="color:#F60">固定收益</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" style="color:#F00">浮动收益</a></div -->
          <form id="searchForm">
           <div class="serch_b">
           	<input id="search_text" type="text" class="serch_text"/>
           	<a id="query" href="#" >查询</a> 
           </div>
           </form>
           <div id="tab_search" class="senior"><a href="<%=request.getContextPath() %>/product/product.jsp">理财产品高级筛选</a></div>
      
           </div>
           
            <!-- div id="tab_con_1" class="con" style=" display:block">
               <% // 债券产品列表  %>
			</div>
            <div id="tab_con_2" class="con"  style=" display:none">
			    <% // 银行理财产品列表  %>
			</div>
     	  <div id="tab_con_3" class="con"  style=" display:none">
     	       <% // 基金产品列表  %>       
		</div>
        
       <div id="tab_con_4" class="con"  style=" display:none">
			 <% // 券商理财产品列表  %> 
		</div>
         <div id="tab_con_5" class="con"  style=" display:none">
		 <% // 信托产品列表  %>
	</div>
         <div id="tab_con_6" class="con"  style=" display:none">
		<% // 资管产品列表  %>
	</div -->
         <!--  div id="tab_con_7" class="con"  style=" display:none">
		<% // p2p产品列表  %>
  </div -->
<!---TAB结束---->
<div class="index_about"><a onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.baidu.com/');" href="#"> <img src="images/index_28.jpg" width="151" height="29" /></a><a href="about.html"><img src="images/index_30.jpg" width="124" height="29" /></a></div>
</div>
<!---foot底部---->
<div class="footer">
<div class="footer_text">21金融 Copyright © 2014  All rights reserved  | 京ICP证20158984号  |  使用121金融前必读 </div>

</div>
<!---foot底部结束---->
</body>
</html>
	