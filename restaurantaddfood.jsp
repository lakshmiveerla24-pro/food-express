<%@ page import="java.sql.*"%>

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

<title>Add Food</title>

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

input,select{
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

<h2>Add Food Item</h2>

<form method="post">

<input
type="text"
name="food_name"
placeholder="Food Name"
required>

<input
type="number"
name="price"
placeholder="Price"
required>

<select name="category">

<option>Veg</option>

<option>Non-Veg</option>

<option>Beverages</option>

<option>Desserts</option>

</select>

<input
type="text"
name="image"
placeholder="Image Name (pizza.jpg)"
required>

<button>Add Food</button>

</form>

<%

if(request.getMethod().equalsIgnoreCase("POST"))
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"INSERT INTO food(restaurant_id,food_name,price,category,image) VALUES(?,?,?,?,?)"

);

ps.setInt(1,restaurantId);
ps.setString(2,request.getParameter("food_name"));
ps.setDouble(3,Double.parseDouble(request.getParameter("price")));
ps.setString(4,request.getParameter("category"));
ps.setString(5,request.getParameter("image"));

ps.executeUpdate();

ps.close();
con.close();

%>

<script>

alert("Food Added Successfully");

window.location="restaurantfoods.jsp";

</script>

<%
}
%>

</div>

</body>
</html>