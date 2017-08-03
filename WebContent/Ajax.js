function adda(){
	$.ajax({
		cache:false,
		url: "CityControlerAjax?action=add",
		data:{
			userName:'uuu'
		},
		success: function (result)
		{
			 $('html, body').animate({
			        scrollTop: $("#citys").offset().top
			    }, 3000); 
			$("#formpcityupdate").html($(result).find("#form1"));
		},
		dataType: 'html'
		}
	);
}
function addC()
	{
		event.preventDefault();		
		var $form = $('#form1');
		cityId = $form.find('input[name="id_param"]').val();
		cityName = $form.find('input[name="name_param"]').val();
		city = $form.find('input[name="city"]').val(),
		a=$form.find('input[name="action_type"]').val();
		servlet= $form.attr('action');
		$.ajax
		({
			cache:false,
			type:'POST',
			url:servlet,
			data:{
				id:cityId,
				cn:cityName,
				ci:city,
				action_type:a				
				
				 },
			datatype:'html',
			success:function(result)
			{
				
				$("#doc_rows").html($(result).find("#tdoc")); 
				$('#form1').hide();
			}
		});
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
					
					$('html, body').animate({
				        scrollTop: $("#citys").offset().top
				    }, 1000);   
					$('#city_form').html($(result).find('#form1'));  
				  },
				  
				  dataType: 'html'
		
			}
	
	);
}

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
							$('html, body').animate({
						        scrollTop: $("#citys").offset().top
						    }, 1000);
							$('#city_rows').html($(result).find('#table1'));  
							$('#city_form').hide();
						  }
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

