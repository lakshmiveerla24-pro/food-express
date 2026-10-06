<%@ page import="java.sql.*"%>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String id=request.getParameter("id");

String status="";

try
{
Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"SELECT status FROM orders WHERE order_id=? AND username=?");

ps.setInt(1,Integer.parseInt(id));
ps.setString(2,username);

ResultSet rs=ps.executeQuery();

if(rs.next())
{
    status=rs.getString("status");
}

con.close();

}
catch(Exception e)
{
out.println(e);
}
%>

<!DOCTYPE html>

<html>

<head>

<title>Track Order</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

.container{
width:600px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px lightgray;
}

h2{
text-align:center;
color:#fc8019;
margin-bottom:30px;
}

.step{
padding:15px;
margin:15px 0;
border-radius:8px;
font-size:20px;
font-weight:bold;
background:#ddd;
color:#555;
}

.active{
background:#4CAF50;
color:white;
}

.cancel{
background:red;
color:white;
}

.back{
display:block;
width:180px;
margin:30px auto;
text-align:center;
padding:12px;
background:#fc8019;
color:white;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<div class="container">

<h2>Track Your Order</h2>

<%
if(status.equalsIgnoreCase("Cancelled"))
{
%>

<div class="step cancel">
❌ Order Cancelled
</div>

<%
}
else
{
%>

<div class="step <%= (status.equals("Order Placed") || status.equals("Preparing") || status.equals("Out For Delivery") || status.equals("Delivered")) ? "active":"" %>">

1. Order Placed

</div>

<div class="step <%= (status.equals("Preparing") || status.equals("Out For Delivery") || status.equals("Delivered")) ? "active":"" %>">

2. Preparing

</div>

<div class="step <%= (status.equals("Out For Delivery") || status.equals("Delivered")) ? "active":"" %>">

3. Out For Delivery

</div>

<div class="step <%= status.equals("Delivered") ? "active":"" %>">

4. Delivered

</div>

<%
}
%>

<a href="orders.jsp" class="back">

Back to Orders

</a>

</div>

</body>

</html>