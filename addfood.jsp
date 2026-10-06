<%@ page import="java.sql.*"%>
<%@ include file="adminheader.jsp" %>
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

<select name="restaurant_id" required>

<option value="">Select Restaurant</option>

<%

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

<option value="<%=rs.getInt("restaurant_id")%>">

<%=rs.getString("restaurant_name")%>

</option>

<%

}

%>

</select>

<input type="text"
name="food_name"
placeholder="Food Name"
required>

<input type="number"
name="price"
placeholder="Price"
required>

<select name="category">

<option>Veg</option>

<option>Non-Veg</option>

<option>Beverages</option>

<option>Desserts</option>

</select>

<input type="text"
name="image"
placeholder="Image Name (pizza.jpg)"
required>

<button>Add Food</button>

</form>

<%

if(request.getMethod().equalsIgnoreCase("POST"))
{

PreparedStatement ps=con.prepareStatement(

"insert into food(restaurant_id,food_name,price,category,image) values(?,?,?,?,?)"

);

ps.setInt(1,Integer.parseInt(request.getParameter("restaurant_id")));
ps.setString(2,request.getParameter("food_name"));
ps.setDouble(3,Double.parseDouble(request.getParameter("price")));
ps.setString(4,request.getParameter("category"));
ps.setString(5,request.getParameter("image"));

ps.executeUpdate();

out.println("<script>alert('Food Added Successfully');</script>");

}

con.close();

%>

</div>

</body>
</html>