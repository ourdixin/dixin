$(document).ready(function(){
	
	//购买产品详情
	$('.linkk').click(function(){
		location.href = HOST_PATH + "/weixin/product/boughtdetail?id="+this.id
	});
});