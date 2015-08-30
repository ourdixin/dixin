$(document).ready(function(){

	success:function success(data){
		if(data.success){
			alert(data.msg);
			location.href=data.url;
		}else{
			alert("请重新登录！");
			location.href=data.url;
		}
	};
	
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/admin/MessageReply", $("#messageReplyForm").serialize(), success);
	});
});