<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<%@ taglib prefix="token" uri="spring/mvc/token"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>产品管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/addproduct.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---管理左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---管理左侧共用部份结束---->

	<div id="main_right">
		<div id="title_xi"></div>
		<div class="register">
			<div class="info_frm">
				<form id="addproductForm" name="addproductForm" method="post"
					action="<%=request.getContextPath()%>/product/add">
					<!-- token:token/ -->
					<table>
						<tbody>
							<tr>						
							<td class="t">产品文件：</td>
							<td>
								<input class="itstyle lt it" id="productfile" name="productfile" value="" type="file" />
								<input id="submitproductfile" type="button" value="添加产品">
								<img id="productfileloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
							</td>
							<!-- tr>
								<td colspan="2"><center>
										<span class="bnt_ok">添加</span>
									</center></td>
							</tr -->
						</tbody>
					</table>
				</form>
			</div>
		</div>
	</div>
<br class=" clear" />
</div>

	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
