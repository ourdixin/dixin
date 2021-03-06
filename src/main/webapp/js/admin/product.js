/**
 * 
 */

actionsuccess: function actionsuccess(data){
	if(data.success )
	{
		searchProducts(1);
	}
};

	
function delProduct(productName,productId){
	
   if(confirm("是否继续删除此产品？")){
        $.post(HOST_PATH+"/admin/delproduct","productId="+productId, actionsuccess);
    }
}
function recommendproduct(productName,productId){
	
	   if(confirm("是否要把此产品推荐到首页显示？")){
	        $.post(HOST_PATH+"/admin/recommendproduct","productId="+productId, actionsuccess);
	    }
}

function cancelrecommendproduct(productName,productId){
	
	   if(confirm("是否要取消此产品推荐到首页显示？")){
	        $.post(HOST_PATH+"/admin/cancelrecommendproduct","productId="+productId, actionsuccess);
	    }
}

$(document).ready(function(){

	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchsuccess: function searchsuccess(data){
		if(data.result.length == 1 )
		{
			var htmlStr = template('product_item', data.result[0]);
			$('#tab_products').html(htmlStr);
		}
		/*
		else
		{
			var htmlStr = template('product_list', data);
			$('.con').remove();
			$('.index_serch').after(htmlStr);
		}
		*/	
		$("a[class='item']").click(function(){
			//$.post(basePath+"/products/advance?pageNum="+this.text+"&productType="+this.name, null, success);
			searchProducts(this.text);
		});		
		
	};
	
	
	searchProducts = function (pageNum)
	{	
		var data = "";
		$('div span:has(a[href^=javascript])').each(function(){
			   data += this.id + "&";
		 });
		data += "pageNum=" +  pageNum;
		if($('#search_text').attr("value") != undefined)
			data += "&searchText=" + $('#search_text').attr("value");
		$.post(HOST_PATH+"/products/advance",data, searchsuccess);		
	}
	
	$('#search_text_button').click(function(){
		searchProducts(1);
	});
	
	$('dd a ').click(function(){
		var name = this.parentNode.parentNode.firstElementChild.innerText;
		var type = this.parentNode.parentNode.firstElementChild.id;
		
		$(this.parentNode.children).each(function(index,element){
			$(element).css("color","#8f99a0");
		});
		
		$(this).css("color","#F60");
		
		$('span[id^=' + type + '] ').remove();
		
		$('.t').append(" <span id='" + type + "=" + this.id + "' > " + name + this.text + "<a href='javascript:void(0)' >X</a></span>");

		$('span a[href^=javascript] ').click(function(){
			var pos = this.parentElement.id.indexOf("=");
			var name = this.parentElement.id.substring(0,pos);
			var id = this.parentElement.id.substring(pos+1,this.parentElement.id.length);
			var children = $('#'+name).get(0).parentNode.children[1].children;
			$(children[0]).css("color","#F60");
			$(children).each(function(index,element){
				if($(element).attr('id') == id)
					$(element).css("color","#8f99a0");
			});
			this.parentNode.remove();
			searchProducts(1);
		});		
		
		searchProducts(1);
		
	});
	
	searchProducts(1);
});