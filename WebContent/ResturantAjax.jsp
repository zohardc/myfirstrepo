<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>City Site </title>
<script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">


function updateC()
{	
	event.preventDefault();
	var $form = $('#form1');
	cityId = $form.find('input[name="id_param"]').val();
	cityName = $form.find('input[name="name_param"]').val();
	a=$form.find('input[name="action_type"]').val();
	servlet= $form.attr('action');
	//alert(cityId+" "+cityName+" "+a+" "+servlet);
	
	$.ajax
	(
			{				
				cache:false,
				type: 'post',
				url:servlet,
				data: {
					id:cityId,
					cn:cityName,
					action_type:a
						},
					dataType: 'html',
						success: function(result)
						  {							  
							$('#city_rows').html($(result).find('#table1'));  
							$('#city_form').hide();
						  }
				}	
		);
}

function update(x)
{
	$.ajax(
			{
				cache:false,
				url:'CityControlerAjax?action=update&id='+x,
				data: {xxx:'xxx'},
				success: function(result)
				  {
					  
					$('#city_form').html($(result).find('#form1'));  
				  },
				  
				  dataType: 'html'
		
			}
	
	);
}

function del(x)
{
	$.ajax(
			{
				cache:false,
				url:'CityControlerAjax?action=delete&id='+x,
				data: {xxx:'xxx'},
				success: function(result)
				  {
					  
					$('#city_rows').html($(result).find('#table1'));  
				  },
				  
				  dataType: 'html'
		
			}
	
	);
}

$(document).ready(function()
		{
	$('#city_button').click(function()
			               {
										
							$.ajax(									
									{
									  cache: false,
									  url: 'CityControlerAjax?action=listCity',
									  data: {xxx:'xxx'},
									  success: function(result)
									  {
										 
										$('#city_rows').html($(result).find('#table1'));  
									  },
									  
									  dataType: 'html'
										
									}
																				
							     );
							
							
							
	                       }
			               );
		}
		        );
		       
function update2(x)
{	
	$.ajax(
			{
				cache:false,
				url:'CustomerControlerAjax?action=update&id='+x,
				data: {xxx:'xxx'},
				success: function(result)
				  {
					alert(result);
					$('#customer_form').html($(result).find('#form2'));  
				  },
				  
				  dataType: 'html'
		
			}
	
	);
}
		        
function del2(x)
{
	alert(x);
	$.ajax(
			{
				cache:false,
				url:'CustomerControlerAjax?action=delete&id='+x,
				data: {xxx:'xxx'},
				success: function(result)
				  {
					  
					$('#customer_rows').html($(result).find('#table2'));  
				  },
				  
				  dataType: 'html'
		
			}
	
	);
}

		        
		        
$(document).ready(function()
		{
	$('#customer_button').click(function()
			               {
										
							$.ajax(									
									{
									  cache: false,
									  url: 'CustomerControlerAjax?action=listCustomer',
									  data: {xxx:'xxx'},
									  success: function(result)
									  {
										 
										$('#customer_rows').html($(result).find('#table2'));  
									  },
									  
									  dataType: 'html'
										
									}
																				
							     );
							
							
							
	                       }
			               );
		}
		        );






</script>
</head>
<body>
<H1>רשימת ערים</H1>
<button id="city_button">הצג רשימת ערים</button>
<table>
	<div id="city_rows">
	</div>
</table>
<div id="city_form">
</div>
<H1>רשימת לקוחות</H1>
<button id="customer_button">הצג רשימת לקוחות</button>
<table>
	<div id="customer_rows">
	</div>
</table>
<div id="customer_form">
</div>
</body>
</html>
