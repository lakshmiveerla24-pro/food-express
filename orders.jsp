<%@ page import="java.sql.*"%>

<%@ include file="header.jsp" %>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>My Orders</title>

<style>

body{
font-family:Arial,sans-serif;
background:#f5f5f5;
margin:0;
padding:0;
}

h2{
text-align:center;
margin-top:30px;
color:#fc8019;
}

table{
width:95%;
margin:30px auto;
border-collapse:collapse;
background:white;
box-shadow:0 0 10px lightgray;
}

th{
background:#fc8019;
color:white;
padding:12px;
}

td{
padding:12px;
border:1px solid #ddd;
text-align:center;
}

.status{
padding:8px 15px;
border-radius:20px;
color:white;
font-weight:bold;
display:inline-block;
}

.placed{
background:#ff9800;
}

.preparing{
background:#2196f3;
}

.delivery{
background:#9c27b0;
}

.delivered{
background:#4caf50;
}

.cancelled{
background:red;
}

.cancelbtn{
background:red;
color:white;
padding:8px 15px;
border-radius:5px;
text-decoration:none;
}

.cancelbtn:hover{
background:darkred;
}

.invoicebtn{
background:green;
color:white;
padding:8px 15px;
border-radius:5px;
text-decoration:none;
}

.invoicebtn:hover{
background:darkgreen;
}

.feedbackbtn{
background:#fc8019;
color:white;
padding:12px 25px;
border-radius:5px;
text-decoration:none;
font-size:18px;
font-weight:bold;
}

.feedbackbtn:hover{
background:#e46f0f;
}

</style>

</head>

<body>

<h2>My Orders</h2>

<table>

<tr>

<th>Order ID</th>
<th>Amount</th>
<th>Payment</th>
<th>Tracking</th>
<th>Refund</th>
<th>Action</th>
<th>Invoice</th>
<th>Date</th>

</tr>

<%

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from orders where username=? order by order_id desc");

ps.setString(1,username);

ResultSet rs=ps.executeQuery();

while(rs.next())
{

String status=rs.getString("status");
String refund=rs.getString("refund_status");

%>

<tr>

<td><%=rs.getInt("order_id")%></td>

<td><%=rs.getDouble("amount")%></td>

<td><%=rs.getString("payment_mode")%></td>

<td>

<%

if(status.equalsIgnoreCase("Order Placed"))
{
%>

<span class="status placed">Order Placed</span>

<%
}
else if(status.equalsIgnoreCase("Preparing"))
{
%>

<span class="status preparing">Preparing</span>

<%
}
else if(status.equalsIgnoreCase("Out For Delivery"))
{
%>

<span class="status delivery">Out For Delivery</span>

<%
}
else if(status.equalsIgnoreCase("Delivered"))
{
%>

<span class="status delivered">Delivered</span>

<%
}
else if(status.equalsIgnoreCase("Cancelled"))
{
%>

<span class="status cancelled">Cancelled</span>

<%
}
else
{
out.print(status);
}

%>

</td>

<td>

<%=refund==null?"-":refund%>

</td>

<td>

<%

if(status.equalsIgnoreCase("Order Placed"))
{
%>

<a class="cancelbtn"
href="cancelorder.jsp?id=<%=rs.getInt("order_id")%>"
onclick="return confirm('Are you sure you want to cancel this order?');">

Cancel Order

</a>

<%
}
else
{
%>

--

<%
}
%>

</td>

<td>

<a class="invoicebtn"
href="invoice.jsp?id=<%=rs.getInt("order_id")%>">

View Invoice

</a>

</td>

<td>

<%=rs.getTimestamp("order_date")%>

</td>

</tr>

<%

}

rs.close();
ps.close();
con.close();

}
catch(Exception e)
{
out.println(e);
}

%>

</table>

<br><br>

<center>

<a href="feedback.jsp" class="feedbackbtn">

Give Feedback

</a>

</center>

<br><br>

</body>

</html>