<!DOCTYPE html>
<html>
<head>

<title>Admin Login</title>

<style>

body{

font-family:Arial;
background:#fff8f0;

}

.box{

width:400px;
margin:80px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;

}

h2{

text-align:center;
color:#fc8019;

}

input{

width:100%;
padding:12px;
margin:10px 0;
font-size:16px;

}

button{

width:100%;
padding:12px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
cursor:pointer;

}

button:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<div class="box">

<h2>Admin Login</h2>

<form action="adminloginprocess.jsp" method="post">

<input type="text"
name="username"
placeholder="Admin Username"
required>

<input type="password"
name="password"
placeholder="Password"
required>

<button>

Login

</button>

</form>

</div>

</body>

</html>