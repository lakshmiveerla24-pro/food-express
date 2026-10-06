<%@ page import="java.sql.*"%>

<%

String username=request.getParameter("username");

String password=request.getParameter("password");

try{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(

"jdbc:mysql://localhost:3306/food_ordering",

"root",

""

);

PreparedStatement ps=con.prepareStatement(

"select * from admin where username=? and password=?"

);

ps.setString(1,username);

ps.setString(2,password);

ResultSet rs=ps.executeQuery();

if(rs.next())
{

session.setAttribute("admin",username);

response.sendRedirect("admindashboard.jsp");

}
else
{

out.println("<script>");
out.println("alert('Invalid Admin Login');");
out.println("location='adminlogin.jsp';");
out.println("</script>");

}

con.close();

}
catch(Exception e)
{

out.println(e);

}

%>