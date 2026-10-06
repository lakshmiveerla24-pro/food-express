<%@ page import="java.sql.*"%>

<%
String mobile=(String)session.getAttribute("forgotmobile");

String password=request.getParameter("password");

if(mobile==null)
{
response.sendRedirect("forgotpassword.jsp");
return;
}

Connection con=null;
PreparedStatement ps=null;

try
{

Class.forName("com.mysql.cj.jdbc.Driver");

con=DriverManager.getConnection(
"jdbc:mysql://localhost:3306/food_ordering",
"root",
"");

ps=con.prepareStatement(
"update customer set password=? where mobile=?");

ps.setString(1,password);

ps.setString(2,mobile);

int i=ps.executeUpdate();

if(i>0)
{

session.removeAttribute("forgototp");
session.removeAttribute("forgotmobile");

%>

<!DOCTYPE html>

<html>

<head>

<title>Password Updated</title>

<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

</head>

<body>

<script>

Swal.fire({

icon:'success',

title:'Password Updated Successfully',

text:'Please login with your new password.',

confirmButtonColor:'#fc8019'

}).then(function(){

window.location='login.jsp';

});

</script>

</body>

</html>

<%

}
else
{

out.println("<h2>Password Update Failed.</h2>");

}

}
catch(Exception e)
{

out.println(e);

}
finally
{

try{

if(ps!=null) ps.close();

if(con!=null) con.close();

}
catch(Exception ex){}

}
%>