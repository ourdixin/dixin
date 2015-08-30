$(document).ready(function(){
	//产品详情
	$('.linkk').click(function(){
		location.href = HOST_PATH + "/weixin/product/productdetail?productid="+this.id
	});
});