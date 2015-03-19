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
<script type="text/html" id="product_bond">
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
      <# if(success){ #>
		    <# for(i = 0; i < result.list.length; i++){ #> 
            <tr>
              <td><#=result.list[i].code#></td>
              <td><#=result.list[i].name#></td>
              <td><#=result.list[i].releaseDate#></td>
              <td><#=result.list[i].term#>月</td>
              <# // TODO 设计确实 #>
              <td>缺失</td>
              <td><#=result.list[i].state#></td>
              <td>
              	<# for(j = 0; j < result.list[i].star; j ++){ #> 
              		<img src="images/xx.png" width="16" height="13" />
              	<# } #>
              </td>
              <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
            </tr>
		    <# } #>
	  <# } #>
      </tbody>
</table> 
        <div class="page_menu">
		<a class="item">  <  </a>
		<# for(i = 0; i < result.pages; i++){ #> 
          <a class="item"><#=i+1#></a>
		<# } #>
          <a class="item"> >  </a>
        </div>
</script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/index.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
 <div class="header_top">
   <div class="body_width"><i>欢迎进入121金融个人理财中心</i><span>李东伟【普通会员】 | 我的121金融 | 安全退出</span></div></div>
<div id="top"><div class="main_top"><a href="index.html"><img src="images/index_03.jpg" width="408" height="50" /></a></div></div>
<!---TOP结束---->
<div id="main_body" style="padding:0; width:1002px;">
<div class="index_login">
<div>登录121金融帐户</div>
<div><input name="" type="text"  value="请输入手机号或会员名" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}"  class="log_user"/>
<input name="" type="password" value="" onFocus="if(value==defaultValue){value='';this.style.color='#999'}" onBlur="if(!value){value=defaultValue;this.style.color='#999'}" class="log_pass" /></div>
<dt><a href="forget_pass.html">忘记密码？</a> <input type="checkbox" name="checkbox" id="checkbox" />记住手机号码</dt>
<span><a href="#">登录</a></span>
<del><a href="registration.html">点击这里注册</a>还没有注册过？</del>

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
                <li class="tab1_7_off" id="tab1_7" onMouseOver="set_tab('tab1', 7 ,7)">p2p</li>
          
         
            </ul>
            <div class="index_serch">
              <div class="serch_a"><a href="#" style="color:#F60">固定收益</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#" style="color:#F00">浮动收益</a></div>
           <div class="serch_b"><input name="" type="text"  class="serch_text"/><a href="#" >查</a> </div>
           <div class="senior"><a href="#">理财产品高级筛选</a></div>
      
           </div>
            <div id="tab1_con_1" class="con" style=" display:block">
               
               
               <% // 债券产品列表  %>
</div>
            <div id="tab1_con_2" class="con"  style=" display:none">
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
                  <tr>
                  <td>银行理财222222222</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
                   
</div>
     	  <div id="tab1_con_3" class="con"  style=" display:none">
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
                  <tr>
                  <td>基金3333</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
                   
</div>
        
       <div id="tab1_con_4" class="con"  style=" display:none">
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
                  <tr>
                  <td>券商理财4444</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
</div>
         <div id="tab1_con_5" class="con"  style=" display:none">
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
                  <tr>
                  <td>信托55555</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
</div>
         <div id="tab1_con_6" class="con"  style=" display:none">
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
                  <tr>
                  <td>资管6666</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
</div>
         <div id="tab1_con_7" class="con"  style=" display:none">
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
                  <tr>
                  <td>P2P77777</td>
                  <td>鑫泰山1号</td>
                  <td>2014-12-5</td>
                  <td>3月</td>
                  <td>15.00%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>201412220020</td>
                  <td>小金库</td>
                  <td>2014-10-3</td>
                  <td>3月</td>
                  <td>1.95%</td>
                  <td>未发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>201412160029</td>
                  <td>白石20号基金 </td>
                  <td>2014-11-5</td>
                  <td>2月</td>
                  <td>0.24%</td>
                  <td>已发行</td>
                  <td><img src="images/xx.png" width="16" height="13" /></td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>
                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412220020</td>
                <td>小金库</td>
                <td>2014-10-3</td>
                <td>3月</td>

                <td>1.95%</td>
                <td>未发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412160029</td>
                <td>白石20号基金 </td>
                <td>2014-11-5</td>
                <td>2月</td>
                <td>0.24%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>201412050937</td>
                <td>鑫泰山1号</td>
                <td>2014-12-5</td>
                <td>3月</td>
                <td>15.00%</td>
                <td>已发行</td>
                <td><img src="images/xx.png" width="16" height="13" /></td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table>
        <div class="page_menu">
          <a class="item">  <  </a>
          <a class="item">1</a>
          <a class="item">2</a>
          <a class="item">3</a>
          <a class="item">4</a>
          <a class="item">5</a>
          <a class="item">6</a>
          <a class="item"> >  </a>
        </div>
  </div>
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
	