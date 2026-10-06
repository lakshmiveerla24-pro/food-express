<%@ page import="java.sql.*"%>

<%
String deliveryName=(String)session.getAttribute("delivery_name");

if(deliveryName==null)
{
    response.sendRedirect("deliverylogin.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Delivery Orders</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

h2{
text-align:center;
color:#fc8019;
margin-top:20px;
}

table{
width:95%;
margin:20px auto;
border-collapse:collapse;
background:white;
box-shadow:0 0 10px lightgray;
}

th,td{
border:1px solid #ddd;
padding:10px;
text-align:center;
}

th{
background:#fc8019;
color:white;
}

button{
background:green;
color:white;
border:none;
padding:8px 15px;
cursor:pointer;
border-radius:5px;
}

button:hover{
background:darkgreen;
}

.msg{
text-align:center;
font-size:20px;
color:red;
margin-top:40px;
}

</style>

</head>

<body>

<h2>Orders Ready For Delivery</h2>

<%

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

ps=con.prepareStatement(

"SELECT * FROM orders WHERE TRIM(status)=?"

);

ps.setString(1,"Out For Delivery");

rs=ps.executeQuery();

boolean found=false;

%>

<table>

<tr>

<th>Order ID</th>
<th>Customer</th>
<th>Address</th>
<th>Amount</th>
<th>Payment</th>
<th>Status</th>
<th>Action</th>

</tr>

<%

while(rs.next())
{

found=true;

%>

<tr>

<td><%=rs.getInt("order_id")%></td>

<td><%=rs.getString("username")%></td>

<td><%=rs.getString("address")%></td>

<td><%=rs.getDouble("amount")%></td>

<td><%=rs.getString("payment_mode")%></td>

<td><%=rs.getString("status")%></td>

<td>

<a href="deliverorder.jsp?id=<%=rs.getInt("order_id")%>">

<button>Delivered</button>

</a>

</td>

</tr>

<%

}

%>

</table>

<%

if(!found)
{
%>

<div class="msg">

No Orders Ready For Delivery

</div>

<%
}

}
catch(Exception e)
{
out.println("<center><h3>"+e+"</h3></center>");
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

</body>
</html>