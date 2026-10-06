<%
String otp=(String)session.getAttribute("forgototp");

String userotp=request.getParameter("userotp");

if(otp!=null && userotp!=null && userotp.equals(otp))
{

response.sendRedirect("resetpassword.jsp");

}
else
{
%>

<!DOCTYPE html>

<html>

<head>

<title>Invalid OTP</title>

<style>

body{

background:#fff8f0;
font-family:Arial;

}

.box{

width:400px;
margin:100px auto;
background:white;
padding:30px;
text-align:center;
border-radius:10px;
box-shadow:0 0 10px gray;

}

h2{

color:red;

}

a{

display:inline-block;
margin-top:20px;
text-decoration:none;
background:#fc8019;
color:white;
padding:10px 20px;
border-radius:5px;

}

a:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<div class="box">

<h2>Invalid OTP</h2>

<p>Please enter the correct OTP.</p>

<a href="forgotpassword.jsp">

Try Again

</a>

</div>

</body>

</html>

<%
}
%>