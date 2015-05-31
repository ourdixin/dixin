$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('assignment', data.result);
			$('.con').html(htmlStr);
		}

				
		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/product/queryAssignment?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchAssignment()
	{
		//if($('#search_text').attr("value") == undefined)
		//	$.get(HOST_PATH+"/product/queryAppointment?profitType="+profitType, null, success);
		//else
			$.get(HOST_PATH+"/product/queryAssignment", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchAssignment();
	
});