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

<title>Manage Food</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
}

h2{
text-align:center;
color:#fc8019;
}

table{
width:90%;
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
text-align:center;
border:1px solid #ddd;
}

img{
width:80px;
height:60px;
}

.btn{
background:#fc8019;
color:white;
padding:10px 18px;
text-decoration:none;
border-radius:5px;
}

.edit{
background:green;
}

.delete{
background:red;
}

</style>

</head>

<body>

<h2>Manage Food</h2>

<center>

Change this:

<a href="addfood.jsp">

to

<a href="restaurantaddfood.jsp">

Add Food

</a>

</center>

<br>

<table>

<tr>

<th>Image</th>

<th>Food Name</th>

<th>Price</th>

<th>Category</th>

<th>Edit</th>

<th>Delete</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"SELECT * FROM food WHERE restaurant_id=?"

);

ps.setInt(1,restaurantId);

ResultSet rs=ps.executeQuery();

while(rs.next())
{

%>

<tr>

<td>

<img src="images/<%=rs.getString("image")%>">

</td>

<td>

<%=rs.getString("food_name")%>

</td>

<td>

<%=rs.getDouble("price")%>

</td>

<td>

<%=rs.getString("category")%>

</td>

<td>

<a class="btn edit"

href="editfood.jsp?id=<%=rs.getInt("food_id")%>">

Edit

</a>

</td>

<td>

<a class="btn delete"

href="deletefood.jsp?id=<%=rs.getInt("food_id")%>"

onclick="return confirm('Delete this food?')">

Delete

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

</table>

</body>

</html>