<%@ page import="java.sql.*"%>

<%
int orderid=Integer.parseInt(request.getParameter("orderid"));
String status=request.getParameter("status");

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(
"UPDATE orders SET status=? WHERE order_id=?");

ps.setString(1,status);
ps.setInt(2,orderid);

ps.executeUpdate();

ps.close();
con.close();
%>

<script>

alert("Order Status Updated Successfully!");

window.location="restaurantorders.jsp";

</script>