<%@ page import="java.sql.*" %>
<%
String username=(String)session.getAttribute("username");
String verified=(String)session.getAttribute("locationVerified");
String location=(String)session.getAttribute("location");
%>

<!DOCTYPE html>
<html>
<head>
<title>FoodExpress - Online Food Ordering System</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:bold;
scroll-behavior:smooth;
}

body{
background:floralwhite;
}

/* HEADER */

.header{
background:#fc8019;
display:flex;
justify-content:space-between;
align-items:center;
padding:18px 60px;
position:sticky;
top:0;
z-index:999;
box-shadow:0 2px 10px lightgray;
}

.logo{
display:flex;
align-items:center;
text-decoration:none;
color:white;
font-size:32px;
font-weight:bold;
}

.logo img{
width:60px;
height:60px;
margin-right:12px;
border-radius:50%;
}

.menu a{
color:white;
text-decoration:none;
margin-left:25px;
font-size:18px;
font-weight:bold;
transition:.3s;
}

.menu a:hover{
color:black;
}

/* HERO */

.hero{
display:flex;
justify-content:space-between;
align-items:center;
padding:70px 60px;
flex-wrap:wrap;
}

.left{
width:50%;
}

.left h1{
font-size:48px;
color:#444;
}

.left p{
margin-top:20px;
font-size:20px;
line-height:30px;
color:#666;
}

.search{
margin-top:30px;
}

.search input{
width:380px;
padding:15px;
font-size:18px;
border:1px solid lightgray;
border-radius:5px;
}

.search button{
padding:15px 25px;
background:#fc8019;
color:white;
border:none;
cursor:pointer;
font-size:18px;
border-radius:5px;
}

.search button:hover{
background:#e46f0f;
}

.browse{
display:inline-block;
margin-top:30px;
background:#fc8019;
color:white;
padding:15px 30px;
text-decoration:none;
border-radius:5px;
font-size:18px;
font-weight:bold;
}

.browse:hover{
background:#e46f0f;
}

.right img{
width:450px;
}

/* CATEGORY */

.categories{
text-align:center;
padding:60px;
}

.categories h2{
margin-bottom:30px;
color:#444;
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
box-shadow:0 10px 20px gray;
}

.box img{
width:140px;
height:120px;
object-fit:cover;
border-radius:10px;
}

.box p{
margin-top:15px;
font-size:20px;
font-weight:bold;
color:black;
}

.about{
background:white;
text-align:center;
padding:60px;
}

.about h2{
margin-bottom:20px;
}

.about p{
width:75%;
margin:auto;
font-size:18px;
line-height:30px;
color:dimgray;
}

.contact{
background:antiquewhite;
text-align:center;
padding:60px;
}

.contact h2{
margin-bottom:20px;
}

.contact p{
margin:10px;
font-size:18px;
}

.footer{
background:#444;
color:white;
text-align:center;
padding:20px;
}
.search select{

width:380px;
padding:15px;
font-size:18px;
border:1px solid lightgray;
border-radius:5px;
margin-right:10px;

}
</style>

</head>

<body>

<div class="header">

<a href="index.jsp" class="logo">

<img src="images/logo.png">

<span>FOOD EXPRESS</span>

</a>

<div class="menu">

<a href="index.jsp">Home</a>

<%
if(username==null)
{
%>

<a href="login.jsp?from=menu">Menu</a>

<%
}
else
{
%>

<a href="restaurant.jsp">Menu</a>

<%
}
%>

<a href="#about">About</a>

<a href="#contact">Contact</a>

<%
if(username==null)
{

if(verified==null)
{
%>

<a href="#"
onclick="alert('Please check your delivery location first.');return false;">
Login
</a>

<a href="#"
onclick="alert('Please check your delivery location first.');return false;">
Register
</a>

<%
}
else
{
%>

<a href="login.jsp">Login</a>

<a href="register.jsp">Register</a>

<%
}

}
else
{
%>

<a href="orders.jsp">My Orders</a>

<a href="logout.jsp">Logout</a>

<%
}
%>

</div>

</div>

<div class="hero">

<div class="left">

<h1>A Digital Food Ordering and Order Tracking System</h1>

<p>

Discover restaurants, order your favourite meals,
and enjoy fast delivery at your doorstep.

</p>

<form class="search" action="checklocation.jsp" method="post">

<input type="text" id="location" name="location"
placeholder="Enter Delivery Location" required>

<br><br>

<button type="button" onclick="getLocation()">
Use My Current Location
</button>

<button type="submit">
Check Availability
</button>

<p id="locationMessage"
style="margin-top:15px;font-weight:bold;color:#fc8019;"></p>

</form>
<%
if(location!=null)
{
%>

<br>

<h3 style="color:green;">
Delivery Location :
<%=location%>
</h3>

<%
}
%>

<%
if(username==null)
{
%>

<%
}
else
{
%>

<a href="restaurants.jsp" class="browse">

Browse Restaurants

</a>

<%
}
%>

</div>

<div class="right">

<img src="images/food.png">

</div>

</div>
<!-- CATEGORIES -->

<div class="categories">

<h2>Popular Categories</h2>

<%
String categoryLink;

if(username==null)
{
categoryLink="login.jsp?from=menu";
}
else
{
categoryLink="restaurants.jsp";
}
%>

<a href="<%=categoryLink%>" style="text-decoration:none;color:black;">

<div class="box">

<img src="images/pizza1.png">

<p>Pizza</p>

</div>

</a>

<a href="<%=categoryLink%>" style="text-decoration:none;color:black;">

<div class="box">

<img src="images/burger.png">

<p>Burger</p>

</div>

</a>

<a href="<%=categoryLink%>" style="text-decoration:none;color:black;">

<div class="box">

<img src="images/biryani1.png">

<p>Biryani</p>

</div>

</a>

<a href="<%=categoryLink%>" style="text-decoration:none;color:black;">

<div class="box">

<img src="images/drinks1.png">

<p>Drinks</p>

</div>

</a>

<a href="<%=categoryLink%>" style="text-decoration:none;color:black;">

<div class="box">

<img src="images/desserts1.png">

<p>Desserts</p>

</div>

</a>

</div>

<!-- ABOUT -->

<section id="about" class="about">

<h2>About FoodExpress</h2>

<p>

FoodExpress is a web-based online food ordering system developed to provide a simple and convenient way for customers to order food online. Customers can browse restaurants, view food menus, add items to the cart, make secure payments, and track their orders. The system helps restaurants manage their menu and customer orders efficiently while providing fast and reliable service.

</p>

</section>

<!-- CONTACT -->

<section id="contact" class="contact">

<h2>Contact Us</h2>

<p><b>Email :</b> support@foodexpress.com</p>

<p><b>Phone :</b> +91 9866233167</p>

<p><b>Address :</b> Tadepalligudem, Andhra Pradesh</p>

</section>
<!-- FOOTER -->

<div class="footer">

<%
if(username!=null)
{
%>

<h3>

Welcome, <%=username%>

</h3>

<br>

<p>

Thank you for choosing FoodExpress.

</p>

<br>

<p>

Enjoy Delicious Food Delivered to Your Doorstep.

</p>

<%
}
else
{
%>

<h3>

FoodExpress - Online Food Ordering System

</h3>

<br>

<p>

Order Delicious Food Anytime, Anywhere.

</p>

<br>

<p>

Please Login to Explore Restaurants and Place Orders.

</p>

<%
}
%>

<br>

<hr style="width:80%;margin:auto;">

<br>

<p>

&copy; 2026 FoodExpress. All Rights Reserved.

</p>

</div>


<script>
function getLocation()
{

var msg=document.getElementById("locationMessage");

if(navigator.geolocation)
{

msg.innerHTML="Detecting your location...";

navigator.geolocation.getCurrentPosition(

function(position)
{

var lat=position.coords.latitude;
var lon=position.coords.longitude;

fetch("https://nominatim.openstreetmap.org/reverse?format=json&lat="+lat+"&lon="+lon)

.then(response=>response.json())

.then(data=>{

var place="";

if(data.address.city)
place=data.address.city;

else if(data.address.town)
place=data.address.town;

else if(data.address.village)
place=data.address.village;

else
place=data.display_name;

document.getElementById("location").value=place;

msg.innerHTML=" Location : "+place;

})

.catch(function(){

document.getElementById("location").value=lat+","+lon;

msg.innerHTML="Location Found";

});

},

function(){

msg.innerHTML="Location Permission Denied.";

});

}
else
{

msg.innerHTML="Geolocation is not supported.";

}

}
</script>
</body>

</html>