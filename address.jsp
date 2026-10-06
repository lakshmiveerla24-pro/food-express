<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String amount=request.getParameter("amount");
String location=(String)session.getAttribute("location");
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Select Delivery Address</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
margin:0;
}

.container{

width:500px;
margin:60px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;

}

h2{

text-align:center;
color:#fc8019;
margin-bottom:25px;

}

label{

font-weight:bold;

}

input,textarea{

width:100%;
padding:12px;
margin-top:8px;
margin-bottom:20px;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}

textarea{

height:120px;
resize:none;

}

button{

width:100%;
padding:12px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
border-radius:5px;
cursor:pointer;

}

button:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<div class="container">

<h2>Select Delivery Address</h2>

<form action="payment.jsp" method="post">

<input
type="hidden"
name="amount"
value="<%=amount%>">

<label>Delivery Location</label>

<input
type="text"
value="<%=location%>"
readonly>

<label>Full Delivery Address</label>

<textarea
name="address"
placeholder="Enter House No, Street, Landmark"
required></textarea>

<button type="submit">

Continue To Payment

</button>

</form>

</div>

</body>

</html>