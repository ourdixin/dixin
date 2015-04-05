<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>高级筛选</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div class="padding_top_10"></div>
<div class="box14_c">
		<div class="t"><b>投资专区</b><i>></i><span>利率：不限<a href="javascript:void(0)">X</a></span><i>></i><span>期限：1月以下<a href="javascript:void(0)" >X</a></span></div>
	<div class="box_d">
			<dl>
				<dt>金融机构：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self">银行</a><a href="#" target="_self">基金公司</a><a href="#" target="_self">证券公司</a><a href="#" target="_self">信托公司</a><a href="#" target="_self">资产管理公司</a></dd>
			</dl>
			<dl>
				<dt>产品状态：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self">在售</a><a href="#" target="_self">预约</a><a href="#" target="_self">售星</a></dd>
			</dl>
			<dl>
				<dt>投资起点：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self">50万以下</a><a href="#" target="_self">50-100万</a><a href="#" target="_self">100-300万</a><a href="#" target="_self">300万以上</a></dd>
			</dl>
			<dl>
				<dt>投资期限：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self"> 12个月以上 </a><a href="#" target="_self">12-24个月</a><a href="#" target="_self">24-36个月</a><a href="#" target="_self">36个月以上</a></dd>
			</dl>
			<dl>
				<dt>预期收益：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self">6%以下</a><a href="#" target="_self">6%-10%</a><a href="#" target="_self">10%-15%</a><a href="#" target="_self">15%以上</a></dd>
			</dl>	
            <dl>
				<dt>资金投向：</dt>
				<dd><a href="#" target="_self">不限</a><a href="#" target="_self">金融市场</a><a href="#" target="_self">公益</a><a href="#" target="_self">金融机构</a><a href="#" target="_self">房地产</a><a href="#" target="_self">工商企业</a><a href="#" target="_self">基础设施</a><a href="#" target="_self">实业企业</a><a href="#" target="_self">保障房</a><a href="#" target="_self">酒店类</a><a href="#" target="_self">其它</a></dd>
			</dl>		
	

    </div>
</div>
<div>
			<table class="ui compact table segment">
              <thead>
              <tr>
              <th>产品名称</th>
              <th>金额</th>
              <th>联系人</th>
              <th>发布时间</th>
              <th>有效性</th>
              <th>操作</th>
              </tr>
              </thead>
              <tbody>
                  <tr>
                  <td>鑫泰山1号</td>
                  <td>20000</td>
                  <td>李小姐</td>
                  <td>2014-12-5</td>
                  <td>未转让</td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>小金库</td>
                  <td>2000</td>
                  <td>张先生 </td>
                  <td>2014-10-3</td>
                  <td>未转让</td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>白石20号基金 </td>
                  <td>5000</td>
                  <td>李小姐</td>
                  <td>2014-11-5</td>
                  <td>已转让</td>
                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-12-5</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>小金库</td>
                <td>20000</td>
                <td>李小姐</td>
                <td>2014-10-3</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>白石20号基金 </td>
                <td>2000</td>
                <td>张先生 </td>
                <td>2014-11-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>5000</td>
                <td>李小姐</td>
                <td>2014-12-5</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>小金库</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-10-3</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>白石20号基金 </td>
                <td>5000</td>
                <td>李小姐</td>
                <td>2014-11-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-12-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              </tbody>
        </table></div>
        
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

<br class=" clear" />
</div>


<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
