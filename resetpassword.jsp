<!DOCTYPE html>
<html>
<head>

<title>Reset Password</title>

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

.header{
background:#fc8019;
padding:18px 60px;
color:white;
font-size:30px;
font-weight:bold;
}

.container{

width:450px;
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

input[type=password],
input[type=text]{

width:100%;
padding:12px;
margin:10px 0;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}

input[type=submit]{

width:100%;
padding:12px;
margin-top:20px;
background:#fc8019;
color:white;
font-size:18px;
font-weight:bold;
border:none;
border-radius:5px;
cursor:pointer;

}

input[type=submit]:hover{

background:#e46f0f;

}

#msg{

color:red;
font-size:15px;
font-weight:bold;

}

.show{

margin-top:10px;

}

.footer{

margin-top:70px;
background:#333;
color:white;
text-align:center;
padding:20px;

}

</style>

<script>

function validatePassword()
{

var pass=document.getElementById("password").value;

var cpass=document.getElementById("cpassword").value;

var special=/[!@#$%^&*(),.?":{}|<>]/;

if(pass.length<6)
{

document.getElementById("msg").innerHTML=
"Password must be at least 6 characters.";

return false;

}

if(!special.test(pass))
{

document.getElementById("msg").innerHTML=
"Password must contain at least one special character.";

return false;

}

if(pass!=cpass)
{

document.getElementById("msg").innerHTML=
"Passwords do not match.";

return false;

}

document.getElementById("msg").innerHTML="";

return true;

}

function showPassword()
{

var p=document.getElementById("password");

var cp=document.getElementById("cpassword");

if(p.type=="password")
{

p.type="text";

cp.type="text";

}
else
{

p.type="password";

cp.type="password";

}

}

</script>

</head>

<body>

<div class="header">

FOOD EXPRESS

</div>

<div class="container">

<h2>Reset Password</h2>

<form
action="updatepassword.jsp"
method="post"
onsubmit="return validatePassword()">

<input
type="password"
id="password"
name="password"
placeholder="Enter New Password"
required>

<input
type="password"
id="cpassword"
placeholder="Confirm Password"
required>

<div class="show">

<input
type="checkbox"
onclick="showPassword()">

Show Password

</div>

<p id="msg"></p>

<p style="color:gray;font-size:14px;">

Password must contain:

<br>

Minimum 6 characters

<br>

At least 1 special character

</p>

<input
type="submit"
value="Update Password">

</form>

</div>

<div class="footer">

<h3>FoodExpress - Online Food Ordering System</h3>

<p>

© 2026 All Rights Reserved.

</p>

</div>

</body>
</html>