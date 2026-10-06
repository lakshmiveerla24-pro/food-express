<%
String deliveryName=(String)session.getAttribute("delivery_name");

if(deliveryName==null)
{
response.sendRedirect("deliverylogin.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Delivery Dashboard</title>

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

<%=deliveryName%>

</h2>

</div>

<div class="container">

<div class="card">

<a href="deliveryorders.jsp">

View Orders

</a>

</div>

<div class="card">

<a href="deliverylogout.jsp">

Logout

</a>

</div>

</div>

</body>

</html>