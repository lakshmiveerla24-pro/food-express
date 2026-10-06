<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<%
String location=(String)session.getAttribute("location");

if(location==null)
{
%>

<script>
alert("Please select your delivery location first.");
window.location="index.jsp";
</script>

<%
return;
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Login - FoodExpress</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#fff8f0;
}

/* Header */

.header{
background:#fc8019;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
}

.logo{
display:flex;
align-items:center;
color:white;
font-size:30px;
font-weight:bold;
}

.logo img{
width:60px;
height:60px;
margin-right:10px;
border-radius:50%;
}

.menu a{
color:white;
text-decoration:none;
margin-left:25px;
font-size:18px;
font-weight:bold;
}

.menu a:hover{
color:black;
}

/* Login Form */

.container{

width:400px;
margin:60px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 10px gray;

}

.container h2{

text-align:center;
color:#fc8019;
margin-bottom:20px;

}

input{

width:100%;
padding:12px;
margin:10px 0;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}

input[type=submit]{

background:#fc8019;
color:white;
border:none;
font-size:18px;
cursor:pointer;

}

input[type=submit]:hover{

background:#e46f0f;

}

.footer{

margin-top:70px;
background:#333;
color:white;
text-align:center;
padding:20px;

}

</style>

</head>

<body>

<div class="header">

<div class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS</span>

</div>

<div class="menu">

<a href="index.jsp">Home</a>
<a href="register.jsp">Register</a>
<a href="login.jsp">Login</a>

</div>

</div>

<div class="container">

<h2>Customer Login</h2>

<form action="loginprocess.jsp" method="post">

<input type="text"
name="username"
placeholder="Enter Username"
required>

<input type="password"
name="password"
placeholder="Enter Password"
required>
<div style="text-align:right;margin-top:8px;">

<a href="forgotpassword.jsp"
style="text-decoration:none;
color:#fc8019;
font-weight:bold;">

Forgot Password?

</a>

</div>

<input type="submit"
value="Login">

</form>

<br>

<center>

New User?

<a href="register.jsp">

Register Here

</a>

</center>

</div>

<div class="footer">

<h3>FoodExpress - Online Food Ordering System</h3>

</div>

</body>
</html>