<%@ page import="java.sql.*" %>

<%
String location = request.getParameter("location");

if(location==null || location.trim().equals(""))
{
%>

<script>
alert("Please enter your delivery location.");
window.location="index.jsp";
</script>

<%
return;
}

location = location.trim();

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"SELECT * FROM location WHERE LOWER(location_name)=LOWER(?)");

ps.setString(1,location);

ResultSet rs=ps.executeQuery();

if(rs.next())
{

    session.setAttribute("location",rs.getString("location_name"));

%>

<script>
alert("Delivery Available in <%=rs.getString("location_name")%>");
window.location="login.jsp";
</script>

<%

}
else
{

%>

<script>
alert("Sorry! Delivery is not available in <%=location%>.");
window.location="index.jsp";
</script>

<%

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