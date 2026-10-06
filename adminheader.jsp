<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
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

</style>

<div class="header">

<div class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS - ADMIN</span>

</div>

<div class="menu">

<a href="admindashboard.jsp">Dashboard</a>

<a href="addrestaurant.jsp">Add Restaurant</a>

<a href="viewrestaurants.jsp">Restaurants</a>

<a href="addfood.jsp">Add Food</a>

<a href="viewfood.jsp">Food Menu</a>

<a href="vieworders.jsp">Orders</a>

<a href="logout.jsp">Logout</a>

</div>

</div>