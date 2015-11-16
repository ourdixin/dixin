<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="token" uri="spring/mvc/token"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>修改产品</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css"
	rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/common.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.config.js"></script>
<script type="text/javascript" charset="utf-8"
	src="<%=request.getContextPath()%>/js/ueditor/ueditor.all.min.js"> </script>
<!--建议手动加在语言，避免在ie下有时因为加载语言失败导致编辑器加载失败-->
<!--这里加载的语言文件会覆盖你在配置项目里添加的语言类型，比如你在配置项目里配置的是英文，这里加载的中文，那最后就是中文-->
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/js/ueditor/lang/zh-cn/zh-cn.js"></script>
<script type="text/javascript" src="http://libs.baidu.com/jquery/1.4.2/jquery.min.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/admin/changeproduct.js"></script>
<script type="text/javascript"
	src="<%=request.getContextPath()%>/js/ajaxfileupload.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";</script>
</script>
</head>
<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/adminHeader.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
<div id="main_right">
	<div id="productInfo" style="display: none">
		${product.info}
	</div>
	<div id="main_body">
		<div id="title_xi"></div>
		<div class="register">
			<div class="info_frm">
				<form id="updateproductForm" name="updateproductForm" method="post"
					action="<%=request.getContextPath()%>/product/update">
					<!-- token:token/ -->
					<input  name="id" id="id" value="${product.id}" type="hidden"  style="display: none;" />
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
								<td class="t">期限：</td>
								<td><input class="itstyle lt it" id="term" name="term"
									value="${product.term}" type="text" width="80" /> <select class="itstyle"
									name="termUnit" id="termUnit">
										<option value="63"  <c:if test="${product.termUnit==63}">selected</c:if> >年</option>
										<option value="64"  <c:if test="${product.termUnit==64}">selected</c:if> >月</option>
										<option value="65" <c:if test="${product.termUnit==65}">selected</c:if> >天</option>
								</select></td>
								<td class="t">利益分配方式：</td>
								<td><select class="itstyle" name="payType" id="payType">
										<option value="66" <c:if test="${product.payType==66}">selected</c:if> >自然季度付息</option>
										<option value="67" <c:if test="${product.payType==67}">selected</c:if> >自然半年付息</option>
										<option value="68" <c:if test="${product.payType==68}">selected</c:if> >自然年付息</option>
										<option value="69" <c:if test="${product.payType==69}">selected</c:if> >季度付息</option>
										<option value="70" <c:if test="${product.payType==70}">selected</c:if> >半年付息</option>
										<option value="71" <c:if test="${product.payType==71}">selected</c:if> >年付息</option>
										<option value="72" <c:if test="${product.payType==72}">selected</c:if> >到期还本付息</option>
										<option value="73" <c:if test="${product.payType==73}">selected</c:if> >其他付息方式</option>
								</select> <input id="payTypeInfo" name="payTypeInfo" value="${product.payTypeInfo}" type="text"
									style="display: none;" /></td>
							</tr>

							<tr>
								<td class="t">产品规模：</td>
								<td><input class="itstyle lt it" id="amount" name="amount"
									value="<fmt:formatNumber value="${product.amount/100000000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:亿)</td>
								<td class="t">资金投向：</td>
								<td><select class="itstyle"
									name="direction" id="direction">
										<option value="49"  <c:if test="${product.direction==49}">selected</c:if> >金融市场</option>
										<option value="52"  <c:if test="${product.direction==52}">selected</c:if> >房地产</option>
										<option value="53"  <c:if test="${product.direction==53}">selected</c:if> >工商企业</option>
										<option value="54"  <c:if test="${product.direction==54}">selected</c:if> >基础设施</option>
										<option value="57"  <c:if test="${product.direction==57}">selected</c:if> >资金池</option>
										<option value="58"  <c:if test="${product.direction==58}">selected</c:if> >其它</option>
								</select></td>
							</tr>
							<tr>
								<td class="t">投资起点：</td>
								<td><input class="itstyle lt it" id="minAmount"
									name="minAmount" value="<fmt:formatNumber value="${product.minAmount/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万)</td>
								<td class="t">递增金额：</td>
								<td><input class="itstyle lt it" id="appendAmount"
									name="appendAmount" value="<fmt:formatNumber value="${product.appendAmount/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万)</td>
							</tr>
							<tr>
								<td class="t">续存：</td>
								<td><input class="itstyle lt it" id="appendTerm" name="appendTerm"
									value="${product.appendTerm}" type="text" width="80" /> <select class="itstyle"
									name="appendTermUnit" id="appendTermUnit">
										<option value="63" <c:if test="${product.appendTermUnit==63}">selected</c:if> >年</option>
										<option value="64" <c:if test="${product.appendTermUnit==64}">selected</c:if> >月</option>
										<option value="65" <c:if test="${product.appendTermUnit==65}">selected</c:if> >天</option>
								</select></td>
								<td class="t">起息日：</td>
								<td>
								<input class="itstyle lt it" id="valueDate"
									name="valueDate" value="<fmt:formatDate value="${product.valueDate}" pattern="yyyy-MM-dd"/>" type="text" />(格式：yyyy-MM-dd)
									
								<td hidden  style="display: none;" ><select class="itstyle"
									name="profitId" id="profitId">
										<option value="42" selected>固定</option>
										<!-- option value="43">浮动</option -->
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
								<td class="t">A类份额：</td>
								<td><input class="itstyle lt it" id="partA" name="partA"
									value="<fmt:formatNumber value="${product.partA/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万元)</td>
								<td class="t" nowrap>A类年化收益率：</td>
								<td><input class="itstyle lt it" id="rateA" name="rateA"
									value="<fmt:formatNumber value="${product.rateA}" minFractionDigits="0"/>" type="text" />%</td>
							</tr>

							<tr>
								<td class="t">B类份额：</td>
								<td><input class="itstyle lt it" id="partB" name="partB"
									value="<fmt:formatNumber value="${product.partB/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万元)</td>
								<td class="t" nowrap>B类年化收益率：</td>
								<td><input class="itstyle lt it" id="rateB" name="rateB"
									value="<fmt:formatNumber value="${product.rateB}" minFractionDigits="0"/>" type="text" />%</td>
							</tr>


							<tr>
								<td class="t">C类份额：</td>
								<td><input class="itstyle lt it" id="partC" name="partC"
									value="<fmt:formatNumber value="${product.partC/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万元)</td>
								<td class="t" nowrap>C类年化收益率：</td>
								<td><input class="itstyle lt it" id="rateC" name="rateC"
									value="<fmt:formatNumber value="${product.rateC}" minFractionDigits="0"/>" type="text" />%</td>
							</tr>


							<tr>
								<td class="t">D类份额：</td>
								<td><input class="itstyle lt it" id="partD" name="partD"
									value="<fmt:formatNumber value="${product.partD/10000}" groupingUsed="false" minFractionDigits="0"/>" type="text" />(单位:万元)</td>
								<td class="t" nowrap>D类年化收益率：</td>
								<td><input class="itstyle lt it" id="rateD" name="rateD"
									value="<fmt:formatNumber value="${product.rateD}" minFractionDigits="0"/>" type="text" />%</td>
							</tr>
							
							<tr>
								<td class="t">产品收益说明：</td>
								<td colspan="3">
								<input class="itstyle lt it" id="rateNote" name="rateNote" value="${product.rateNote}" type="text" style="width:80%;"/>(文本)
								</td>
							</tr>							
								
							<tr>						
							<td class="t">产品推介单页：</td>
							<td>
								<input readonly="readonly" class="itstyle lt it" id="adFile" name="adFile" value="${product.adFile}" type="text" />
								<input class="itstyle lt it" id="uploadadfile" name="uploadadfile" value="" type="file" />
								<input id="submitad" type="button" value="上传文件">
								<img id="adloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
							</td>
							<td class="t" nowrap>定向客户指南：</td>
							<td>
								<input readonly="readonly" class="itstyle lt it" id="guideFile" name="guideFile"	value="${product.guideFile}" type="text" />
								<input class="itstyle lt it" id="uploadguidefile" name="uploadguidefile" value="" type="file" />
								<input id="submitguide" type="button" value="上传文件">
								<img id="guideloading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" />
							</td>
							</tr>
							<!-- tr>
							<td colspan="2"><input id="submit" type="button" value="上传文件"></td>
							<td colspan="2"><img id="loading" src="<%=request.getContextPath()%>/images/loading.gif" style="display:none;" /></td>
							</tr -->
							<tr>
								<td colspan="4"><script id="editor" type="text/plain" style="width:980px;height:500px;"></script></td>
							</tr>
							<tr>
								<td colspan="4">
									<center>
										<span style="height:30px;cursor:pointer;" class="bnt_ok" >更新</span>
									</center>
								</td>
							</tr>
						</tbody>
					</table>
				</form>
			</div>
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
