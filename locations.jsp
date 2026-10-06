<%@ page import="java.sql.*"%>
<%@ include file="adminheader.jsp" %>

<!DOCTYPE html>
<html>
<head>
<title>Manage Locations</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
}

.container{
width:500px;
margin:40px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;
}

h2{
text-align:center;
color:#fc8019;
}

input{
width:100%;
padding:12px;
margin:20px 0;
}

button{
width:100%;
padding:12px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
cursor:pointer;
}

table{
width:100%;
margin-top:30px;
border-collapse:collapse;
}

th,td{
border:1px solid lightgray;
padding:10px;
text-align:center;
}

th{
background:#fc8019;
color:white;
}

a{
color:red;
text-decoration:none;
}

</style>

</head>

<body>

<div class="container">

<h2>Manage Locations</h2>

<form action="addlocation.jsp" method="post">

<input
type="text"
name="location"
placeholder="Enter Location"
required>

<button>Add Location</button>

</form>

<table>

<tr>

<th>ID</th>
<th>Location</th>
<th>Action</th>

</tr>

<%

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery(
"select * from location");

while(rs.next())
{

%>

<tr>

<td><%=rs.getInt("location_id")%></td>

<td><%=rs.getString("location_name")%></td>

<td>

<a href="deletelocation.jsp?id=<%=rs.getInt("location_id")%>">

Delete

</a>

</td>

</tr>

<%

}

con.close();

%>

</table>

</div>

</body>
</html>