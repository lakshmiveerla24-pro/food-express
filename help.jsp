<%
String user=(String)session.getAttribute("username");

if(user==null)
{
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Help & Support</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

.box{
width:600px;
margin:60px auto;
background:white;
padding:35px;
border-radius:10px;
box-shadow:0 0 10px lightgray;
}

h2{
text-align:center;
color:#fc8019;
margin-bottom:25px;
}

table{
width:100%;
border-collapse:collapse;
}

td{
padding:12px;
font-size:18px;
border-bottom:1px solid #ddd;
}

.question{
font-weight:bold;
color:#fc8019;
}

.footer{
margin-top:25px;
text-align:center;
font-size:18px;
}

</style>

</head>

<body>

<div class="box">

<h2>Help & Support</h2>

<table>

<tr>
<td class="question">Customer Care</td>
<td>+91 9866233167</td>
</tr>

<tr>
<td class="question">Email</td>
<td>support@foodexpress.com</td>
</tr>

<tr>
<td class="question">Support Time</td>
<td>9:00 AM - 9:00 PM</td>
</tr>

<tr>
<td class="question">Address</td>
<td>Tadepalligudem, Andhra Pradesh</td>
</tr>

<tr>
<td class="question">Order Issues</td>
<td>Contact Customer Care immediately.</td>
</tr>

<tr>
<td class="question">Payment Issues</td>
<td>Refund will be processed within 3minutes.</td>
</tr>

<tr>
<td class="question">Delivery Issues</td>
<td>Track your order from the My Orders page.</td>
</tr>

</table>

<div class="footer">

Thank you for choosing <b>FoodExpress</b>.

</div>

</div>

</body>

</html>