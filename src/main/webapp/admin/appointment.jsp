<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>客户产品预约</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->
<div id="main_right">

<div class="main_width">
<div class="con_table">
<table width="1200">
  <thead>
  <tr><th>提交时间</th>
  <th>客户代码</th>
  <th>客户姓名</th>
  <th>产品代码</th>
  <th>预约金额/万元</th>
  <th>预约打款日期</th>
  <th>联系</th>
  <th>联系记录</th>
  <th>结果</th>
  </tr>
  </thead>
  <tbody>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>102158415</td>
        <td>100</td>
        <td>2015-3-15</td>
        <td><span><a href="">拔打电话</a></span><br>
               <i><a href="">发短信</a></i>
               </td>
        <td><span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact.jsp">添加</a></span><i>
                <i><a href="<%=request.getContextPath()%>/admin/appointment-contact.jsp">更多</a></i>
                </td>
        <td><span><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp">处理</a></span>
        </td>
      </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>102158415</td>
        <td>100</td>
        <td>2015-3-15</td>
        <td><span><a href="">拔打电话</a></span><br>
        <i><a href="">发短信</a></i>
        </td>
        <td>考虑中<br><span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact.jsp">添加</a></span>
        <i><a href="<%=request.getContextPath()%>//admin/appointment-contact.jsp">更多</a></i>
        </td>
        <td>已购买<br><span><a href="">详细</a></span>
        <i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp">修改</a></i>
        </td>
      </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>102158415</td>
        <td>100</td>
        <td>2015-3-15</td>
        <td><span><a href="">拔打电话</a></span><br>
        <i><a href="">发短信</a></i>
        </td>
        <td>考虑中<br><span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact.jsp">添加</a></span>
        <i><a href="<%=request.getContextPath()%>//admin/appointment-contact.jsp">更多</a></i>
        </td>
        <td>购买中<br><span><a href="">进程</a></span>
        <i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp">修改</a></i>
        </td>
      </tr>
      <tr>
        <td>2015-3-15</td>
        <td>12015</td>
        <td>张三</td>
        <td>102158415</td>
        <td>100</td>
        <td>2015-3-15</td>
        <td><span><a href="">拔打电话</a></span><br>
        <i><a href="">发短信</a></i>
        </td>
        <td>考虑中<br><span><a href="<%=request.getContextPath()%>/admin/appointment-add-contact.jsp">添加</a></span>
        <i><a href="<%=request.getContextPath()%>//admin/appointment-contact.jsp">更多</a></i>
        </td>
        <td>不购买<br><span><a href="">进程</a></span>
        <i><a href="<%=request.getContextPath()%>/admin/appointment-deal.jsp">修改</a></i>
        </td>
      </tr>
      <tr>
    
  </tbody>
        </table>

</div>
</div>
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

<br class=" clear" />
</div>
<blockquote>&nbsp;</blockquote>
<blockquote>&nbsp;	</blockquote>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
