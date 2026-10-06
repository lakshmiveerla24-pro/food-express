<%@ page import="java.sql.*"%>

<%
String key=request.getParameter("search");
%>

<!DOCTYPE html>
<html>

<head>

<title>Search Results</title>

<style>

body{

font-family:Arial;
background:#fff8f0;

}

.container{

width:90%;
margin:auto;
padding:30px;

}

.card{

background:white;
padding:20px;
margin:20px;
border-radius:10px;
box-shadow:0 0 10px lightgray;

}

a{

background:#fc8019;
color:white;
padding:10px 20px;
text-decoration:none;
border-radius:5px;

}

</style>

</head>

<body>

<%@ include file="header.jsp" %>

<div class="container">

<h2>

Search Results for "<%=key%>"

</h2>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"SELECT f.food_name,f.price,r.restaurant_name,r.restaurant_id " +

"FROM food f JOIN restaurant r " +

"ON f.restaurant_id=r.restaurant_id " +

"WHERE f.food_name LIKE ? OR r.restaurant_name LIKE ?"

);

ps.setString(1,"%"+key+"%");
ps.setString(2,"%"+key+"%");

ResultSet rs=ps.executeQuery();

boolean found=false;

while(rs.next())
{

found=true;

%>

<div class="card">

<h2><%=rs.getString("food_name")%></h2>

<p>

Restaurant :

<b>

<%=rs.getString("restaurant_name")%>

</b>

</p>

<p>

Price :

 <%=rs.getDouble("price")%>

</p>

<a href="foodmenu.jsp?id=<%=rs.getInt("restaurant_id")%>">

View Menu

</a>

</div>

<%

}

if(!found)
{

%>

<h2 style="color:red">

No food or restaurant found.

</h2>

<%

}

con.close();

}
catch(Exception e){

out.println(e);

}

%>

</div>

</body>

</html>