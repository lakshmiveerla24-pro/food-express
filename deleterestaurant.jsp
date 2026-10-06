<%@ page import="java.sql.*"%>

<%

int id=Integer.parseInt(request.getParameter("id"));

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"delete from restaurant where restaurant_id=?");

ps.setInt(1,id);

ps.executeUpdate();

con.close();

response.sendRedirect("viewrestaurants.jsp");

}
catch(Exception e)
{
out.println(e);
}

%>