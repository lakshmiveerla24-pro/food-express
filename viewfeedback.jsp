<%@ page import="java.sql.*" %>

<html>

<head>

<title>Customer Feedback</title>

<style>

table{

width:90%;
margin:auto;
border-collapse:collapse;

}

th,td{

border:1px solid black;
padding:10px;
text-align:center;

}

th{

background:#fc8019;
color:white;

}

</style>

</head>

<body>

<h2 align="center">

Customer Feedback

</h2>

<table>

<tr>

<th>User</th>
<th>Rating</th>
<th>Comments</th>
<th>Date</th>

</tr>

<%

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

Statement st=con.createStatement();

ResultSet rs=st.executeQuery("SELECT * FROM feedback ORDER BY feedback_id DESC");

while(rs.next())
{

%>

<tr>

<td><%=rs.getString("username")%></td>

<td><%=rs.getInt("rating")%> &#9733;</td>

<td><%=rs.getString("comments")%></td>

<td><%=rs.getTimestamp("feedback_date")%></td>

</tr>

<%
}
%>

</table>

</body>
</html>