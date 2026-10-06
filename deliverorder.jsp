<%@ page import="java.sql.*"%>

<%

int id=Integer.parseInt(request.getParameter("id"));

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

PreparedStatement ps=con.prepareStatement(

"UPDATE orders SET status='Delivered' WHERE order_id=?"

);

ps.setInt(1,id);

ps.executeUpdate();

ps.close();

con.close();

%>

<script>

alert("Order Delivered Successfully.");

window.location="deliveryorders.jsp";

</script>