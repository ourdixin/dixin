/**
 * 
 * 
 */
$(document).ready(function(){

	template.config('openTag', '<#');
	template.config('closeTag', '#>');

	// 加载产品信息
	function success(data){
		if(data.success)
		{
			var htmlStr = template('products', data.result);
			$('.main_width').html(htmlStr);
			
			$("a[class='item']").click(function(){
				searchProducts(this.text);
			});
		}
		else
		{
			alert(data.msg);
			location.href = data.url;
		}
	};	
	
	
	function searchProducts (pageNum)
	{
		$.get(HOST_PATH+"/admin/getpurchasestatistics?pageNum="+pageNum, null, success);
	}
	
	// 加载提示产品信息
	function hotsuccess(data){
		if(data.success)
		{
			var htmlStr = template('hotproducts', data);
			$('.hot_main_width').html(htmlStr);
		}
		else
		{
			alert(data.msg);
			location.href = data.url;
		}
	};	
	
	
	function searchHotProducts (pageNum)
	{
		$.get(HOST_PATH+"/admin/gethotpurchasestatistics", null,hotsuccess);
	}	
	
	$("a[class='item']").click(function(){
		searchProducts(this.text);
	});		
	
	searchHotProducts(1);
	searchProducts(1);
});
