<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
 .red { border: 2px solid red; width:250px; heights:250px; }
 .blue { border: 2px solid blue; width:50px; heights:50px; }
</style> 

<script type="text/javascript"  src="greeting.js"></script>

</head>
<body>
<h1>רשימת ערים</h1>
<table border="4">

   <thead>
   <tr><th>ID</th><th>עיר</th></tr>
   </thead>

   <tbody>
   <c:forEach items="${cities}" var= "city">
     <tr>
       <td><c:out  value = "${city.rid }"    /></td>
       <td><c:out  value = "${city.cityName }" /></td>
       <td>
		  <a href="CityControler?action=delete&ID=<c:out  value="${city.rid}"/>">מחיקה</a>
		  <a href="CityControler?action=update&ID=<c:out  value="${city.rid}"/>">עדכן</a>
		</td>
     </tr>
     
   </c:forEach>
   </tbody>

</table>
<p>
<a href="CityControler?action=insert">add city</a>
</p>

</body>
</html>