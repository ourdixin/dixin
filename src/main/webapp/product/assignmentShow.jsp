<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>产品转让</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/assignment.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/popwindow.js"></script>
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
              <c:forEach var="assignment" items= "${assignmentList.list}" varStatus="i">
  				 <tr>
  				 	  <td style="display:none" id="assign_type${i.index}">${assignment.assign_type}</td>
  				 	  <td style="display:none" id="tel${i.index}">${assignment.tel}</td>
  				 	  <td style="display:none" id="term${i.index}">${assignment.product.term}</td>
  				 	  <td style="display:none" id="payType${i.index}">${assignment.product.payType}</td>
	                  <td id="pname${i.index}">${assignment.product.name}</td>
	                  <td id="amount${i.index}">${assignment.amount}</td>
	                  <td id="contactor${i.index}">${assignment.contactor}</td>
	                  <td id="assign_date${i.index}"><fmt:formatDate pattern="yyyy-MM-dd" value="${assignment.assign_date}"/></td>
	                  <td id="">未转让</td>
	                  <td><span class="sg_tab"><a href="#none" onclick="testMessageBox(event,${i.index});">详细</a></span></td>
                </tr>
			  </c:forEach>
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
          <a class="item"></a>
        </div>

<br class=" clear" />
</div>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
