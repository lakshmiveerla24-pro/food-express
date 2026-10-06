<%
String user=(String)session.getAttribute("username");

if(user==null)
{
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Customer Home</title>

</head>

<body>

<h1>

Welcome

<%=user%>

</h1>

<hr>

<h2>

<a href="restaurant.jsp">

View Restaurants

</a>

<br><br>

<a href="logout.jsp">

Logout

</a>

</h2>

</body>

</html>