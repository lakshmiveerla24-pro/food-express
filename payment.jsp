<%@ page import="java.sql.*" %>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String amount=request.getParameter("amount");
String address=request.getParameter("address");

/* Check Empty Cart */

if(amount==null || amount.trim().equals("") || Double.parseDouble(amount)<=0)
{
%>

<script>

alert("Your cart is empty! Please add food items before placing an order.");

window.location="restaurant.jsp";

</script>

<%

return;

}
%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment</title>

<style>

body{
    font-family:Arial;
    background:#f5f5f5;
}

.container{

    width:420px;
    margin:80px auto;
    background:white;
    padding:30px;
    border-radius:10px;
    box-shadow:0 0 10px gray;

}

input,select{

    width:100%;
    padding:10px;
    margin-top:10px;
    margin-bottom:20px;
    font-size:16px;

}

button{

    width:100%;
    background:green;
    color:white;
    padding:12px;
    border:none;
    font-size:18px;
    cursor:pointer;

}

button:hover{

    background:darkgreen;

}

</style>

</head>

<body>

<div class="container">

<h2 align="center">Payment</h2>

<form action="placeorder.jsp" method="post">

<!-- Hidden Address -->
<input
type="hidden"
name="address"
value="<%=address%>">

<label>Total Amount</label>

<input
type="text"
name="amount"
value="<%=amount%>"
readonly>

<label>Delivery Address</label>

<textarea
readonly
style="width:100%;height:80px;padding:10px;margin-bottom:20px;"><%=address%></textarea>

<label>Select Payment Method</label>

<select name="paymentmode">

<option>Cash On Delivery</option>

<option>UPI</option>

<option>Credit Card</option>

<option>Debit Card</option>

</select>

<button type="submit">

Place Order

</button>

</form>

</div>

</body>

</html>