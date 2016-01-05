$(document).ready(function(){
	
	//购买产品详情
	$('.linkk').click(function(){
		location.href = HOST_PATH + "/weixin/product/paylist?id="+this.id
	});
});