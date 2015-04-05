/**
 * 
 */
$(document).ready(function(){
	
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
			$('.index_serch').after(htmlStr);
		}
				
		$("a[class='item']").click(function(){
			$.get("/dixin/products?pageNum="+this.text+"&productType="+this.name, null, success);
		});		
		
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');
	
	// 加载产品信息
	$.get("/dixin/products", null, success);

	$("#query").click(function(){
		$.get("/dixin/products?searchText="+$('#search_text').attr("value"), null, success);
	});	
	
	$(".productview").click(function(){
		$.get("/dixin/product/view?productId="+this.id, null, null);
	});		
	
	loginsuccess: function loginsuccess(data){
		if(data.success){
			//alert('登录成功！');
			var htmlStr = template('login_span_tpl', data);
			$('#login_span').html(htmlStr);
			$('.index_login').hide();
		}else{
			alert(data.msg);
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post("/dixin/authentication/login", $("#loginForm").serialize(), loginsuccess);
	});	
	
});
