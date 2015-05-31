$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('transfer', data.result);
			$('#content').html(htmlStr);
		}

				
		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/authentication/transfer?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchAssignment()
	{
		//if($('#search_text').attr("value") == undefined)
		//	$.get(HOST_PATH+"/product/queryAppointment?profitType="+profitType, null, success);
		//else
			$.get(HOST_PATH+"/authentication/transfer", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchAssignment();
	
});