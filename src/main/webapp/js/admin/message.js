$(document).ready(function(){

	function success(data){
		if(data.success )
		{
			var htmlStr = template('message', data.result);
			$('.main_width').html(htmlStr);
		}

		$("a[class='item']").click(function(){
			$.get(HOST_PATH+"/admin/message?pageNum="+this.text, null, success);
		});		
		
	};
	
	function searchMessage()
	{
		$.get(HOST_PATH+"/admin/message", null, success);
	}
	
	template.config('openTag', '<#');
	template.config('closeTag', '#>');	
	
	searchMessage();
	
});