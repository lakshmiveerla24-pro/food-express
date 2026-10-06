<%@ page import="java.sql.*" %>

<%
int cartid = Integer.parseInt(request.getParameter("cartid"));

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/food_ordering",
    "root",
    "");

    PreparedStatement ps = con.prepareStatement(
    "DELETE FROM cart WHERE cart_id=?");

    ps.setInt(1,cartid);

    ps.executeUpdate();

    con.close();

    response.sendRedirect("cart.jsp");
}
catch(Exception e)
{
    out.println(e);
}
%>