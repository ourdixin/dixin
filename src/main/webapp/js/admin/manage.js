/**
 * 
 * 
 */

searchsuccess: function delsuccess(data){
	if(data.success )
	{
		searchProducts();
	}
};

	
function delProduct(productName,productId){
	$( "#dialog-confirm" ).show();
	$( "#dialog-confirm" ).dialog({
      resizable: false,
      height:140,
      modal: true,
      buttons: {
        "删除": function() {
          $( this ).dialog( "close" );
          $.post(HOST_PATH+"/admin/delproduct","productId="+productId, delsuccess);
        },
        "取消": function() {
          $( this ).dialog( "close" );
        }
      }
    });
}

$(document).ready(function(){

	$( "#dialog-confirm" ).hide();
	var profitType = 42;
	function success(data){
		if(data.result.length == 1 )
		{
			var htmlStr = template('product_item', data.result[0]);
			$('#tab1_con_' + data.result[0].id).html(htmlStr);
			//$('.index_serch').after(htmlStr);
		}
		else
		{
			var htmlStr = template('product_list', data);
			$('.con').remove();
			$('.content').after(htmlStr);
		}
				
		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/products?pageNum="+this.text+"&productType="+this.name, null, success);
		});		
		
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');
	template.helper('getprofitType', function (date, format) {
		return profitType;
	});
	// 加载产品信息
	$.get(HOST_PATH+"/products?profitType="+profitType, null, success);

	searchProducts = function()
	{
		if($('#search_text').attr("value") == undefined)
			$.get(HOST_PATH+"/products?profitType="+profitType, null, success);
		else
			$.get(HOST_PATH+"/products?profitType="+profitType+"&searchText="+$('#search_text').attr("value"), null, success);
	}
	
	$("#query").click(function(){
		searchProducts();
	});	
	
	$(".productview").click(function(){
		$.get(HOST_PATH+"/admin/productview?productId="+this.id, null, null);
	});		
	
	
	$('#fixIncome').click(function(){
		$('#fixIncome').css("color","#F60");
		$('#UnfixIncome').css("color","#F00");
		profitType = 42;
		searchProducts();
	});	
	
	$('#UnfixIncome').click(function(){
		$('#UnfixIncome').css("color","#F60");
		$('#fixIncome').css("color","#F00");
		profitType = 43;
		searchProducts();
	});	
	
});
