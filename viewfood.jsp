<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<title>Food List</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
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

img{
width:80px;
height:60px;
}

a{
background:red;
color:white;
padding:6px 10px;
text-decoration:none;
border-radius:5px;
}

</style>

</head>

<body>

<h2 align="center">Food Items</h2>

<table>

<tr>

<th>ID</th>
<th>Restaurant</th>
<th>Food</th>
<th>Price</th>
<th>Category</th>
<th>Image</th>
<th>Delete</th>

</tr>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery(

"select food.*,restaurant.restaurant_name from food inner join restaurant on food.restaurant_id=restaurant.restaurant_id"

);

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("food_id")%></td>

<td><%=rs.getString("restaurant_name")%></td>

<td><%=rs.getString("food_name")%></td>

<td>₹ <%=rs.getDouble("price")%></td>

<td><%=rs.getString("category")%></td>

<td>

<img src="images/<%=rs.getString("image")%>">

</td>

<td>

<a href="deletefood.jsp?id=<%=rs.getInt("food_id")%>"
onclick="return confirm('Delete Food?')">

Delete

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