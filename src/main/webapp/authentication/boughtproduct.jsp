<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/TR/html4/loose.dtd">
<html >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户中心-已购买的产品</title>
<link href="<%=request.getContextPath() %>/css/LTT_define.css" 
    rel="stylesheet" type="text/css" />
<script type="text/javascript" 
     src="<%=request.getContextPath()%>/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" 
     src="<%=request.getContextPath()%>/js/js.js"></script>
<script type="text/javascript">	var HOST_PATH = "<%=request.getContextPath() %>";</script>
</head>
<body>
<!---TOP头部共用部份---->
<c:import url="/framework/header.jsp" charEncoding="utf-8" />
<!---TOP结束---->
<!---用户左侧共用部份---->
<c:import url="/authentication/userleft.jsp" charEncoding="utf-8" />
<!---用户左侧共用部份结束---->

<div  id="main_right">
<ul class="ul_1">
<li class="tab1_1_on"  id="tab1_1" onMouseOver="set_tab('tab1', 1 ,4)">固定收益</li>
                <li class="tab1_2_off" id="tab1_2" onMouseOver="set_tab('tab1', 2 ,4)">浮动收益</li>
            </ul>
<div id="tab1_con_1" class="con" style=" display:block; clear:both;">
    <table  border="0" cellpadding="0" cellspacing="0" class="ui compact table segment">
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
          <td>白石20号基金 </td>
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
          <td>白石20号基金 </td>
          <td>5</td>
          <td>1500</td>
          <td>20%</td>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
          </tr>
        </tbody>
      </table>
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
 <div id="tab1_con_2" class="con"  style=" display:none;clear:both;">
    <table  class="ui compact table segment">
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
      <td>黄先生 </td>
      <td>2014-10-3</td>
    </tr>
  </tbody>
</table>
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
</div>

    
 
<br class=" clear" />

</div>


	<!---foot底部---->
	<c:import url="/framework/footer.jsp" charEncoding="utf-8" />
	<!---foot底部结束---->
</body>
</html>
