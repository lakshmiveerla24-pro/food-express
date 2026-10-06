<%@ page import="java.sql.*"%>

<%
Integer customer_id=(Integer)session.getAttribute("customer_id");

if(customer_id==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String name=request.getParameter("name");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String address=request.getParameter("address");

Connection con=null;
PreparedStatement check=null;
PreparedStatement ps=null;
ResultSet rs=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

// Check whether mobile number belongs to another customer
check=con.prepareStatement(
"SELECT * FROM customer WHERE mobile=? AND customer_id<>?");

check.setString(1,mobile);
check.setInt(2,customer_id);

rs=check.executeQuery();

if(rs.next())
{
%>

<script>

alert("Mobile Number Already Exists!");

history.back();

</script>

<%
}
else
{

ps=con.prepareStatement(
"UPDATE customer SET name=?,email=?,mobile=?,address=? WHERE customer_id=?");

ps.setString(1,name);
ps.setString(2,email);
ps.setString(3,mobile);
ps.setString(4,address);
ps.setInt(5,customer_id);

int i=ps.executeUpdate();

if(i>0)
{
%>

<script>

alert("Profile Updated Successfully!");

window.location="profile.jsp";

</script>

<%
}
else
{
%>

<script>

alert("Profile Update Failed!");

history.back();

</script>

<%
}

}

}
catch(Exception e)
{
out.println(e);
}
finally
{

try{

if(rs!=null) rs.close();
if(check!=null) check.close();
if(ps!=null) ps.close();
if(con!=null) con.close();

}
catch(Exception ex){}

}
%>