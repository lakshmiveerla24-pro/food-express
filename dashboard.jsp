<%
String user=(String)session.getAttribute("username");

if(user==null)
{
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>
<title>Customer Dashboard</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:bold;
}

body{
background:#fff8f0;
}

/* Header */

.header{
background:#fc8019;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
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

/* Welcome */

.welcome{
text-align:center;
padding:30px;
}

.welcome h1{
color:#fc8019;
}

/* Categories */

.categories{
text-align:center;
padding:20px;
}

.box{
display:inline-block;
width:180px;
background:white;
margin:15px;
padding:15px;
border-radius:15px;
box-shadow:0 0 10px lightgray;
transition:.3s;
}

.box:hover{
transform:translateY(-8px);
}

.box img{
width:140px;
height:120px;
border-radius:10px;
object-fit:cover;
}

.box p{
margin-top:10px;
font-size:20px;
font-weight:bold;
}

/* Buttons */

.buttons{

text-align:center;
margin:40px;

}

.buttons a{

text-decoration:none;
background:#fc8019;
color:white;
padding:15px 30px;
margin:10px;
border-radius:8px;
font-size:18px;

}

.buttons a:hover{

background:#d96c0c;

}
/* Profile Dropdown */

.dropdown{
display:inline-block;
position:relative;
}

.dropdown a{
color:white;
text-decoration:none;
font-size:18px;
font-weight:bold;
padding:10px;
}

.dropdown-content{
display:none;
position:absolute;
right:0;
background:white;
min-width:180px;
box-shadow:0 0 10px lightgray;
border-radius:8px;
overflow:hidden;
z-index:1000;
}

.dropdown-content a{
display:block;
color:black;
padding:12px 15px;
text-decoration:none;
margin:0;
font-size:16px;
}

.dropdown-content a:hover{
background:#fc8019;
color:white;
}

.dropdown:hover .dropdown-content{
display:block;
}
.footer{
margin-top:40px;
background:#333;
color:white;
text-align:center;
padding:20px;
}
.search-box{

text-align:center;
margin:30px;

}

.search-box input{

width:420px;
padding:14px;
font-size:17px;
border:2px solid #fc8019;
border-radius:8px;

}

.search-box button{

padding:14px 25px;
background:#fc8019;
color:white;
border:none;
font-size:17px;
border-radius:8px;
cursor:pointer;
margin-left:10px;

}

.search-box button:hover{

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
<div class="dropdown">

<a href="#">

<img src="images/user.png"
style="width:24px;height:24px;border-radius:50%;vertical-align:middle;">

&nbsp;

<%=user%> 

</a>

<div class="dropdown-content">

<a href="profile.jsp">My Profile</a>

<a href="cart.jsp">My Cart</a>

<a href="orders.jsp">My Orders</a>

<a href="changepassword.jsp">Change Password</a>

<a href="help.jsp">Help & Support</a>

<a href="logout.jsp">Logout</a>

</div>

</div>
</div>
<div class="search-box">

<form action="search.jsp" method="get">

<input
type="text"
name="search"
placeholder="Search food or restaurant..."
required>

<button type="submit">

Search

</button>

</form>

</div>

<div class="welcome">

<h1>Welcome <%=user%></h1>

<p>Choose your favourite food.</p>

</div>

<div class="categories">

<h2>Food Categories</h2>

<div class="box">

<img src="images/pizza1.png">

<p>Pizza</p>

</div>

<div class="box">

<img src="images/burger.png">

<p>Burger</p>

</div>

<div class="box">

<img src="images/biryani1.png">

<p>Biryani</p>

</div>

<div class="box">

<img src="images/drinks1.png">

<p>Drinks</p>

</div>

<div class="box">

<img src="images/desserts1.png">

<p>Desserts</p>

</div>

</div>

<div class="buttons">

<a href="restaurant.jsp">View Restaurants</a>

<a href="cart.jsp">View Cart</a>

<a href="orders.jsp">My Orders</a>

</div>

<div class="footer">

<h3>FoodExpress - Online Food Ordering System</h3>

<p>© 2026 All Rights Reserved.</p>

</div>

</body>
</html>