<%@ page language="java" contentType="text/html; charset=windows-1255"
    pageEncoding="windows-1255"%>
    <%@ taglib  uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1255">
<title>Insert title here</title>
</head>
<body><!DOCTYPE html>
<html lang="en">
<head>
<script>
function adda(){
	$.ajax({
		cache:false,
		url: "DocControllerAjax?action=add",
		data:{
			userName:'uuu'
		},
		success: function (result)
		{
			 $('html, body').animate({
			        scrollTop: $("#DOCL").offset().top
			    }, 3000); 
			$("#formdocupdate").html($(result).find("#form1"));
		},
		dataType: 'html'
		}
	);
}
function adda2()
	{
		event.preventDefault();
		var $form = $('#form1'),
		docid = $form.find('input[name="id"]').val(),
		docname = $form.find('input[name="name"]').val(),
		doccity = $form.find('input[name="city"]').val(),	
		a=$form.find('input[name = "action_type"]').val(),
		servlet=$form.attr('action');
		$.ajax
		({
			cache:false,
			type:'POST',
			url:servlet,
			data:{
				i:docid,
				n:docname,
				c:doccity,
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

function addb(){
	$.ajax({
		cache:false,
		url:"PatientControllerAjax?action=add",
		data:{x:'x'},
		success: function(result){
			 $('html, body').animate({
			        scrollTop: $("#DOCL").offset().top
			    }, 1000); 
			$("#formpatientupdate").html($(result).find("#pos1"));
		},
		dataType:'html'
		
	});
}

function addb2()
	{
		event.preventDefault();
		var $form = $('#pos1'),
		patientid = $form.find('input[name="id"]').val(),
		patientlname = $form.find('input[name = "lname"]').val(),
		patientname = $form.find('input[name="name"]').val(),
		patientcity = $form.find('input[name="city"]').val(),	
		a=$form.find('input[name = "action_type"]').val(),
		servlet=$form.attr('action');
		$.ajax
		({
			cache:false,
			type:'POST',
			url:servlet,
			data:{
				id:patientid,
				name:patientname,
				lname:patientlname,
				city:patientcity,
				action_type:a
				
				 },
			datatype:'html',
			success:function(result)
			{
				
				$("#patient_rows").html($(result).find("#table1")); 
				$('#pos1').hide();
			}
		});
		}


function deletea (x){
	
	$.ajax({
	
		cache:false,
		url: "DocControllerAjax?action=delete&id="+x,
		data:{
			userName:'uuu'
		},
		success: function (result)
		{
			 $('html, body').animate({
			        scrollTop: $("#DOCL").offset().top
			    }, 3000); 
			$("#doc_rows").html($(result).find("#tdoc"));
			
			
		},
		dataType: 'html'
		}
	);
}
function deleteb (x){
	
	$.ajax({
	
		cache:false,
		url: "PatientControllerAjax?action=delete&id="+x,
		data:{
			userName:'uuu'
		},
		success: function (result)
		{
			$("#patients_rows").html($(result).find("#table1"));
		},
		dataType: 'html'
		}
	);
}
function updatea (x){
	$.ajax({
		cache:false,
		url: "DocControllerAjax?action=update&id="+x,
		data:{
			userName:'uuu'
		},
		success: function (result)
		{
			 $('html, body').animate({
			        scrollTop: $("#DOCL").offset().top
			    }, 3000); 
			$("#formdocupdate").html($(result).find("#form1"));
		},
		dataType: 'html'
		}
	);
}
function updatea2()
	{
	event.preventDefault();
	var $form = $('#form1'),
	docid = $form.find('input[name="id"]').val(),
	docname = $form.find('input[name="name"]').val(),
	doccity = $form.find('input[name="city"]').val(),	
	a=$form.find('input[name = "action_type"]').val(),
	servlet=$form.attr('action');
	$.ajax
	({
		cache:false,
		type:'POST',
		url:servlet,
		data:{
			i:docid,
			n:docname,
			c:doccity,
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

function updateb (x){
	$.ajax
	({
	cache:false,
	url:"PatientControllerAjax?action=update&id="+x,
	data:{x:'x'},
	success:function(result)
	{
		 $('html, body').animate({
		        scrollTop: $("#DOCL").offset().top
		    }, 1000);
		 $("#formpatientupdate").html($(result).find("#pos1"));
	},
	dataType:'html'
	});
}
function updateb2(){
	{
		event.preventDefault();
		var $form = $('#pos1'),
		patientid = $form.find('input[name="id"]').val(),
		patientlname = $form.find('input[name = "lname"]').val(),
		patientname = $form.find('input[name="name"]').val(),
		patientcity = $form.find('input[name="city"]').val(),	
		a=$form.find('input[name = "action_type"]').val(),
		servlet=$form.attr('action');
		$.ajax
		({
			cache:false,
			type:'POST',
			url:servlet,
			data:{
				id:patientid,
				name:patientname,
				lname:patientlname,
				city:patientcity,
				action_type:a
				
				 },
			datatype:'html',
			success:function(result)
			{
				
				$("#patient_rows").html($(result).find("#table1")); 
				$('#pos1').hide();
			}
		});
		}
}
</script>
  <!-- Theme Made By www.w3schools.com - No Copyright -->
  <title>����</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
  <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
  <script src="http://code.jquery.com/jquery-latest.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="OREZ.css">
  <style>
  #rowp{
    display: inline; 
  }
  body {
      font: 400 15px Lato, sans-serif;
      line-height: 1.8;
      color: #818181;
  }
  h2 {
      font-size: 24px;
      text-transform: uppercase;
      color: #303030;
      font-weight: 600;
      margin-bottom: 30px;
  }
  h4 {
      font-size: 19px;
      line-height: 1.375em;
      color: #303030;
      font-weight: 400;
      margin-bottom: 30px;
  }  
table {
    text-align: center;
    background-color: gray;
    font-size:20px;
	text-shadow: 2px 1px  #b30000;
	color:#ff0000;
    opacity: 0.8;
    filter: alpha(opacity=80);
}

  .jumbotron {
      background-color:darkcyan;
      color: #fff;
      padding: 100px 25px;
      font-family: Montserrat, sans-serif;
  }
  .container-fluid {
      padding: 60px 50px;
  }
  .bg-grey {
      background-color: #f6f6f6;
  }
  .logo-small {
      color: red;
      font-size: 50px;
  }
  .logo {
      color: red;
      font-size: 200px;
  }
  .thumbnail {
      padding: 0 0 15px 0;
      border: none;
      border-radius: 0;
  }
  .thumbnail img {
      width: 100%;
      height: 100%;
      margin-bottom: 10px;
  }
  .carousel-control.right, .carousel-control.left {
      background-image: none;
      color: #f4511e;
  }
  .carousel-indicators li {
      border-color: #f4511e;
  }
  .carousel-indicators li.active {
      background-color: #f4511e;
  }
  .item h4 {
      font-size: 19px;
      line-height: 1.375em;
      font-weight: 400;
      font-style: italic;
      margin: 70px 0;
  }
  .item span {
      font-style: normal;
  }
  .panel {
      border: 1px solid red; 
      border-radius:0 !important;
      transition: box-shadow 0.5s;
  }
  .panel:hover {
      box-shadow: 5px 0px 40px rgba(0,0,0, .2);
  }
  .panel-footer .btn:hover {
      border: 1px solid red;
      background-color: #fff !important;
      color: #f4511e;
  }
  .panel-heading {
      color: white!important;
      background-color: red !important;
      padding: 25px;
      border-bottom: 1px solid transparent;
      border-top-left-radius: 0px;
      border-top-right-radius: 0px;
      border-bottom-left-radius: 0px;
      border-bottom-right-radius: 0px;
  }
  .panel-footer {
      background-color: white !important;
  }
  .panel-footer h3 {
      font-size: 32px;
  }
  .panel-footer h4 {
      color: #ared;
      font-size: 14px;
  }
  .panel-footer .btn {
      margin: 15px 0;
      background-color: red;
      color: #fff;
  }
  .navbar {
      margin-bottom: 0;
      background-color: red;
      z-index: 9999;
      border: 0;
      font-size: 12px !important;
      line-height: 1.42857143 !important;
      letter-spacing: 4px;
      border-radius: 0;
      font-family: Montserrat, sans-serif;
  }
  .navbar li a, .navbar .navbar-brand {
      color: #fff !important;
  }
  .navbar-nav li a:hover, .navbar-nav li.active a {
      color: red!important;
      background-color: #fff !important;
  }
  .navbar-default .navbar-toggle {
      border-color: transparent;
      color: #fff !important;
  }
  footer .glyphicon {
      font-size:20px;
      margin-bottom: 20px;
      color: #f4511e;
  }
  .slideanim {visibility:hidden;}
  .slide {
      animation-name: slide;
      -webkit-animation-name: slide;
      animation-duration: 1s;
      -webkit-animation-duration: 1s;
      visibility: visible;
  }
  @keyframes slide {
    0% {
      opacity: 0;
      transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      transform: translateY(0%);
    }
  }
  @-webkit-keyframes slide {
    0% {
      opacity: 0;
      -webkit-transform: translateY(70%);
    } 
    100% {
      opacity: 1;
      -webkit-transform: translateY(0%);
    }
  }
  @media screen and (max-width: 768px) {
    .col-sm-4 {
      text-align: center;
      margin: 25px 0;
    }
    .btn-lg {
        width: 100%;
        margin-bottom: 35px;
    }
  }
  @media screen and (max-width: 480px) {
    .logo {
        font-size: 150px;
    }
  }
  </style>
</head>
<body id="myPage" data-spy="scroll" data-target=".navbar" data-offset="60">
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#myPage">����</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#about">�����</a></li>
        <li><a href="#services">�������</a></li>
        <li><a href="#portfolio">��������� </a></li>
        <li><a href="#patienL">������</a></li>
        <li ><a  href="#DOCL">����� ������ ������</a></li>
      </ul>
    </div>
  </div>
</nav>

<div class="jumbotron text-center">
  <h1>��� ���!</h1> 
  <p>��� ����� �� ����� ������� ��� ����� ���� ��� ����� </p> 
  <form>
    <div class="input-group">
      <input type="email" class="form-control"  placeholder="����� ����� ���" required>
      <div class="input-group-btn">
        <button type="button" class="btn btn-danger" >���</button>
      </div>
    </div>
  </form>
</div>

<!-- Container (About Section) -->
<div id="DOCL" class="container-fluid">
  <div class="row">
   		 <div class="col-sm-8">
        <h2>����� ������</h2>
       
       
     	 <table id = "table2">
		<div id = "doc_rows"></div>
    	</table>
    	
   		 </div>
   		 
    <div class="col-sm-4">
   <div id="formdocupdate"></div>
    </div>
  </div>
</div>

<div id="patienL" class="container-fluid">
  <div class="rowp">
   		 
   <h2>����� �����</h2>
   <div id = "patient_rows"></div>	
   <div id="formpatientupdate"></div>
    
  </div>
</div>
<div id="about" class="container-fluid">
  <div class="row">
    <div class="col-sm-8">
      <h2>�����</h2>
      <h4>���� ��� ���� ���� ���� ����� ������ ����� ����� ����� ������ ������ ���� ����� �����.</h4><br>
      <p>�����, ����� ����� �� ������� ������ ����� ��� ������ ������ ���� ������ ����� ����� ����� ���� ����� �����, ���� ���� �� ������� �� �� ������� ����� ����� ������ �����������. ����� ���� ����� ����� ����� ����� ��������� ������ ����� ���� ��� ���� ������� ����� ���� �������.
      ����� �����, ���� ���� ������� ����� ������� ��������� �� ���������� ������� ����� ����� �������� ����� ���! (���� ����..)</p>
      <br><button class="btn btn-default btn-lg">��� ���</button>
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-signal logo"></span>
    </div>
  </div>
</div>

<div class="container-fluid bg-grey">
  <div class="row">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-globe logo slideanim"></span>
    </div>
    <div class="col-sm-8">
      <h2>������ ����</h2><br>
      <h4><strong>����:</strong> ����� ���� ��� ���� ��, ����� �� ������ ����� ����� ����� ����� ����� ������ ����� ���� �����. ������ ���� ���� ������� ������ ����� ����� �� ��� ���� �� ��, ��� �����!</h4><br>
      <p><strong>����:</strong>   �������, ���� ������ ���� ����� ��� ����� ������ ����� �� ��� ����� ������, ��� ���� ����� ����� ������ ����� ����� ������ ����� ������ ����, ��� ���� ��� ������. </p>
    </div>
  </div>
</div>

<!-- Container (Services Section) -->
<div id="services" class="container-fluid text-center">
  <h2>�������</h2>
  <h4>�� ����� ������?</h4>
  <br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-off logo-small"></span>
      <h4>����� �� ���</h4>
      
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-heart logo-small"></span>
      <h4>������ ������</h4>
     
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-lock logo-small"></span>
      <h4>����� ������</h4>
     
    </div>
  </div>
  <br><br>
  <div class="row slideanim">
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-leaf logo-small"></span>
      <h4>������ �����</h4>
      
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-certificate logo-small"></span>
      <h4>����� ����� ������</h4>
     
    </div>
    <div class="col-sm-4">
      <span class="glyphicon glyphicon-wrench logo-small"></span>
      <h4 style="color:#303030;">��� ����</h4>
      
    </div>
  </div>
</div>

<!-- Container (Portfolio Section) -->
<div id="portfolio" class="container-fluid text-center bg-grey">
  <h2>������ �������</h2><br>
  <h4>���� ����� �������</h4>
  <div class="row text-center slideanim">
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/7/79/Paris_06_Eiffelturm_4828.jpg/230px-Paris_06_Eiffelturm_4828.jpg" alt="Paris" width="400" height="300">
        <p><strong>����</strong></p>
        <p>��, �� ����� ������ ��</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="https://upload.wikimedia.org/wikipedia/commons/9/90/Trump-Tower-2.jpg" alt="New York" width="400" height="300">
        <p><strong>��� ����</strong></p>
        <p>�� ����..</p>
      </div>
    </div>
    <div class="col-sm-4">
      <div class="thumbnail">
        <img src="http://images1.ynet.co.il//PicServer4/2016/03/31/6911874/6911841099095980698no.jpg" alt="San Francisco" width="400" height="300">
        <p><strong>�� ��������</strong></p>
        <p>��� ����� ���</p>
      </div>
    </div>
  </div><br>
  
  <h2>�� �� ������� ���� ����?</h2>
  <div id="myCarousel" class="carousel slide text-center" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
      <div class="item active">
        <h4>"����, ���� ������ ������ �����"</span></h4>
      </div>
      <div class="item">
        <h4>"���� ������� ������"<br><span>��� ���, ���� ����</span></h4>
      </div>
      <div class="item">
        <h4>"�� ���� ����� �� ����� ���� ����� ����!"<br><span>���� ����, ��� ���� ���� ��� ��������</span></h4>
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">���</span>
    </a>
  </div>
</div>

<!-- Container (Pricing Section) -->
<div id="pricing" class="container-fluid">
  <div class="text-center">
    <h2>������</h2>
    <h4>��� �� ����� ������ ������ ��</h4>
  </div>
  <div class="row slideanim">
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>����� �����</h1>
        </div>
        <div class="panel-body">
          <p> ��� �������-<strong>20</strong></p>
          <p> ���� ������ ����� (���')-<strong>15</strong></p>
          <p>��� ���-<strong>5</strong> </p>
          <p> ������ ����- <strong>2</strong></p>
          <p><strong>����:</strong> ����</p>
        </div>
        <div class="panel-footer">
          <h3>150 �"�</h3>
          <h4>�����</h4>
          <button class="btn btn-lg">���</button>
        </div>
      </div>      
    </div>     
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>�����</h1>
        </div>
        <div class="panel-body">
         <p> ��� �������-<strong>30</strong></p>
          <p> ���� ������ ����� (���')-<strong>30</strong></p>
          <p>��� ���-<strong>10</strong> </p>
          <p> ������ ����- <strong>3</strong></p>
          <p><strong>����:</strong> �������</p>
        </div>
        <div class="panel-footer">
          <h3>300 �"�</h3>
          <h4>�����</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>       
    <div class="col-sm-4 col-xs-12">
      <div class="panel panel-default text-center">
        <div class="panel-heading">
          <h1>�����</h1>
        </div>
        <div class="panel-body">
          <p> ��� �������-<strong>40</strong></p>
          <p> ���� ������ ����� (���')-<strong>50</strong></p>
          <p>��� ���-<strong>20</strong> </p>
          <p> ������ ����- <strong>6</strong></p>
          <p><strong>����:</strong> ����</p>
        </div>
        <div class="panel-footer">
          <h3>600 �"�</h3>
          <h4>�����</h4>
          <button class="btn btn-lg">Sign Up</button>
        </div>
      </div>      
    </div>    
  </div>
</div>

<!-- Container (Contact Section) -->
<div id="contact" class="container-fluid bg-grey">
  <h2 class="text-center">����� ���</h2>
  <div class="row">
    <div class="col-sm-5">
      <p>��� ����� ��� ������ ���� ���� 24 ����</p>
      <p><span class="glyphicon glyphicon-map-marker"></span> ��� ��� ,�����</p>
      <p><span class="glyphicon glyphicon-phone"></span> 0504060101</p>
      <p><span class="glyphicon glyphicon-envelope"></span> momo@gmail.com</p>
    </div>
    <div class="col-sm-7 slideanim">
      <div class="row">
        <div class="col-sm-6 form-group">
          <input class="form-control" id="name" name="name" placeholder="��" type="text" required>
        </div>
        <div class="col-sm-6 form-group">
          <input class="form-control" id="email" name="email" placeholder="����" type="email" required>
        </div>
      </div>
      <textarea class="form-control" id="comments" name="comments" placeholder="�����" rows="5"></textarea><br>
      <div class="row">
        <div class="col-sm-12 form-group">
          <button class="btn btn-default pull-right" type="submit">���</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Add Google Maps -->
<div id="googleMap" style="height:400px;width:100%;"></div>
<script>
function myMap() {
var myCenter = new google.maps.LatLng(41.878114, -87.629798);
var mapProp = {center:myCenter, zoom:12, scrollwheel:false, draggable:false, mapTypeId:google.maps.MapTypeId.ROADMAP};
var map = new google.maps.Map(document.getElementById("googleMap"),mapProp);
var marker = new google.maps.Marker({position:myCenter});
marker.setMap(map);
}
</script>

<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBu-916DdpKAjTmJNIgngS6HL_kDIKU0aU&callback=myMap"></script>
<!--
To use this code on your website, get a free API key from Google.
Read more at: https://www.w3schools.com/graphics/google_maps_basic.asp
-->

<footer class="container-fluid text-center">
  <a href="#myPage" title="To Top">
    <span class="glyphicon glyphicon-chevron-up"></span>
  </a>
  <p>Bootstrap Theme Made By <a href="https://www.w3schools.com" title="Visit w3schools">www.w3schools.com</a></p>
</footer>

<script>

$(document).ready(function(){
	
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a[href = '#DOCL'], footer a[href='#myPage']").on('click', function(event) {
	  $.ajax(
				{
					
					cache: false,
					url:"DocControllerAjax?action=listDoc",
					data:{xxx:"xxx"},
					success: function(result)
					{
						$("#doc_rows").html($(result).find("#tdoc"));
					},
					dataType: 'html'
					
				}		
		);
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  }
  
  );
})
</script>
<script>

$(document).ready(function(){
	
  // Add smooth scrolling to all links in navbar + footer link
  $(".navbar a[href = '#patienL'], footer a[href='#myPage']").on('click', function(event) {
	  $.ajax(
				{
					
					cache: false,
					url:"PatientControllerAjax?action=Patientlist",
					data:{xxx:"xxx"},
					success: function(result)
					{
						$("#patient_rows").html($(result).find("#table1"));
					},
					dataType: 'html'
					
				}		
		);
    // Make sure this.hash has a value before overriding default behavior
    if (this.hash !== "") {
      // Prevent default anchor click behavior
      event.preventDefault();

      // Store hash
      var hash = this.hash;

      // Using jQuery's animate() method to add smooth page scroll
      // The optional number (900) specifies the number of milliseconds it takes to scroll to the specified area
      $('html, body').animate({
        scrollTop: $(hash).offset().top
      }, 900, function(){
   
        // Add hash (#) to URL when done scrolling (default click behavior)
        window.location.hash = hash;
      });
    } // End if
  });
  
  $(window).scroll(function() {
    $(".slideanim").each(function(){
      var pos = $(this).offset().top;

      var winTop = $(window).scrollTop();
        if (pos < winTop + 600) {
          $(this).addClass("slide");
        }
    });
  }
  
  );
})
</script>
</body>
</html>

</body>
</html>