<%@ page import="java.sql.*" %>

<%
String username=(String)session.getAttribute("username");

String rating=request.getParameter("rating");
String comments=request.getParameter("comments");

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"INSERT INTO feedback(username,rating,comments) VALUES(?,?,?)");

ps.setString(1,username);
ps.setInt(2,Integer.parseInt(rating));
ps.setString(3,comments);

int i=ps.executeUpdate();

if(i>0)
{
%>

<script>

alert("Thank you for your Feedback!");

window.location="orders.jsp";

</script>

<%
}

con.close();

}
catch(Exception e)
{
out.println(e);
}
%>