<%@ page import="java.sql.*" %>

<%
Integer restaurantId=(Integer)session.getAttribute("restaurant_id");

if(restaurantId==null)
{
response.sendRedirect("restaurantlogin.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Restaurant Orders</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

h2{
text-align:center;
color:#fc8019;
margin-top:30px;
}

table{
width:95%;
margin:auto;
border-collapse:collapse;
background:white;
box-shadow:0 0 10px lightgray;
}

th,td{
border:1px solid #ddd;
padding:12px;
text-align:center;
}

th{
background:#fc8019;
color:white;
}

select{
padding:8px;
width:170px;
}

button{
background:green;
color:white;
padding:8px 15px;
border:none;
cursor:pointer;
border-radius:5px;
}

button:hover{
background:darkgreen;
}

.back{
display:inline-block;
margin:20px;
padding:10px 20px;
background:#fc8019;
color:white;
text-decoration:none;
border-radius:5px;
}

.back:hover{
background:#e46f0f;
}

</style>

</head>

<body>

<a href="restaurantdashboard.jsp" class="back">

Back

</a>

<h2>Restaurant Orders</h2>

<table>

<tr>

<th>Order ID</th>
<th>Customer</th>
<th>Delivery Address</th>
<th>Amount</th>
<th>Payment</th>
<th>Status</th>
<th>Order Date</th>
<th>Update Status</th>

</tr>

<%

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"SELECT * FROM orders WHERE restaurant_id=? ORDER BY order_id DESC"

);

ps.setInt(1,restaurantId);

ResultSet rs=ps.executeQuery();

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("order_id")%></td>

<td><%=rs.getString("username")%></td>

<td><%=rs.getString("address")%></td>

<td> <%=rs.getDouble("amount")%></td>

<td><%=rs.getString("payment_mode")%></td>

<td><%=rs.getString("status")%></td>

<td><%=rs.getTimestamp("order_date")%></td>

<td>

<form action="restaurantupdatestatus.jsp" method="post">

<input
type="hidden"
name="orderid"
value="<%=rs.getInt("order_id")%>">

<select name="status">

<option
<%=rs.getString("status").equals("Order Placed")?"selected":""%>>
Order Placed
</option>

<option
<%=rs.getString("status").equals("Preparing")?"selected":""%>>
Preparing
</option>

<option
<%=rs.getString("status").equals("Out For Delivery")?"selected":""%>>
Out For Delivery
</option>

<option
<%=rs.getString("status").equals("Delivered")?"selected":""%>>
Delivered
</option>

</select>

<br><br>

<button type="submit">

Update

</button>

</form>

</td>

</tr>

<%

}

rs.close();
ps.close();
con.close();

%>

</table>

</body>

</html>