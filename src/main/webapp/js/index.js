/**
 * 
 */
$(document).ready(function(){
	
	function success(data){
		var htmlStr = template('product_bond', data);
		$('#tab1_con_1').html(htmlStr);
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');
	// 加载产品信息
	$.get("/dixin/products", null, success);
	
});