<%@ page import="java.sql.*"%>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String id=request.getParameter("id");

Connection con=null;
PreparedStatement ps1=null;
PreparedStatement ps2=null;
ResultSet rs=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

/* Get Payment Mode */

ps1=con.prepareStatement(
"SELECT payment_mode FROM orders WHERE order_id=? AND username=?");

ps1.setInt(1,Integer.parseInt(id));
ps1.setString(2,username);

rs=ps1.executeQuery();

String refundStatus="Refund Successful";
String paymentMode="";

if(rs.next())
{
    paymentMode=rs.getString("payment_mode");

    if(paymentMode.equalsIgnoreCase("Cash On Delivery"))
    {
        refundStatus="No Refund Required";
    }
}

/* Update Order */

ps2=con.prepareStatement(
"UPDATE orders SET status=?,refund_status=? WHERE order_id=? AND username=?");

ps2.setString(1,"Cancelled");
ps2.setString(2,refundStatus);
ps2.setInt(3,Integer.parseInt(id));
ps2.setString(4,username);

int i=ps2.executeUpdate();

if(i>0)
{
%>

<!DOCTYPE html>

<html>

<head>

<title>Order Cancelled</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>

<script>

<%
if(paymentMode.equalsIgnoreCase("Cash On Delivery"))
{
%>

Swal.fire({

icon:'success',

title:'Order Cancelled',

text:'Cash on Delivery order cancelled. No refund is required.',

confirmButtonColor:'#fc8019'

}).then(function(){

window.location='orders.jsp';

});

<%
}
else
{
%>

Swal.fire({

icon:'success',

title:'Order Cancelled',

text:'Your refund has been processed successfully.',

confirmButtonColor:'#fc8019'

}).then(function(){

window.location='orders.jsp';

});

<%
}
%>

</script>

</body>

</html>

<%
}
else
{
%>

<script>

alert("Unable to cancel order.");

window.location="orders.jsp";

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

if(rs!=null) rs.close();

if(ps1!=null) ps1.close();

if(ps2!=null) ps2.close();

if(con!=null) con.close();

}
catch(Exception ex){}

}
%>