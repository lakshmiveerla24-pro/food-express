<%@ page import="java.sql.*"%>

<%
Integer customer_id=(Integer)session.getAttribute("customer_id");

if(customer_id==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String username="";
String name="";
String email="";
String mobile="";
String address="";

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from customer where customer_id=?");

ps.setInt(1,customer_id);

ResultSet rs=ps.executeQuery();

if(rs.next())
{
username=rs.getString("username");
name=rs.getString("name");
email=rs.getString("email");
mobile=rs.getString("mobile");
address=rs.getString("address");
}

rs.close();
ps.close();
con.close();

}
catch(Exception e)
{
out.println(e);
}
%>

<!DOCTYPE html>
<html>

<head>

<title>Edit Profile</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
margin:0;
}

.container{
width:500px;
margin:40px auto;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 10px lightgray;
}

h2{
text-align:center;
color:#fc8019;
margin-bottom:25px;
}

input,textarea{
width:100%;
padding:12px;
margin-top:10px;
margin-bottom:20px;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;
}

textarea{
height:80px;
resize:none;
}

button{
width:100%;
padding:12px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
border-radius:5px;
cursor:pointer;
}

button:hover{
background:#e46f0f;
}

</style>

</head>

<body>

<%
request.setAttribute("pageTitle","Edit Profile");
%>

<%@ include file="header.jsp" %>

<div class="container">

<h2>Edit Profile</h2>

<form action="updateprofile.jsp" method="post">

<label>Name</label>

<input
type="text"
name="name"
value="<%=name%>"
required>

<label>Email</label>

<input
type="email"
name="email"
value="<%=email%>"
required>

<label>Mobile</label>

<input
type="text"
name="mobile"
value="<%=mobile%>"
maxlength="10"
pattern="[0-9]{10}"
required>

<label>Address</label>

<textarea
name="address"
required><%=address%></textarea>

<label>Username</label>

<input
type="text"
value="<%=username%>"
readonly>

<button type="submit">

Update Profile

</button>

</form>

</div>

</body>
</html>