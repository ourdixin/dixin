$(document).ready(function(){
	
	function addsuccess(data){
		if(data.success )
		{
			alert("添加成功！")
		}
		else
		{
			alert(data.msg);
			if(data.url != null && data.url != "")
				location.href = data.url;
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/productinfo/add", $("#addproductInfoForm").serialize(), addsuccess);
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
	$('#endDate').attr("value",myDate.format("yyyy-MM-dd hh:mm"));
	
	
	$('#payType').change(function(){ 
		if(this.value == 73)
		{
			$('#payTypeInfo').show();
		}
		else
		{
			$('#payTypeInfo').hide();
		}
	});
	
	
});