<%@ page import="java.sql.*" %>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"select * from customer where username=? and password=?");

ps.setString(1,username);
ps.setString(2,password);

ResultSet rs=ps.executeQuery();

if(rs.next())
{

session.setAttribute("username",rs.getString("username"));
String location=(String)session.getAttribute("location");

if(location!=null)
{
session.setAttribute("location",location);
}

session.setAttribute("customer_id",rs.getInt("customer_id"));

response.sendRedirect("dashboard.jsp");

}
else
{

out.println("<script>");

out.println("alert('Invalid Username or Password');");

out.println("window.location='login.jsp';");

out.println("</script>");

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