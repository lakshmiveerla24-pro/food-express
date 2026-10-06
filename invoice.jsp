<%@ page import="java.sql.*"%>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int id=Integer.parseInt(request.getParameter("id"));
%>

<!DOCTYPE html>
<html>

<head>

<title>Invoice</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
margin:0;
}

.invoice{

width:700px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;

}

.header{

text-align:center;
border-bottom:2px solid #fc8019;
padding-bottom:20px;
margin-bottom:20px;

}

.logo{

width:70px;
height:70px;
border-radius:50%;

}

h1{

color:#fc8019;
margin:10px 0;

}

table{

width:100%;
border-collapse:collapse;

}

td{

padding:12px;
border-bottom:1px solid #ddd;
font-size:18px;

}

.label{

font-weight:bold;
width:220px;

}

.print{

margin-top:30px;
text-align:center;

}

.print button{

padding:12px 30px;
font-size:18px;
background:#fc8019;
color:white;
border:none;
border-radius:5px;
cursor:pointer;

}

.print button:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<div class="invoice">

<div class="header">

<img src="images/logo.png" class="logo">

<h1>FOOD EXPRESS</h1>

<h3>Order Invoice</h3>

</div>

<%

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from orders where order_id=? and username=?");

ps.setInt(1,id);

ps.setString(2,username);

ResultSet rs=ps.executeQuery();

if(rs.next())
{

%>

<table>

<tr>

<td class="label">Order ID</td>

<td><%=rs.getInt("order_id")%></td>

</tr>

<tr>

<td class="label">Customer</td>

<td><%=username%></td>

</tr>

<tr>

<td class="label">Amount</td>

<td> <%=rs.getDouble("amount")%></td>

</tr>

<tr>

<td class="label">Payment Method</td>

<td><%=rs.getString("payment_mode")%></td>

</tr>

<tr>

<td class="label">Order Status</td>

<td><%=rs.getString("status")%></td>

</tr>

<tr>

<td class="label">Refund Status</td>

<td><%=rs.getString("refund_status")==null?"-":rs.getString("refund_status")%></td>

</tr>

<tr>

<td class="label">Order Date</td>

<td><%=rs.getTimestamp("order_date")%></td>

</tr>

</table>

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

<div class="print">

<button onclick="window.print()">

Print Invoice

</button>

</div>

</div>

</body>

</html>