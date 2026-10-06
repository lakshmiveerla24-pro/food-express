<!DOCTYPE html>
<html>
<head>

<title>Forgot Password</title>

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

/* HEADER */

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

/* FORM */

.container{

width:430px;
margin:60px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px lightgray;

}

.container h2{

text-align:center;
color:#fc8019;
margin-bottom:20px;

}

.container p{

text-align:center;
margin-bottom:20px;
color:#666;

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
font-size:18px;
font-weight:bold;
border:none;
cursor:pointer;

}

input[type=submit]:hover{

background:#e46f0f;

}

.back{

text-align:center;
margin-top:20px;

}

.back a{

text-decoration:none;
color:#fc8019;
font-weight:bold;

}

.footer{

background:#333;
color:white;
text-align:center;
padding:20px;
margin-top:80px;

}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">

<div class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS</span>

</div>

<div class="menu">

<a href="index.jsp">Home</a>

<a href="login.jsp">Login</a>

<a href="register.jsp">Register</a>

</div>

</div>

<!-- FORM -->

<div class="container">

<h2>Forgot Password</h2>

<p>

Enter your registered mobile number to receive an OTP.

</p>

<form action="sendforgototp.jsp" method="post">

<input
type="text"
name="mobile"
placeholder="Enter Registered Mobile Number"
pattern="[0-9]{10}"
maxlength="10"
required>

<input
type="submit"
value="Send OTP">

</form>

<div class="back">

<a href="login.jsp">

Back to Login

</a>

</div>

</div>

<div class="footer">

<h3>FoodExpress - Online Food Ordering System</h3>

<p>

© 2026 All Rights Reserved.

</p>

</div>

</body>

</html>