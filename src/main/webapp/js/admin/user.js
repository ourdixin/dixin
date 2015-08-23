$(document).ready(function(){
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
        
        $.post(HOST_PATH+"/authentication/uppersonaldata", $("#baseInfoForm").serialize(), success);
	});
	
	function success(data){
		if(data.success )
		{
			var htmlStr = template('user', data.result);
			$('.main_width').html(htmlStr);
		}

		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/admin/user?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchUsers()
	{
		$.get(HOST_PATH+"/admin/user", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchUsers();	
});