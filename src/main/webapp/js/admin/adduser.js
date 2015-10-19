$(document).ready(function(){
	
	function getProvinceSuccess(data){
		if(data.success)
		{
			for(i=0;i < data.result.length;i++){
				$("#province").append("<option value='" + data.result[i].id + "'>" + data.result[i].name + "</option>");  
			}
			getCityList();
		}
	};
	
	function getProvinceList()
	{
		$.post(HOST_PATH+"/authentication/getcitylist",null, getProvinceSuccess);
	}

	function getCitySuccess(data){		
		if(data.success)
		{
			$("#areaId").empty();
			for(i=0;i < data.result.length;i++){
				$("#areaId").append("<option value='" + data.result[i].id + "'>" + data.result[i].name + "</option>");  
			}
		}		
	};	
	
	function getCityList()
	{
		$.post(HOST_PATH+"/authentication/getcitylist","pid=" + $("#province").val(), getCitySuccess);
	}	
	
	$('#province').change(function(){
		getCityList();
	});
		
	function success(data){
		if(data.success){
			alert("客户添加成功！")
		}
		else
		{
			alert(data.msg)
		}
	};
	
	//添加用户
	$('.bnt_ok').click(function(){
		$.post(HOST_PATH+"/admin/adduser", $("#adduserForm").serialize(), success);
	});
	
	getProvinceList()	
});