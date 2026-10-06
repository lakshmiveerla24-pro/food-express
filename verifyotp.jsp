<%
String otp=(String)session.getAttribute("otp");
String userotp=request.getParameter("userotp");

if(userotp!=null && userotp.equals(otp))
{
    response.sendRedirect("registerprocess.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>OTP Verification</title>

<style>

body{
background:#fff8f0;
font-family:Arial;
}

.box{
width:420px;
margin:100px auto;
background:white;
padding:30px;
text-align:center;
border-radius:10px;
box-shadow:0 0 10px gray;
}

input{
width:90%;
padding:12px;
margin:15px 0;
font-size:18px;
}

button{
background:#fc8019;
color:white;
border:none;
padding:12px 25px;
font-size:18px;
cursor:pointer;
border-radius:5px;
}

button:hover{
background:#e46f0f;
}

.error{
color:red;
font-weight:bold;
margin-bottom:15px;
}

</style>

</head>

<body>

<div class="box">

<h2 style="color:#fc8019;">OTP Verification</h2>

<%
if(userotp!=null)
{
%>

<div class="error">
Invalid OTP. Please try again.
</div>

<%
}
%>

<form action="verifyotp.jsp" method="post">

<input
type="text"
name="userotp"
placeholder="Enter OTP"
required>

<br>

<button type="submit">
Verify OTP
</button>

</form>

</div>

</body>

</html>