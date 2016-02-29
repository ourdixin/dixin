$(document).ready(function(){
	
	success: function success(data){
		alert(data.msg);
		window.location.reload();
	};

	$("a[class='item']").click(function(){
		$.get(HOST_PATH+"/admin/transferred?"+this.name, null, success);
	});
});