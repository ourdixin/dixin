<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改产品</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>

<style type="text/css">
div {
	width: 100%;
}
</style>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/admin/changeproduct.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";</script>
<script type="text/javascript">	var productInfo = "${product.info}";</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->

	<div id="main_body">
		<div id="title_xi"></div>
		<div class="register">
			<div class="info_frm">
				<form id="updateproductForm" name="updateproductForm" method="post"
					action="<%=request.getContextPath()%>/product/update">
					<input  name="id" id="id" value="${product.id}" type="hidden" />
					<table>
						<tbody>
							<tr>
								<td class="t" width="100">产品代码：</td>
								<td><input class="itstyle lt it" id="code" name="code"
									value="${product.code}" type="text" /></td>
								<td class="t" width="100">产品名称：</td>
								<td><input class="itstyle lt it" id="name" name="name"
									value="${product.name}" type="text" /></td>
							</tr>
							<tr>
								<td class="t">发行时间：</td>
								<td><input class="itstyle lt it" id="releaseDate"
									name="releaseDate" value="<fmt:formatDate value="${product.releaseDate}" pattern="yyyy-MM-dd HH:mm"/>" type="text" />(格式：yyyy-MM-dd HH:ss)</td>
								<td class="t">销售截止日期：</td>
								<td><input class="itstyle lt it" id="endDate"
									name="endDate" value="<fmt:formatDate value="${product.endDate}" pattern="yyyy-MM-dd HH:mm"/>" type="text" />(格式：yyyy-MM-dd HH:ss)</td>
							</tr>

							<tr>
								<td class="t">产品规模：</td>
								<td><input class="itstyle lt it" id="amount" name="amount"
									value="<fmt:formatNumber value="${product.amount/100000000}" minFractionDigits="0"/>" type="text" />(单位:亿)</td>
								<td class="t">资金投向：</td>
								<td><select class="itstyle"
									name="direction" id="direction">
										<option value="77" <c:if test="${product.direction==77}">selected</c:if> >货币型</option>
										<option value="78" <c:if test="${product.direction==78}">selected</c:if> >债券型</option>
										<option value="79" <c:if test="${product.direction==79}">selected</c:if> >股票型</option>
										<option value="80" <c:if test="${product.direction==80}">selected</c:if> >私募股权</option>
										<option value="81" <c:if test="${product.direction==81}">selected</c:if> >定向增发</option>
										<option value="82" <c:if test="${product.direction==82}">selected</c:if> >海外市场</option>
										<option value="83" <c:if test="${product.direction==83}">selected</c:if> >量化对冲</option>
										<option value="84" <c:if test="${product.direction==84}">selected</c:if> >指数型</option>
										<option value="58" <c:if test="${product.direction==58}">selected</c:if> >其它</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">投资起点：</td>
								<td><input class="itstyle lt it" id="minAmount"
									name="minAmount" value="<fmt:formatNumber value="${product.minAmount/10000}" minFractionDigits="0"/>" type="text" />(单位:万)</td>
								<td class="t">递增金额：</td>
								<td><input class="itstyle lt it" id="appendAmount"
									name="appendAmount" value="<fmt:formatNumber value="${product.appendAmount/10000}" minFractionDigits="0"/>" type="text" />(单位:万)</td>
							</tr>
							<tr hidden>
								<!--  td class="t">续存：</td>
								<td><input class="itstyle lt it" id="appendTerm" name="appendTerm"
									value="" type="text" width="80" /> <select class="itstyle"
									name="appendTermUnit" id="appendTermUnit">
										<option value="63">年</option>
										<option value="64" selected>月</option>
										<option value="65">天</option>
								</select></td -->
								<td hidden class="t">收益类型：</td>
								<td hidden><select class="itstyle"
									name="profitId" id="profitId">
										<option value="43" selected>浮动</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">产品类别：</td>
								<td><select class="itstyle" name="catogryId" id="catogryId">
										<option value="31" <c:if test="${product.catogryId==31}">selected</c:if> >债券</option>
										<option value="32" <c:if test="${product.catogryId==32}">selected</c:if> >银行理财</option>
										<option value="33" <c:if test="${product.catogryId==33}">selected</c:if> >基金</option>
										<option value="34" <c:if test="${product.catogryId==34}">selected</c:if> >券商理财</option>
										<option value="35" <c:if test="${product.catogryId==35}">selected</c:if> >信托</option>
										<option value="36" <c:if test="${product.catogryId==36}">selected</c:if> >资管</option>
								</select></td>
								<td class="t">推荐指数：</td>
								<td><select class="itstyle" name="star" id="star">
										<option value="1" <c:if test="${product.star==1}">selected</c:if> >一星</option>
										<option value="2" <c:if test="${product.star==2}">selected</c:if> >二星</option>
										<option value="3" <c:if test="${product.star==3}">selected</c:if> >三星</option>
										<option value="4" <c:if test="${product.star==4}">selected</c:if> >四星</option>
										<option value="5" <c:if test="${product.star==5}">selected</c:if> >五星</option>
								</select></td>
							</tr>
							<tr>
								<td class="t" width="100">产品认购费：</td>
								<td><input class="itstyle lt it" id="buyFee" name="buyFee"
									value="${product.buyFee}" type="text" />(文本型描述)</td>
								<td class="t" width="100">封闭期限：</td>
								<td><input class="itstyle lt it" id="closeTerm" name="closeTerm"
									value="${product.closeTerm}" type="text" /><select class="itstyle"
									name="closeTermUnit" id="closeTermUnit">
										<option value="63" <c:if test="${product.closeTermUnit==63}">selected</c:if> >年</option>
										<option value="64" <c:if test="${product.closeTermUnit==64}">selected</c:if> >月</option>
										<option value="65" <c:if test="${product.closeTermUnit==65}">selected</c:if> >天</option>
								</select></td>
							</tr>
								<tr>
								<td class="t" width="100">基金经理姓名：</td>
								<td><input class="itstyle lt it" id="fundManager" name="fundManager"
									value="${product.fundManager}" type="text" />(多个以,隔开)</td>
								<td class="t" width="100">基金经理介绍的网页链接：</td>
								<td><input class="itstyle lt it" id="fundManagerUrl" name="fundManagerUrl"
									value="${product.fundManagerUrl}" type="text" />(多个以,隔开)</td>
							</tr>
							</tr>
								<tr>
								<td class="t" width="100">管理费：</td>
								<td><input class="itstyle lt it" id="manageFee" name="manageFee"
									value="<fmt:formatNumber value="${product.manageFee}" minFractionDigits="0" ></fmt:formatNumber>" type="text" />%</td>
								<td class="t" width="100">开放日：</td>
								<td><input class="itstyle lt it" id="openDay" name="openDay"
									value="${product.openDay}" type="text" />(文本型描述)</td>
							</tr>
							</tr>
								<tr>
								<td class="t" width="100">业绩提成：</td>
								<td><input class="itstyle lt it" id="bonus" name="bonus"
									value="${product.bonus}" type="text" />(文本型描述)</td>
								<td class="t" width="100">退出费用：</td>
								<td><input class="itstyle lt it" id="sellFee" name="sellFee"
									value="${product.sellFee}" type="text" />(文本型描述)</td>
							</tr>
							<tr>
								<td class="t">产品推介单页：</td>
								<td>
									<input hidden class="itstyle lt it" id="adFile" name="adFile" value="${product.adFile}" type="text" />
									<input class="itstyle lt it" id="uploadadfile" name="uploadadfile" value="" type="file" />
									<input id="submitad" type="button" value="上传文件">
									<img id="adloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
								</td>
								<td class="t" nowrap>定向客户指南：</td>
								<td>
									<input hidden class="itstyle lt it" id="guideFile" name="guideFile"	value="${product.guideFile}" type="text" />
									<input class="itstyle lt it" id="uploadguidefile" name="uploadguidefile" value="" type="file" />
									<input id="submitguide" type="button" value="上传文件">
									<img id="guideloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
								</td>
							</tr>
							<tr>
								<td colspan="4"><script id="editor" type="text/plain"
										style="width:980px;height:500px;"></script></td>
							</tr>
							<tr>
								<td colspan="4"><center>
										<span class="bnt_ok">添加</span>
									</center></td>
							</tr>
						</tbody>
					</table>



				</form>



			</div>

		</div>


		<br class=" clear" />
	</div>



	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
