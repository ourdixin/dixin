/**
 * 
 */
var tab_one = 1;
var tab_two = 1;
 function setTab(name,cursel,n){
	 for(i=1;i<=n;i++){
		 var menu=document.getElementById(name+i);
		 var con=document.getElementById("con_"+name+"_"+i);
		 menu.className=i==cursel?"over":"";
		 con.style.display=i==cursel?"block":"none"; 
	 }
	var profitType = 42;
	var state = 62 + cursel;
	
	if(name == "one")
	{
		tab_one = cursel;
	}
	else if(name == "two")
	 {
		profitType = 43;
	 	tab_two = cursel;
	 }
	
	 searchProducts(profitType,state);
}

$(document).ready(function(){

	function success(data){
		if(data.result.length == 1 && data.result[0].products.list.length > 0)
		{
			var htmlStr = template('product_item', data.result[0]);
			if(data.result[0].products.list[0].profitId == 42)
				$('#con_one_' + tab_one).html(htmlStr);
			else
				$('#con_two_' + tab_two).html(htmlStr);
		}
		
	};

	template.config('openTag', '<#');
	template.config('closeTag', '#>');


	searchProducts = function(profitType,state)
	{
		if(profitType == null)
			profitType = 42;
		if(state == null)
			state = 61;	
		
		 //ajax
		 $.post(HOST_PATH+"/products/advance","recommend=1&pageSize=8&profitType=" + profitType + "&state=" + state, success);	
	}
	
	
	// 加载产品信息
	searchProducts(42,63);
	searchProducts(43,63);	
});
