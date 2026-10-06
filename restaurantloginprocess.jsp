<%@ page import="java.sql.*" %>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");

Connection con=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

ps=con.prepareStatement(

"SELECT ra.restaurant_id, r.restaurant_name AS rname " +
"FROM restaurant_admin ra " +
"INNER JOIN restaurant r ON ra.restaurant_id=r.restaurant_id " +
"WHERE ra.username=? AND ra.password=?"

);

ps.setString(1,username);
ps.setString(2,password);

rs=ps.executeQuery();

if(rs.next())
{

session.setAttribute("restaurant_id",rs.getInt("restaurant_id"));
session.setAttribute("restaurant_name",rs.getString("rname"));

response.sendRedirect("restaurantdashboard.jsp");

}
else
{
%>

<script>

alert("Invalid Username or Password");
window.location="restaurantlogin.jsp";

</script>

<%
}

}
catch(Exception e)
{
out.println(e);
}
finally
{
try{
if(rs!=null) rs.close();
if(ps!=null) ps.close();
if(con!=null) con.close();
}
catch(Exception ex){}
}
%>