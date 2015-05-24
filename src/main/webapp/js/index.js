/**
 * 
 */
$(document).ready(function(){

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
			$('.index_serch').after(htmlStr);
		}
				
		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/products?pageNum="+this.text+"&productType="+this.name+"&profitType="+profitType, null, success);
		});		
		
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');
	template.helper('getprofitType', function (date, format) {
		return profitType;
	});
	// 加载产品信息
	$.get(HOST_PATH+"/products?profitType="+profitType, null, success);

	function searchProducts()
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
		$.get(HOST_PATH+"/product/view?productId="+this.id, null, null);
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
			var username = $("input[name='username']").val();
	        var regex = /^1[3,4,5,7,8]\d{9}$/;
	        if(!regex.exec(username)) 
	        {
	       	 alert("手机号输入不正确");
	            return;
	         }
	        
	        var password = $("input[name='password']").val();
	        var regex =/^(\w){6,20}$/;  
	        if (!regex.exec(password)) {
	       	 alert("密码输入错误");
	       	 return;
	        }
	        
		$.post(HOST_PATH+"/authentication/login", $("#loginForm").serialize(), loginsuccess);
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
