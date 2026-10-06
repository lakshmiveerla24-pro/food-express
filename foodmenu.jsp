<%@ page import="java.sql.*" %>
<%
request.setAttribute("pageTitle","Food Menu");
%>

<%@ include file="header.jsp" %>
<%
String id = request.getParameter("id");
String msg = request.getParameter("msg");
%>

<!DOCTYPE html>
<html>
<head>
<title>Food Menu</title>
<meta charset="UTF-8">

<style>

body{
    font-family:bold;
    background:#f5f5f5;
    margin:0;
}

.header{
    background:#fc8019;
    padding:15px 30px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h2{
    color:white;
    margin:0;
}

.cartbtn{
    background:white;
    color:#fc8019;
    padding:10px 20px;
    text-decoration:none;
    border-radius:5px;
    font-weight:bold;
}

.container{
    width:90%;
    margin:auto;
    padding-top:20px;
}

.card{
    width:250px;
    display:inline-block;
    background:white;
    margin:15px;
    padding:15px;
    border-radius:10px;
    box-shadow:0 0 10px lightgray;
    text-align:center;
    transition:0.3s;
}

.card:hover{
    transform:translateY(-5px);
    box-shadow:0 8px 20px gray;
}

.card img{
    width:200px;
    height:150px;
}

button{
    background:#fc8019;
    color:white;
    border:none;
    padding:10px 20px;
    cursor:pointer;
    border-radius:5px;
    font-size:16px;
}

button:hover{
    background:#e46f0f;
}

.success{
    width:60%;
    margin:20px auto;
    background:#d4edda;
    color:#155724;
    border:1px solid #c3e6cb;
    padding:12px;
    border-radius:5px;
    text-align:center;
    font-weight:bold;
}

</style>

</head>

<body>

<div class="header">

<h2> Food Menu</h2>

</div>

<%
if("added".equals(msg))
{
%>

<div id="toast">
 Item Added To Cart Successfully
</div>

<style>

#toast{

position:fixed;
bottom:30px;
left:50%;
transform:translateX(-50%);
background:#28a745;
color:white;
padding:15px 30px;
border-radius:8px;
font-size:18px;
font-weight:bold;
box-shadow:0 4px 10px rgba(0,0,0,0.3);

animation:slideUp 0.5s ease;

z-index:9999;

}

keyframes slideUp{

from{
bottom:-80px;
opacity:0;
}

to{
bottom:30px;
opacity:1;
}

}

</style>

<script>

setTimeout(function(){

document.getElementById("toast").style.display="none";

window.history.replaceState({},document.title,
"foodmenu.jsp?id=<%=id%>#food");

},3000);

</script>

<%
}
%>
<div class="container" id="food">

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from food where restaurant_id=?");

ps.setInt(1,Integer.parseInt(id));

ResultSet rs=ps.executeQuery();

while(rs.next())
{

%>

<div class="card">

<img src="images/<%=rs.getString("image")%>">

<h3><%=rs.getString("food_name")%></h3>

<h4>&#8377; <%=rs.getDouble("price")%></h4>

<p><%=rs.getString("category")%></p>

<form action="addtocart.jsp" method="post">

<input type="hidden" name="restaurant_id" value="<%=id%>">

<input type="hidden" name="food_id" value="<%=rs.getInt("food_id")%>">

<input type="hidden" name="price" value="<%=rs.getDouble("price")%>">

Quantity

<input type="number"
name="quantity"
value="1"
min="1"
style="width:60px;">

<br><br>

<button>Add To Cart</button>

</form>

</div>

<%

}

con.close();

}

catch(Exception e)
{
out.println(e);
}

%>

</div>

</body>
</html>