<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-你的专属财富经理</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>

<body>
<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	
<div id="main_right">

   <div class=" table_c" style=" display:block">

               <table border="0" cellpadding="0" cellspacing="0">
              <thead>
              <tr>
                <th height="30" colspan="7" align="left" bgcolor="#f1f1f1"> &nbsp;&nbsp;我的专属财富经理</th>
              </tr>
              </thead>
              <tbody>
                  <tr>
                  <td width="16%" rowspan="3" align="center"><img src="<%=request.getContextPath()%>/images/pic.jpg" width="88" height="110"  style="padding:3px; border:1px solid #e1e1e1"/></td>
                  <td width="14%" align="right"><strong>姓名：</strong></td>
                  <td width="12%">${fmanager.name}</td>
                  <td width="11%" align="right"><strong>职务：</strong></td>
                  <td width="22%">${fmanager.title}</td>
                  <td width="7%" align="right"><strong>学历：</strong></td>
                  <td width="18%">${fmanager.education}</td>
                </tr>
                  <tr>
                    <td align="right"><strong>执业证书编号：</strong></td>
                    <td>${fmanager.certificate}</td>
                    <td align="right"><strong>所属部门：</strong></td>
                    <td>${finVO.name}</td>
                    <td align="right"><strong>电话：</strong></td>
                    <td>${fmanager.tel}</td>
                  </tr>
                  <tr>
                    <td align="right"><strong>当前状态：</strong></td>
                    <td><a target=blank href=http://wpa.qq.com/msgrd?V=1&Uin=123691873&Site=三生有幸网客服&Menu=yes><img border="0" SRC=http://wpa.qq.com/pa?p=1:123691873:1 alt="点击这里给我发消息"></a></td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                    <td align="right">&nbsp;</td>
                    <td>&nbsp;</td>
                  </tr>
                   <tr>
                    <td colspan="7">${fmanager.info}</td>
                  </tr>                 
                 </tbody>
        </table>
        
   </div>  

</div>

<br class=" clear" />
</div>


<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
