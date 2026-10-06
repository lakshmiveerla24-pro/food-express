<%
String restaurantName=(String)session.getAttribute("restaurant_name");

if(restaurantName==null)
{
response.sendRedirect("restaurantlogin.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Restaurant Dashboard</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

.header{

background:#fc8019;
color:white;
padding:20px;
text-align:center;

}

.container{

width:700px;
margin:50px auto;
text-align:center;

}

.card{

display:inline-block;
width:220px;
padding:25px;
margin:15px;
background:white;
border-radius:10px;
box-shadow:0 0 10px gray;

}

.card a{

text-decoration:none;
font-size:20px;
font-weight:bold;
color:#fc8019;

}

</style>

</head>

<body>

<div class="header">

<h2>

Welcome

<%=restaurantName%>

</h2>

</div>

<div class="container">

<div class="card">

<a href="restaurantfoods.jsp">

Manage Food

</a>

</div>

<div class="card">

<a href="restaurantorders.jsp">

View Orders

</a>

</div>

<div class="card">

<a href="restaurantlogout.jsp">

Logout

</a>

</div>

</div>

</body>

</html>