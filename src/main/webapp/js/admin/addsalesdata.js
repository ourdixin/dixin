$(document).ready(function(){
    
	function addsuccess(data){
		if(data.success)
		{
			alert("添加成功！");
		}
		else
		{
			alert(data.msg);
			location.href = data.url;			
		}

	};
	
	$('.bnt_ok').click(function(){
		var amount = $("input[name='volume']").val();
        var regex = /^[0-9]*[1-9][0-9]*$/;
        if(!regex.exec(amount)) {
       	 alert("数量必须为正整数");
            return;
        }	
        
		var amount = $("input[name='amount']").val();
        var regex = /^[0-9]*[1-9][0-9]*$/;
        if(!regex.exec(amount)) {
       	 alert("金额必须为正整数");
            return;
        }	
		$.post(HOST_PATH+"/admin/addsalesdata", $("#addForm").serialize(), addsuccess);
	});
	
	/** 
	 * 时间对象的格式化; 
	 */  
	Date.prototype.format = function(format) {  
	    /* 
	     * eg:format="yyyy-MM-dd hh:mm:ss"; 
	     */  
	    var o = {  
	        "M+" : this.getMonth() + 1, // month  
	        "d+" : this.getDate(), // day  
	        "h+" : this.getHours(), // hour  
	        "m+" : this.getMinutes(), // minute  
	        "s+" : this.getSeconds(), // second  
	        "q+" : Math.floor((this.getMonth() + 3) / 3), // quarter  
	        "S" : this.getMilliseconds()  
	        // millisecond  
	    }  
	  
	    if (/(y+)/.test(format)) {  
	        format = format.replace(RegExp.$1, (this.getFullYear() + "").substr(4  
	                        - RegExp.$1.length));  
	    }  
	  
	    for (var k in o) {  
	        if (new RegExp("(" + k + ")").test(format)) {  
	            format = format.replace(RegExp.$1, RegExp.$1.length == 1  
	                            ? o[k]  
	                            : ("00" + o[k]).substr(("" + o[k]).length));  
	        }  
	    }  
	    return format;  
	}  
	
	var myDate = new Date();
	$('#buyDate').attr("value",myDate.format("yyyy-MM-dd"));
		
	
	$("#productName").autocomplete({
		// 通过函数自定义处理数据源
		source: function(request, response){
			// request对象只有一个term属性，对应用户输入的文本
			// response是一个函数，在你自行处理并获取数据后，将JSON数据交给该函数处理，以便于autocomplete根据数据显示列表

			var url = HOST_PATH + '/admin/getautoproduct?name='+ request.term ;
			
			$.ajax( {
				'url': url,
				dataType: 'json',
				success: function(data){
					//response(dataObj); //将数据交给autocomplete去展示
					response($.map(data, function(item) {
                        return { label: item.name, value: item.id }
                    }));
				}
			} );		
		},
		select: function(event, ui){
			// 这里的this指向当前输入框的DOM元素
			// event参数是事件对象
			// ui对象只有一个item属性，对应数据源中被选中的对象
			
			this.value = ui.item.label;
			$("#productId").val( ui.item.value );
						
			// 必须阻止默认行为，因为autocomplete默认会把ui.item.value设为输入框的value值
			event.preventDefault();		
		}
	});	
	
	
	
});