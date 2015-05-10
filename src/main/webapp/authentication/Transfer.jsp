<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/popwindow.js"></script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<div id="main_body">
<div class="padding_top_10"></div>
<div id="title_xi"></div>
<div id="title_font">产品转让</div>
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
                  <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                  <td>小金库</td>
                  <td>2000</td>
                  <td>张先生 </td>
                  <td>2014-10-3</td>
                  <td>未转让</td>
                  <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                  <td>白石20号基金 </td>
                  <td>5000</td>
                  <td>李小姐</td>
                  <td>2014-11-5</td>
                  <td>已转让</td>
                  <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
              </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-12-5</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>小金库</td>
                <td>20000</td>
                <td>李小姐</td>
                <td>2014-10-3</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>白石20号基金 </td>
                <td>2000</td>
                <td>张先生 </td>
                <td>2014-11-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>5000</td>
                <td>李小姐</td>
                <td>2014-12-5</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>小金库</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-10-3</td>
                <td>未转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>白石20号基金 </td>
                <td>5000</td>
                <td>李小姐</td>
                <td>2014-11-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
                </tr>
              <tr>
                <td>鑫泰山1号</td>
                <td>4500</td>
                <td>张先生 </td>
                <td>2014-12-5</td>
                <td>已转让</td>
                <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event);">详细</a></span></td>
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
