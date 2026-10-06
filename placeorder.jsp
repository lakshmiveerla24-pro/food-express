<%@ page import="java.sql.*" %>

<%
String address=request.getParameter("address");

String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String amount=request.getParameter("amount");
String payment=request.getParameter("paymentmode");

if(amount==null || amount.trim().equals("") || Double.parseDouble(amount)<=0)
{
%>

<script>

alert("Invalid Order! Your cart is empty.");

window.location="restaurants.jsp";

</script>

<%

return;

}

Connection con=null;
PreparedStatement check=null;
PreparedStatement rp=null;
PreparedStatement ps=null;
PreparedStatement del=null;

ResultSet rs=null;
ResultSet rr=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

/* Check Cart */

check=con.prepareStatement(
"SELECT COUNT(*) FROM cart WHERE username=?");

check.setString(1,username);

rs=check.executeQuery();

rs.next();

if(rs.getInt(1)==0)
{
%>

<script>

alert("Your cart is empty!");

window.location="restaurants.jsp";

</script>

<%

return;

}

/* Get Restaurant ID */

rp=con.prepareStatement(

"SELECT DISTINCT food.restaurant_id " +
"FROM cart INNER JOIN food ON cart.food_id=food.food_id " +
"WHERE cart.username=?"

);

rp.setString(1,username);

rr=rp.executeQuery();

int restaurantId=0;

if(rr.next())
{
restaurantId=rr.getInt("restaurant_id");
}
else
{
%>

<script>

alert("Restaurant not found!");

window.location="cart.jsp";

</script>

<%

return;

}

/* Save Order */

ps=con.prepareStatement(

"INSERT INTO orders(restaurant_id,username,amount,address,payment_mode,status,refund_status) VALUES(?,?,?,?,?,?,?)"

);

ps.setInt(1,restaurantId);
ps.setString(2,username);
ps.setDouble(3,Double.parseDouble(amount));
ps.setString(4,address);
ps.setString(5,payment);
ps.setString(6,"Order Placed");
ps.setString(7,"-");

int i=ps.executeUpdate();

/* Clear Cart */

if(i>0)
{

del=con.prepareStatement(
"DELETE FROM cart WHERE username=?");

del.setString(1,username);

del.executeUpdate();

%>

<script>

alert("Order Placed Successfully!");

window.location="orders.jsp";

</script>

<%

}
else
{
%>

<script>

alert("Failed to Place Order!");

history.back();

</script>

<%

}

}
catch(Exception e)
{
out.println("<h3>"+e+"</h3>");
}
finally
{

try{

if(rr!=null) rr.close();
if(rs!=null) rs.close();

if(rp!=null) rp.close();
if(check!=null) check.close();
if(ps!=null) ps.close();
if(del!=null) del.close();

if(con!=null) con.close();

}
catch(Exception ex){}

}
%>