$(document).ready(function(){
	
	function success(data){
		if(data.result.length == 1 )
		{
			var htmlStr = template('product_item', data.result[0]);
			$('.con_table').html(htmlStr);
			//$('.index_serch').after(htmlStr);
		}
		else
		{
			var htmlStr = template('product_list', data);
			$('.con').remove();
			$('.index_serch').after(htmlStr);
		}
				
		$("a[class='item']").click(function(){
			$.post(HOST_PATH+"/products/advance?state=60&pageNum="+this.text+"&productType="+this.name, null, success);
		});		
		
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');
	
	
	// 加载产品信息
	$.post(HOST_PATH+"/products/advance?state=60", null, success);
	
	
});