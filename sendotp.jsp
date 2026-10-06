<%@ page import="java.util.Random" %>
<%@ page import="java.sql.*" %>

<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");
String username=request.getParameter("username");
String password=request.getParameter("password");

/* Check Empty Fields */
if(name==null || email==null || mobile==null ||
address==null || username==null || password==null)
{
    response.sendRedirect("register.jsp");
    return;
}

/* Password Validation */
/* Password Validation */

if(password.length()<6)
{
%>

<script>

alert("Password must be at least 6 characters.");

history.back();

</script>

<%
return;
}

if(!password.matches(".*[!@#$%^&*(),.?\":{}|<>].*"))
{
%>

<script>

alert("Password must contain at least one special character.");

history.back();

</script>

<%
return;
}

/* OTP Variable */

String otp="";

/* Database Variables */

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");


/* Generate OTP */

Random random=new Random();

otp=String.valueOf(100000+random.nextInt(900000));

/* Store Session */

session.setAttribute("otp",otp);
session.setAttribute("name",name);
session.setAttribute("email",email);
session.setAttribute("mobile",mobile);
session.setAttribute("address",address);
session.setAttribute("username",username);
session.setAttribute("password",password);

}
catch(Exception e)
{
out.println("<h2 style='color:red'>"+e+"</h2>");
}
finally
{

try{

if(rs!=null) rs.close();

if(ps!=null) ps.close();

if(con!=null) con.close();

}
catch(Exception ex){}

}
%>
<!DOCTYPE html>
<html>

<head>

<title>OTP Verification</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

body{
background:#fff8f0;
font-family:Arial,sans-serif;
}

.box{
width:450px;
margin:80px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 15px lightgray;
text-align:center;
}

h2{
color:#fc8019;
}

.message{
color:green;
font-size:18px;
margin-top:15px;
line-height:28px;
}

input{
width:90%;
padding:12px;
margin-top:20px;
font-size:18px;
border:1px solid #ccc;
border-radius:5px;
}

button{
margin-top:20px;
padding:12px 25px;
background:#fc8019;
color:white;
border:none;
border-radius:5px;
cursor:pointer;
font-size:18px;
}

button:hover{
background:#e46f0f;
}

.timer{
color:red;
margin-top:20px;
font-size:18px;
font-weight:bold;
}

</style>

<script>

var timeLeft=30;

function countdown()
{
if(timeLeft>=0)
{
document.getElementById("timer").innerHTML=
"OTP Expires In : "+timeLeft+" Seconds";

timeLeft--;

setTimeout(countdown,1000);
}
}

window.onload=function()
{

countdown();

const Toast=Swal.mixin({

toast:true,

position:'bottom-end',

showConfirmButton:false,

timer:7000,

timerProgressBar:true

});

Toast.fire({

icon:'success',

title:'OTP Sent Successfully',

html:'<b>Your OTP : <span style="color:#fc8019;font-size:22px;"><%=otp%></span></b><br><small>Enter this OTP to verify your Mobile Number.</small>'

});

}

</script>

</head>

<body>

<div class="box">

<h2>OTP Verification</h2>

<p class="message">

A verification code has been generated successfully.

</p>

<div id="timer" class="timer"></div>

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

<br>

<a href="register.jsp">

<button type="button">

Resend OTP

</button>

</a>

</div>

</body>

</html>