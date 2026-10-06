<%@ page import="java.util.Random"%>
<%@ page import="java.sql.*"%>

<%
String mobile=request.getParameter("mobile");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

String otp="";

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

ps=con.prepareStatement(
"select * from customer where mobile=?");

ps.setString(1,mobile);

rs=ps.executeQuery();

if(rs.next())
{

Random random=new Random();

otp=String.valueOf(100000+random.nextInt(900000));

session.setAttribute("forgototp",otp);

session.setAttribute("forgotmobile",mobile);

}
else
{
%>

<script>

alert("Mobile Number Not Registered.");

window.location="forgotpassword.jsp";

</script>

<%
return;

}

}
catch(Exception e)
{

out.println(e);

}
finally
{

try{

if(rs!=null) rs.close();

if(ps!=null) ps.close();

if(con!=null) con.close();

}catch(Exception ex){}

}
%>

<!DOCTYPE html>

<html>

<head>

<title>Verify OTP</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<style>

body{

background:#fff8f0;
font-family:Arial;

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

title:'OTP Generated',

html:'<b>Your OTP : <span style="color:#fc8019;font-size:22px;"><%=otp%></span></b>'

});

}

</script>

</head>

<body>

<div class="box">

<h2>OTP Verification</h2>

<p>

Enter the OTP below.

</p>

<div id="timer" class="timer"></div>

<form action="verifyforgototp.jsp" method="post">

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