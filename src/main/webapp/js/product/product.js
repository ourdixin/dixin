/**
 * 
 */

$(document).ready(function(){
	
	searchsuccess: function searchsuccess(data){
		$("#bond_table tr:gt(0):not(:eq(0))").remove();
		var tbody = "<tbody>";  
		$.each(data.result,function(n,value) {   
	           //alert(n+' '+value);  
	           var trs = "";  
	             trs += "<tr><td>" 
	            	 + value.code 
	            	 +"</td> <td>" 
	            	 + value.name 
	            	 +"</td> <td>" 
	            	 +value.release_date
	            	 +"</td> <td>" 
                     +value.term
                     +"</td> <td>" 
                     +value.rate_a
                     +"</td>" +
                    " <td>已发行</td>" +
                    "<td><img src=\"images/xx.png\" width=\"16\" height=\"13\" /><img src=\"images/xx.png\" width=\"16\" height=\"13\" /></td>" +
                    "<td><span class=\"sg_tab\"><a href=\"#none\" onclick=\"testMessageBox(event);\">详细</a></span></td></tr>";  
	             tbody += trs;         
	           });  
		tbody += "</tbody>";  
	    $("#bond_table").append(tbody); 
	};
	
	function SearchProduct(){ 
		$.post("/dixin/product/search", $("#searchForm").serialize(), searchsuccess);
	}	
	
	$('#bnt_search').click(function(){
		
		SearchProduct();
	});
	
	
	loginsuccess: function loginsuccess(data){
		alert(data);
	};

	
	$('#btn_login').click(function(){
		$.post("/dixin/authentication/login", $("#loginForm").serialize(), loginsuccess);
	});	
	
	SearchProduct();
});