<%@ page import="java.sql.*"%>

<%
int id=Integer.parseInt(request.getParameter("id"));

Connection con=null;
PreparedStatement ps=null;
PreparedStatement ps2=null;
ResultSet rs=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

/* Check Current Status */

ps=con.prepareStatement(
"SELECT status FROM orders WHERE order_id=?");

ps.setInt(1,id);

rs=ps.executeQuery();

String currentStatus="";

if(rs.next())
{
    currentStatus=rs.getString("status");
}

/* Don't allow update if Cancelled */

if(currentStatus.equalsIgnoreCase("Cancelled"))
{
%>

<script>

alert("This order has been cancelled. Status cannot be updated.");

window.location="vieworders.jsp";

</script>

<%
return;
}

/* Don't allow update if Delivered */

if(currentStatus.equalsIgnoreCase("Delivered"))
{
%>

<script>

alert("This order is already delivered.");

window.location="vieworders.jsp";

</script>

<%
return;
}

/* Update Status */

if(request.getMethod().equalsIgnoreCase("POST"))
{

String status=request.getParameter("status");

ps2=con.prepareStatement(
"UPDATE orders SET status=? WHERE order_id=?");

ps2.setString(1,status);

ps2.setInt(2,id);

ps2.executeUpdate();

%>

<script>

alert("Order Status Updated Successfully!");

window.location="vieworders.jsp";

</script>

<%

return;

}

}
catch(Exception e)
{
out.println(e);
}
finally
{
try
{

if(rs!=null) rs.close();

if(ps!=null) ps.close();

if(ps2!=null) ps2.close();

if(con!=null) con.close();

}
catch(Exception ex){}
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Update Status</title>

<style>

body{
font-family:Arial;
background:#fff8f0;
}

.box{
width:400px;
margin:80px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;
}

h2{
text-align:center;
color:#fc8019;
}

select{
width:100%;
padding:12px;
margin:20px 0;
font-size:16px;
}

button{
width:100%;
padding:12px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
cursor:pointer;
}

button:hover{
background:#e46f0f;
}

</style>

</head>

<body>

<div class="box">

<h2>Update Order Status</h2>

<form method="post">

<select name="status">

<option>Order Placed</option>

<option>Preparing</option>

<option>Out For Delivery</option>

<option>Delivered</option>

</select>

<button type="submit">

Update Status

</button>

</form>

</div>

</body>
</html>