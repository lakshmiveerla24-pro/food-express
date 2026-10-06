<%@ page import="java.sql.*"%>
<%@ include file="adminheader.jsp" %>
<!DOCTYPE html>
<html>
<head>

<title>Add Restaurant</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

.box{
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
margin:10px 0;
font-size:16px;
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

button:hover{
background:#e46f0f;
}

</style>

</head>

<body>

<div class="box">

<h2>Add Restaurant</h2>

<form action="" method="post">

<input type="text"
name="name"
placeholder="Restaurant Name"
required>

<input type="text"
name="location"
placeholder="Location"
required>

<input type="text"
name="rating"
placeholder="Rating"
required>

<input type="text"
name="delivery"
placeholder="Delivery Time"
required>

<input type="text"
name="image"
placeholder="Image Name (pizza.jpg)"
required>

<button>Add Restaurant</button>

</form>

<%

if(request.getMethod().equalsIgnoreCase("POST"))
{

String name=request.getParameter("name");
String location=request.getParameter("location");
String rating=request.getParameter("rating");
String delivery=request.getParameter("delivery");
String image=request.getParameter("image");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"insert into restaurant(restaurant_name,location,rating,delivery_time,image) values(?,?,?,?,?)");

ps.setString(1,name);
ps.setString(2,location);
ps.setString(3,rating);
ps.setString(4,delivery);
ps.setString(5,image);

ps.executeUpdate();

out.println("<script>");
out.println("alert('Restaurant Added Successfully');");
out.println("</script>");

con.close();

}
catch(Exception e)
{
out.println(e);
}

}

%>

</div>

</body>
</html>