<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理</title>
<link href="<%=request.getContextPath()%>/css/LTT_define.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath()%>";
</script>
</head>

<body>
	<!---TOP头部共用部份---->
	<c:import url="/framework/header.jsp" charEncoding="utf-8" />
	<!---TOP结束---->
	<!---用户左侧共用部份---->
	<c:import url="/admin/customerleft.jsp" charEncoding="utf-8" />
	<!---用户左侧共用部份结束---->
	<div id="main_right">
		<div class="user_title">基本信息</div>
		<div class="main_width">
			<div class="con_table">
				<table width="100%">
					<thead>
						<tr>
							<th>姓名</th>
							<th>用户名</th>
							<th>地址</th>
							<th>QQ</th>
							<th>注册时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>${user.name}</td>
							<td>${user.userName}</td>
							<td>${user.address}</td>
							<td>${user.qq}</td>
							<td><fmt:formatDate pattern="yyyy年MM月dd日" value="${user.regDate}" /></td>
						</tr>
					</tbody>
				</table>

			</div>
		</div>
		<div class="tab1">
			<div class="user_title">产品购买信息</div>

			<ul class="ul_1">
				<li class="tab1_1_on" id="tab1_1"
					onMouseOver="set_tab('tab1', 1 ,4)">固定收益</li>
				<li class="tab1_2_off" id="tab1_2"
					onMouseOver="set_tab('tab1', 2 ,4)">浮动收益</li>
			</ul>
			<div id="tab1_con_1" class="con" style="display: block; clear: both;">
				<table border="0" cellpadding="0" cellspacing="0"
					class="ui compact table segment">
					<thead>
						<tr>
							<th>产品代码</th>
							<th>基金代码</th>
							<th>基金名称</th>
							<th>基金份额</th>
							<th>基金净值</th>
							<th>浮动盈亏</th>
							<th>分红方式</th>
							<th>营销机构</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>58248</td>
							<td>300</td>
							<td>小金库</td>
							<td>52</td>
							<td>1500</td>
							<td>1%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>145</td>
							<td>白石20号基金</td>
							<td>2</td>
							<td>1500</td>
							<td>15%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412050937</td>
							<td>158</td>
							<td>鑫泰山1号</td>
							<td>20</td>
							<td>1500</td>
							<td>5%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412220020</td>
							<td>369</td>
							<td>小金库</td>
							<td>2014</td>
							<td>1500</td>
							<td>3%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>258</td>
							<td>白石20号基金</td>
							<td>5</td>
							<td>1500</td>
							<td>20%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
			<div id="tab1_con_2" class="con" style="display: none; clear: both;">
				<table class="ui compact table segment">
					<thead>
						<tr>
							<th>产品名称</th>
							<th>金额</th>
							<th>联系人</th>
							<th>发行时间</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>鑫泰山1号</td>
							<td>2000</td>
							<td>张小姐</td>
							<td>2014-12-5</td>
						</tr>
						<tr>
							<td>小金库</td>
							<td>5000</td>
							<td>黄先生</td>
							<td>2014-10-3</td>
						</tr>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
		</div>

		<!---TAB部份---->
		<div class="tab1">
			<div class="user_title">产品成交信息</div>
			<ul class="ul_1">
				<li class="tab1_6_off" id="tab1_6"
					onMouseOver="set_tab('tab1', 6 ,7)">固定收益</li>
				<li class="tab1_7_off" id="tab1_7"
					onMouseOver="set_tab('tab1', 7 ,7)">浮动收益</li>


			</ul>
			<div id="tab1_con_6" class="con" style="display: block; clear: both;">
				<table border="0" cellpadding="0" cellspacing="0"
					class="ui compact table segment">
					<thead>
						<tr>
							<th>产品代码</th>
							<th>基金代码</th>
							<th>基金名称</th>
							<th>基金份额</th>
							<th>基金净值</th>
							<th>浮动盈亏</th>
							<th>分红方式</th>
							<th>营销机构</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>58248</td>
							<td>300</td>
							<td>小金库</td>
							<td>52</td>
							<td>1500</td>
							<td>1%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>145</td>
							<td>白石20号基金</td>
							<td>2</td>
							<td>1500</td>
							<td>15%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412050937</td>
							<td>158</td>
							<td>鑫泰山1号</td>
							<td>20</td>
							<td>1500</td>
							<td>5%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412220020</td>
							<td>369</td>
							<td>小金库</td>
							<td>2014</td>
							<td>1500</td>
							<td>3%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>258</td>
							<td>白石20号基金</td>
							<td>5</td>
							<td>1500</td>
							<td>20%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
			<div id="tab1_con_7" class="con" style="display: none; clear: both;">
				<table border="0" cellpadding="0" cellspacing="0"
					class="ui compact table segment">
					<thead>
						<tr>
							<th>产品代码</th>
							<th>基金代码</th>
							<th>基金名称</th>
							<th>基金份额</th>
							<th>基金净值</th>
							<th>浮动盈亏</th>
							<th>分红方式</th>
							<th>营销机构</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>2584261</td>
							<td>300</td>
							<td>小金库</td>
							<td>52</td>
							<td>1500</td>
							<td>1%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>145</td>
							<td>白石20号基金</td>
							<td>2</td>
							<td>1500</td>
							<td>15%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412050937</td>
							<td>158</td>
							<td>鑫泰山1号</td>
							<td>20</td>
							<td>1500</td>
							<td>5%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412220020</td>
							<td>369</td>
							<td>小金库</td>
							<td>2014</td>
							<td>1500</td>
							<td>3%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
						<tr>
							<td>201412160029</td>
							<td>258</td>
							<td>白石20号基金</td>
							<td>5</td>
							<td>1500</td>
							<td>20%</td>
							<td>&nbsp;</td>
							<td>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<div class="page_menu">
					<a class="item"> < </a> <a class="item">1</a> <a class="item">2</a>
					<a class="item">3</a> <a class="item">4</a> <a class="item">5</a> <a
						class="item">6</a> <a class="item"> > </a>
				</div>
			</div>
		</div>
		<!---TAB结束---->
		<div class="tab1">
			<div class="user_title">产品成交信息</div>
			<div class="main_width">
				<div class="con_table">
					<table width="100%">
						<thead>
							<tr>
								<th>预约产品</th>
								<th>预约日期</th>
								<th>预约金额</th>
								<th>备注</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>衡阳城投二期</td>
								<td>2015年3月2日 9:10:32分</td>
								<td>1000万元</td>
								<td>感谢您预约我们的产品，有任何疑问请我们的客服热线。</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>

		</div>

		<div class="tab1">
			<div class="user_title">在线留言</div>
			<div class="main_width">
				<div class="con_table">
					<table width="100%">
						<thead>
							<tr>
								<th>留言时间</th>
								<th>客户姓名</th>
								<th>分类问题</th>
								<th>问题描述</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2015-3-15</td>
								<td>张三</td>
								<td>产品预约</td>
								<td>我有100万的产品需要转让，如何转让啊</td>
							</tr>
							<tr>
								<td>2015-3-15</td>
								<td>张三</td>
								<td>产品转让</td>
								<td>利润很高</td>
							</tr>
						</tbody>
					</table>

				</div>
			</div>

		</div>
	</div>

	<br class=" clear" />
	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
