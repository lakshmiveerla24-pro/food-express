<%@ page import="java.sql.*"%>
<%@ include file="adminheader.jsp" %>

<!DOCTYPE html>
<html>
<head>

<title>View Orders</title>

<style>

body{
font-family:bold;
background:#f5f5f5;
}

h2{
text-align:center;
color:#fc8019;
}

table{
width:95%;
margin:auto;
border-collapse:collapse;
background:white;
}

th{
background:#fc8019;
color:white;
padding:12px;
}

td{
padding:10px;
border:1px solid lightgray;
text-align:center;
}

a{
background:#fc8019;
color:white;
padding:8px 15px;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<h2>Customer Orders</h2>

<table>

<tr>

<th>Order ID</th>
<th>Customer</th>
<th>Amount</th>
<th>Payment</th>
<th>Status</th>
<th>Date</th>
<th>Action</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("select * from orders order by order_id desc");

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("order_id")%></td>

<td><%=rs.getString("username")%></td>

<td><%=rs.getDouble("amount")%></td>

<td><%=rs.getString("payment_mode")%></td>

<td><%=rs.getString("status")%></td>

<td><%=rs.getString("order_date")%></td>

<td>

<a href="updatestatus.jsp?id=<%=rs.getInt("order_id")%>">

Update Status

</a>

</td>

</tr>

<%

}

con.close();

}
catch(Exception e){

out.println(e);

}

%>

</table>

</body>
</html>