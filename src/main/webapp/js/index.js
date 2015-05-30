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
	
	function getCookieValue(name){  
	    var name = escape(name);  
	    //读cookie属性，这将返回文档的所有cookie  
	    var allcookies = document.cookie;  
	    //查找名为name的cookie的开始位置  
	    name += "=";  
	    var pos = allcookies.indexOf(name);  
	    //如果找到了具有该名字的cookie，那么提取并使用它的值  
	    if (pos != -1){                                             //如果pos值为-1则说明搜索"version="失败  
	        var start = pos + name.length;                  //cookie值开始的位置  
	        var end = allcookies.indexOf(";",start);        //从cookie值开始的位置起搜索第一个";"的位置,即cookie值结尾的位置  
	        if (end == -1) end = allcookies.length;        //如果end值为-1说明cookie列表里只有一个cookie  
	        var value = allcookies.substring(start,end);  //提取cookie的值  
	        return unescape(value);                           //对它解码  
	        }  
	    else return "";                                             //搜索失败，返回空字符串  
	}  
	//删除cookie  
	function deleteCookie(name,path){  
	    var name = escape(name);  
	    var expires = new Date(0);  
	    path = path == "" ? "" : ";path=" + path;  
	    document.cookie = name + "="+ ";expires=" + expires.toUTCString() + path;  
	}  	
    function setCookie(name,value,hours,path){  
        var name = escape(name);  
        var value = escape(value);  
        var expires = new Date();  
        expires.setTime(expires.getTime() + hours*3600000);  
        path = path == "" ? "" : ";path=" + path;  
        _expires = (typeof hours) == "string" ? "" : ";expires=" + expires.toUTCString();  
        document.cookie = name + "=" + value + _expires + path;  
    } 	
    var moile = getCookieValue("mobile");
    if(moile != "")
    {
    	$("input[name='username']").val(moile);
    	$("#bremenber").attr("checked",true);
    }
    
	loginsuccess: function loginsuccess(data){
		if(data.success){
            if($("#bremenber").attr("checked")){  
                setCookie("mobile",$("input[name='username']").val(),7*24,"/");   
            } 
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
