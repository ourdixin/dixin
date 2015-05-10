$(document).ready(function(){

	success:function success(data){
		if(data.success){
			alert(data.msg);
		}else{
			alert("请重新登录！");
			location.href=data.msg;
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/authentication/myReplybyuser", $("#myReplyForm").serialize(), success);
	});
});