$(document).ready(function(){

	function success(data){
		alert("发布成功！")
		location.href = data.url;
	};
	
	$('.bnt_ok').click(function(){
		var phone = $("input[name='tel']").val();
        var regex = /^1[3,4,5,7,8]\d{9}$/;
        if(!regex.exec(phone)) {
       	 alert("手机号输入不正确");
            return;
        }	
        
        var amount = $("input[name='amount']").val();
        var regex = /^[0-9]*[1-9][0-9]*$/;
        if(!regex.exec(amount)) {
       	 alert("金额必须为正整数");
            return;
        }	
		$.post(HOST_PATH + "/product/appointment", $("#appointForm").serialize(), success);
	});
});