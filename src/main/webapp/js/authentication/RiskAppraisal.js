/**
 * 选择题
 */
$(document).ready(function(){
	
	success: function success(data){
		if(data.success){
			location.href = data.url;
		}else{
			alert(data.msg);
		}
	};
	$('.bnt_ok').click(function(){
		var maxCount=9;
		var i=0;
		var error = false;
		while(true)
		{
			i++;
			var rads=document.getElementsByName("w"+i);
			var flg=false;
			if(i>maxCount){break;}//当循环到第9题时，退出循环。
			for(var j=0;j<rads.length;j++)
			{//每个答案
				var rd = rads[j];
				if(rd.checked===true){
					flg=true;
					break;
				}
			}
			if(flg===false)
			{
				error = true;
				$.scrollTo('#question'+i,200); 
				alert("第"+i+"道题没有选择答案");
				break;
			}
		}
		if(!error)
			$('#assessmentForm').submit();

	});
	
});