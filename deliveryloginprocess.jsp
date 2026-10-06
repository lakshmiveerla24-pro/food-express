<%@ page import="java.sql.*" %>

<%

String username=request.getParameter("username");
String password=request.getParameter("password");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"SELECT * FROM delivery_person WHERE username=? AND password=?"

);

ps.setString(1,username);
ps.setString(2,password);

ResultSet rs=ps.executeQuery();

if(rs.next())
{

session.setAttribute("delivery_name",
rs.getString("delivery_name"));

response.sendRedirect("deliverydashboard.jsp");

}
else
{
%>

<script>

alert("Invalid Login");

window.location="deliverylogin.jsp";

</script>

<%

}

rs.close();
ps.close();
con.close();

%>