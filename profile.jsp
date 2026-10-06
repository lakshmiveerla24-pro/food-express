<%@ page import="java.sql.*" %>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}
%>

<!DOCTYPE html>
<html>

<head>

<title>My Profile</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
margin:0;
}

.container{

width:550px;
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

table{

width:100%;
border-collapse:collapse;

}

td{

padding:15px;
font-size:18px;
border-bottom:1px solid #ddd;

}

.label{

font-weight:bold;
width:160px;
color:#333;

}

.buttons{

margin-top:30px;
text-align:center;

}

.btn{

display:inline-block;
text-decoration:none;
background:#fc8019;
color:white;
padding:12px 25px;
border-radius:8px;
font-size:17px;
margin:8px;

}

.btn:hover{

background:#e46f0f;

}

</style>

</head>

<body>

<%@ include file="header.jsp" %>

<div class="container">

<h2>My Profile</h2>

<table>

<%

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from customer where username=?");

ps.setString(1,username);

ResultSet rs=ps.executeQuery();

if(rs.next())
{
%>

<tr>
<td class="label">Name</td>
<td><%=rs.getString("name")%></td>
</tr>

<tr>
<td class="label">Email</td>
<td><%=rs.getString("email")%></td>
</tr>

<tr>
<td class="label">Mobile</td>
<td><%=rs.getString("mobile")%></td>
</tr>

<tr>
<td class="label">Address</td>
<td><%=rs.getString("address")%></td>
</tr>

<tr>
<td class="label">Username</td>
<td><%=rs.getString("username")%></td>
</tr>

<%
}

con.close();

}
catch(Exception e)
{
out.println(e);
}

%>

</table>

<div class="buttons">

<a href="editprofile.jsp" class="btn">
Edit Profile
</a>

<a href="changepassword.jsp" class="btn">
Change Password
</a>

</div>

</div>

</body>

</html>