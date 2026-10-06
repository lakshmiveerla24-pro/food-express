<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>

<title>View Restaurants</title>

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
text-align:center;
border:1px solid lightgray;
}

img{
width:80px;
height:60px;
}

a{
text-decoration:none;
background:red;
color:white;
padding:6px 12px;
border-radius:5px;
}

</style>

</head>

<body>

<h2>Restaurants</h2>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Location</th>
<th>Rating</th>
<th>Delivery</th>
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

ResultSet rs=st.executeQuery("select * from restaurant");

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("restaurant_id")%></td>

<td><%=rs.getString("restaurant_name")%></td>

<td><%=rs.getString("location")%></td>

<td><%=rs.getString("rating")%></td>

<td><%=rs.getString("delivery_time")%></td>

<td>

<img src="images/<%=rs.getString("image")%>">

</td>

<td>

<a href="deleterestaurant.jsp?id=<%=rs.getInt("restaurant_id")%>"
onclick="return confirm('Delete Restaurant?')">

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