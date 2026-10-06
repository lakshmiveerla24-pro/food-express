<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<title>Restaurants</title>

<style>

body{
font-family:bold;
background:#fff8f0;
margin:0;
}
.header{
background:#fc8019;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 50px;
}

.logo{
display:flex;
align-items:center;
color:white;
font-size:30px;
font-weight:bold;
}

.logo img{
width:60px;
height:60px;
margin-right:10px;
border-radius:50%;
}

.menu{
display:flex;
align-items:center;
}

.menu a{
color:white;
text-decoration:none;
margin-left:25px;
font-size:18px;
font-weight:bold;
}

.menu a:hover{
color:black;
}

.dropdown{
position:relative;
display:inline-block;
margin-left:25px;
}

.dropbtn{
background:none;
border:none;
color:white;
font-size:18px;
font-weight:bold;
cursor:pointer;
}

.dropdown-content{
display:none;
position:absolute;
right:0;
background:white;
min-width:190px;
box-shadow:0 0 10px lightgray;
border-radius:6px;
z-index:1000;
}

.dropdown-content a{
display:block;
padding:12px;
text-decoration:none;
color:black;
margin:0;
}

.dropdown-content a:hover{
background:#fc8019;
color:white;
}

.dropdown:hover .dropdown-content{
display:block;
}
.container{

display:flex;
flex-wrap:wrap;
justify-content:center;
gap:30px;
padding:30px;

}

.card{

width:280px;
background:white;
border-radius:15px;
box-shadow:0 0 10px lightgray;
overflow:hidden;

}

.card img{

width:100%;
height:300px;
object-fit:cover;

}

.details{

padding:15px;

}

.details h2{

margin-bottom:10px;

}

.details p{

margin:8px 0;

}

.btn{

display:block;
text-align:center;
background:#fc8019;
color:white;
padding:12px;
text-decoration:none;
margin-top:10px;

}

.btn:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<div class="header">

<div class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS</span>

</div>

<div class="menu">

<a href="dashboard.jsp">Dashboard</a>

<a href="restaurant.jsp">Restaurants</a>

<a href="orders.jsp">My Orders</a>

<a href="cart.jsp">Cart</a>

<div class="dropdown">

<button class="dropbtn">Profile </button>
<img src="images/user.png"
style="width:24px;height:24px;border-radius:50%;vertical-align:middle;">


<div class="dropdown-content">

<a href="orders.jsp">My Orders</a>

<a href="cart.jsp">My Cart</a>

<a href="changepassword.jsp">Change Password</a>

<a href="help.jsp">Help & Support</a>

<a href="logout.jsp">Logout</a>

</div>

</div>

</div>

</div>

<div class="container">

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

<div class="card">

<img src="images/<%=rs.getString("image")%>">

<div class="details">

<h2><%=rs.getString("restaurant_name")%></h2>

<p><b>Location :</b> <%=rs.getString("location")%></p>
<p><b>Rating :</b>  <%=rs.getString("rating")%></p>
<p><b>Delivery :</b> <%=rs.getString("delivery_time")%></p>
<a href="foodmenu.jsp?id=<%=rs.getInt("restaurant_id")%>" class="btn">

View Menu

</a>

</div>

</div>

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