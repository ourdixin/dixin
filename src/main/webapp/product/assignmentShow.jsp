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
<script type="text/javascript" src="<%=request.getContextPath()%>/js/template-native.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/assignmentShow.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/product/popwindow.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
<script type="text/html" id="assignment">
	<div>
			<table class="ui compact table segment">
              <thead>
              <tr>
              <th>产品名称</th>
              <th>金额(万)</th>
              <th>联系人</th>
              <th>发布时间</th>
              <th>有效性</th>
              <th>操作</th>
              </tr>
              </thead>
              <tbody>
             <# for(i = 0; i < list.length; i++){ #> 
  				 <tr>
  				 	  <td style="display:none" id="assign_type<#=i#>"><#=list[i].assign_type#></td>
  				 	  <td style="display:none" id="tel<#=i#>"><#=list[i].tel#></td>
  				 	  <td style="display:none" id="term<#=i#>"><#=list[i].product.term#></td>
  				 	  <td style="display:none" id="payType<#=i#>"><#=list[i].product.payType#></td>
	                  <td id="pname<#=i#>"><#=list[i].product.name#></td>
	                  <td id="amount<#=i#>"><#=list[i].amount#></td>
	                  <td id="contactor<#=i#>"><#=list[i].contactor#></td>
	                  <td id="assign_date<#=i#>"><#=list[i].assign_date#></td>
	                  <td id="">未转让</td>
	                  <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event,<#=i#>);">详细</a></span></td>
                </tr>
			  <# } #>
              </tbody>
        </table></div>
        
        <div class="page_menu">
		<a class="item">  <  </a>
		<# for(i = 0; i < pages; i++){ #> 
			<# if(pages.pageNum == i){ #>
				<a class="item" name="<#=id#>" href="javascript:void(0)"  ><#=i+1#></a>
			<#} else {#>
            	<a class="item" name="<#=id#>" href="javascript:void(0)" ><#=i+1#></a>
		<# } } #>
          <a class="item"> >  </a>
        </div>
</script>
</head>

<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<!---用户左侧共用部份---->
<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
<!---用户左侧共用部份结束---->
<div id="main_right">
<div class="con" style="display: block">
<!-- div id="title_font">产品转让</div>
<div>
			<table class="ui compact table segment">
              <thead>
              <tr>
              <th>产品名称</th>
              <th>金额(万)</th>
              <th>联系人</th>
              <th>发布时间</th>
              <th>有效性</th>
              <th>操作</th>
              </tr>
              </thead>
              <tbody>
              <# for(i = 0; i < list.length; i++){ #> 
  				 <tr>
  				 	  <td style="display:none" id="assign_type<# =i #>"><#=list[i].assign_type#></td>
  				 	  <td style="display:none" id="tel<# =i #>"><#=list[i].tel#></td>
  				 	  <td style="display:none" id="term<# =i #>"><#=list[i].product.term#></td>
  				 	  <td style="display:none" id="payType<# =i #>"><#=list[i].product.payType#></td>
	                  <td id="pname<# =i #>"><#=list[i].product.name#></td>
	                  <td id="amount<# =i #>"><#=list[i].amount#></td>
	                  <td id="contactor<# =i #>"><#=list[i].contactor#></td>
	                  <td id="assign_date<# =i #>"><#=list[i].assign_date#></td>
	                  <td id="">未转让</td>
	                  <td><span class="sg_tab"><a href="javascript:void(0)" onclick="testMessageBox(event,<# =i #>);">详细</a></span></td>
                </tr>
			  <# } #>
              </tbody>
        </table></div>
        
          <div class="page_menu">
          <a class="item"> < </a>
          <c:forEach var="i" begin="0" end="${assignmentList.pages}">
         	 <a class="item">${i+1}</a>
          </c:forEach>
          <a class="item"> > </a>
        </div -->
     </div>
</div>
<br class=" clear" />
</div>
<!---foot底部---->
<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
<!---foot底部结束---->
</body>
</html>
