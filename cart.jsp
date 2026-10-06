<%@ page import="java.sql.*" %>

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
<meta charset="UTF-8">
<title>My Cart</title>

<style>

table{
width:80%;
margin:auto;
border-collapse:collapse;
}

th,td{
border:1px solid black;
padding:10px;
text-align:center;
}

th{
background:orange;
color:white;
}

.a{
text-decoration:none;
background:green;
color:white;
padding:8px 12px;
border-radius:5px;
}

.remove{
background:red;
}

</style>

</head>

<body>

<h2 align="center">My Cart</h2>

<table>

<tr>
<th>Food</th>
<th>Price</th>
<th>Quantity</th>
<th>Total</th>
<th>Action</th>
</tr>

<%
double grandTotal=0;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"SELECT cart.cart_id, food.food_name, food.price, cart.quantity, cart.total " +
"FROM cart INNER JOIN food ON cart.food_id=food.food_id " +
"WHERE cart.username=?");

ps.setString(1,username);

ResultSet rs=ps.executeQuery();

while(rs.next())
{

grandTotal+=rs.getDouble("total");

%>

<tr>

<td><%=rs.getString("food_name")%></td>

<td>&#8377; <%=rs.getDouble("price")%></td>

<td><%=rs.getInt("quantity")%></td>

<td>&#8377; <%=rs.getDouble("total")%></td>

<td>
<a class="remove"
href="removefromcart.jsp?cartid=<%=rs.getInt("cart_id")%>"
onclick="return confirm('Remove this item?')">
Remove
</a>
</td>

</tr>

<%

}

con.close();

}
catch(Exception e)
{
out.println(e);
}

%>

<tr>

<td colspan="3"><b>Grand Total</b></td>

<td><b>&#8377; <%=grandTotal%></b></td>

<td></td>

</tr>

</table>

<br>

<center>

<a class="a"
href="address.jsp?amount=<%=grandTotal%>">

Place Order

</a>

</center>
</body>
</html>