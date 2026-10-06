
<%
String location=(String)session.getAttribute("location");
%>
<style>

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
min-width:200px;
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

</style>

<div class="header">

<div class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS</span>

</div>

<div class="menu">

<a href="dashboard.jsp">Dashboard</a>

<a href="restaurant.jsp">Restaurants</a>

<a href="orders.jsp">My Orders</a>

<a href="cart.jsp">&#128722; Cart</a>

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