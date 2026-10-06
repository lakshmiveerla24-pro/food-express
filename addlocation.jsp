<%@ page import="java.sql.*"%>

<%

String location=request.getParameter("location");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"insert into location(location_name) values(?)");

ps.setString(1,location);

ps.executeUpdate();

con.close();

response.sendRedirect("locations.jsp");

%>