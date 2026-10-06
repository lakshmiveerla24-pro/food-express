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
String name=(String)session.getAttribute("name");
String email=(String)session.getAttribute("email");
String mobile=(String)session.getAttribute("mobile");
String address=(String)session.getAttribute("address");
String username=(String)session.getAttribute("username");
String password=(String)session.getAttribute("password");

String error=(String)session.getAttribute("error");

if(error!=null)
{
    session.removeAttribute("error");
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Customer Registration - FoodExpress</title>

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
    font-size:32px;
    font-weight:bold;
}

.logo img{
    width:60px;
    height:60px;
    margin-right:12px;
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
    color:#222;
}

/* REGISTRATION FORM */

.container{

width:450px;
margin:50px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px lightgray;

}

.container h2{

text-align:center;
color:#fc8019;
margin-bottom:25px;

}

input,textarea{

width:100%;
padding:12px;
margin:10px 0;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}

textarea{
height:80px;
resize:none;
}

input[type=submit]{

background:#fc8019;
color:white;
border:none;
cursor:pointer;
font-size:18px;
font-weight:bold;

}

input[type=submit]:hover{

background:#e46f0f;

}

.login{

text-align:center;
margin-top:15px;

}

.login a{

text-decoration:none;
color:#fc8019;
font-weight:bold;

}

.login a:hover{

text-decoration:underline;

}

/* FOOTER */

.footer{

background:#333;
color:white;
text-align:center;
padding:20px;
margin-top:50px;

}

</style>

</head>

<body>

<!-- HEADER -->

<div class="header">

<div class="logo">

<img src="images/logo.png" alt="Logo">

<span>FOOD EXPRESS</span>

</div>

<div class="menu">

<a href="index.jsp">Home</a>
<a href="register.jsp">Register</a>
<a href="login.jsp">Login</a>
<a href="index.jsp#about">About</a>
<a href="index.jsp#contact">Contact</a>

</div>

</div>

<!-- REGISTRATION FORM -->

<div class="container">

<h2>Customer Registration</h2>
<%
if(error!=null)
{
%>

<p style="color:red;
text-align:center;
font-weight:bold;
margin-bottom:15px;">

<%=error%>

</p>

<script>

window.onload=function()
{
document.getElementById("mobile").focus();
};

</script>

<%
}
%>

<form action="sendotp.jsp" method="post">

<input type="text"
name="name"
placeholder="Enter Full Name"
value="<%=name==null?"":name%>"
required>

<input type="email"
name="email"
placeholder="Enter Email Address"
value="<%=email==null?"":email%>"
required>

<input type="text"
id="mobile"
name="mobile"
placeholder="Enter Mobile Number"
value="<%=mobile==null?"":mobile%>"
pattern="[0-9]{10}"
maxlength="10"
title="Enter 10 digit mobile number"
required>
<textarea
name="address"
placeholder="Enter Address"
required><%=address==null?"":address%></textarea>

<input type="text"
name="username"
placeholder="Create Username"
value="<%=username==null?"":username%>"
required>

<input type="password"
id="password"
name="password"
placeholder="Create Password"
value="<%=password==null?"":password%>"
minlength="6"
maxlength="20"
required
onkeyup="validatePassword()">

<span id="msg" style="font-weight:bold;"></span>

<p style="font-size:14px;color:gray;margin-top:5px;">
Password must contain:
<br>
Minimum 6 characters
<br>
 At least 1 special character (@,#,$,%,&,!)
</p>

<input type="submit" value="Send OTP">
   
</form>

<div class="login">

Already have an account?

<a href="login.jsp">Login Here</a>

</div>

</div>

<!-- FOOTER -->

<div class="footer">

<h3>FoodExpress - Online Food Ordering System</h3>

<p>© 2026 All Rights Reserved.</p>

</div>
<script>

function validatePassword()
{
    var pass = document.getElementById("password").value;

    var special = /[!@#$%^&*(),.?":{}|<>]/;

    if(pass.length < 6)
    {
        document.getElementById("msg").style.color="red";
        document.getElementById("msg").innerHTML=
        "Password must be at least 6 characters.";
    }
    else if(!special.test(pass))
    {
        document.getElementById("msg").style.color="red";
        document.getElementById("msg").innerHTML=
        "Password must contain at least one special character.";
    }
    else
    {
        document.getElementById("msg").style.color="green";
        document.getElementById("msg").innerHTML=
        "Strong Password ";
    }
}

</script>
</body>
</html>