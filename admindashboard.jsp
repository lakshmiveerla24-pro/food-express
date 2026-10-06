<%@ page import="java.sql.*"%>
<%@ include file="adminheader.jsp" %>
<%
int restaurants=0;
int foods=0;
int customers=0;
int orders=0;
int delivered=0;
int cancelled=0;
int pending=0;
int todayOrders=0;
double revenue=0;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

Statement st=con.createStatement();

ResultSet rs;

rs=st.executeQuery("select count(*) from restaurant");
if(rs.next())
restaurants=rs.getInt(1);

rs=st.executeQuery("select count(*) from food");
if(rs.next())
foods=rs.getInt(1);

rs=st.executeQuery("select count(*) from customer");
if(rs.next())
customers=rs.getInt(1);

rs=st.executeQuery("select count(*) from orders");
if(rs.next())
orders=rs.getInt(1);

rs=st.executeQuery("select count(*) from orders where status='Delivered'");
if(rs.next())
delivered=rs.getInt(1);

rs=st.executeQuery("select count(*) from orders where status='Cancelled'");
if(rs.next())
cancelled=rs.getInt(1);

rs=st.executeQuery("select count(*) from orders where status!='Delivered' and status!='Cancelled'");
if(rs.next())
pending=rs.getInt(1);

rs=st.executeQuery("select ifnull(sum(amount),0) from orders where status='Delivered'");
if(rs.next())
revenue=rs.getDouble(1);

rs=st.executeQuery("select count(*) from orders where date(order_date)=curdate()");
if(rs.next())
todayOrders=rs.getInt(1);

con.close();

}
catch(Exception e)
{
out.println(e);
}
%>

<style>

body{
background:#f5f5f5;
font-family:Arial;
margin:0;
}

.container{

width:95%;
margin:auto;
padding:30px;

}

.container h2{

text-align:center;
color:#fc8019;
margin-bottom:30px;

}

.cards{

display:grid;
grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
gap:25px;

}

.card{

background:white;
padding:25px;
border-radius:15px;
box-shadow:0 0 10px lightgray;
text-align:center;
transition:.3s;

}

.card:hover{

transform:translateY(-8px);

}

.card h3{

color:#fc8019;
margin-bottom:15px;

}

.card h1{

font-size:38px;
color:#333;

}

</style>

<div class="container">

<div class="cards">

<div class="card">
<h3>Total Restaurants</h3>
<h1><%=restaurants%></h1>
</div>

<div class="card">
<h3>Total Food Items</h3>
<h1><%=foods%></h1>
</div>

<div class="card">
<h3>Total Customers</h3>
<h1><%=customers%></h1>
</div>

<div class="card">
<h3>Total Orders</h3>
<h1><%=orders%></h1>
</div>

<div class="card">
<h3>Delivered Orders</h3>
<h1><%=delivered%></h1>
</div>

<div class="card">
<h3>Cancelled Orders</h3>
<h1><%=cancelled%></h1>
</div>

<div class="card">
<h3>Pending Orders</h3>
<h1><%=pending%></h1>
</div>

<div class="card">
<h3>Today's Orders</h3>
<h1><%=todayOrders%></h1>
</div>

<div class="card">
<h3>Total Revenue</h3>
<h1> <%=revenue%></h1>
</div>
<a href="locations.jsp">Locations</a>

</div>

</div>