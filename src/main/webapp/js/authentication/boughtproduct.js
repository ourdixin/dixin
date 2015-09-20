/**
 * 
 */
$(document).ready(function(){

	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	function success(data){
		if(data.success)
		{
			if(data.result.length == 1 )
			{
				var htmlStr = template('product_item', data.result[0]);
				$('#tab1_con_' + data.result[0].id).html(htmlStr);
				//$('.index_serch').after(htmlStr);
			}
			else
			{
				var htmlStr = template('product_list', data);
				//$('.con').remove();
				$('.ul_1').after(htmlStr);
			}
					
			$("a[class='item']").click(function(){
				$.get(HOST_PATH+"/product/queryPurchase?pageNum="+this.text+"&profitType="+this.name, null, success);
			});		
		}
		else
		{
			location.href = data.url;
		}
		
	};
	
	// 加载产品信息
	$.get(HOST_PATH+"/product/queryPurchase?profitType=-1", null, success);	
	
});