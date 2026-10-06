<%@ page import="java.sql.*" %>

<%
String user=(String)session.getAttribute("username");

if(user==null)
{
    response.sendRedirect("login.jsp");
    return;
}

String msg="";
String color="green";

if(request.getMethod().equalsIgnoreCase("POST"))
{
    String oldpass=request.getParameter("oldpass");
    String newpass=request.getParameter("newpass");
    String confirmpass=request.getParameter("confirmpass");

    if(!newpass.equals(confirmpass))
    {
        msg="New Password and Confirm Password do not match.";
        color="red";
    }
    else if(newpass.length()<6)
    {
        msg="Password must be at least 6 characters.";
        color="red";
    }
    else if(!newpass.matches(".*[!@#$%^&*()].*"))
    {
        msg="Password must contain at least one special character.";
        color="red";
    }
    else
    {
        try
        {
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con=DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/food_ordering",
            "root",
            "");

            PreparedStatement ps=con.prepareStatement(
            "select * from customer where username=? and password=?");

            ps.setString(1,user);
            ps.setString(2,oldpass);

            ResultSet rs=ps.executeQuery();

            if(rs.next())
            {
                PreparedStatement ps2=con.prepareStatement(
                "update customer set password=? where username=?");

                ps2.setString(1,newpass);
                ps2.setString(2,user);

                ps2.executeUpdate();

                msg="Password Changed Successfully.";
                color="green";

                ps2.close();
            }
            else
            {
                msg="Current Password is Incorrect.";
                color="red";
            }

            rs.close();
            ps.close();
            con.close();
        }
        catch(Exception e)
        {
            msg=e.toString();
            color="red";
        }
    }
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Change Password</title>

<style>

*{
margin:0;
padding:0;
box-sizing:border-box;
font-family:Arial,sans-serif;
}

body{
background:#fff8f0;
}

.box{

width:480px;
margin:60px auto;
background:white;
padding:30px;
border-radius:12px;
box-shadow:0 0 15px lightgray;

}

h2{

text-align:center;
color:#fc8019;
margin-bottom:25px;

}

.info{

background:#fff3cd;
padding:15px;
border-radius:8px;
margin-bottom:20px;
font-size:15px;
line-height:28px;

}

.info ul{

margin-left:20px;

}

input[type=password]{

width:100%;
padding:12px;
margin:0;
font-size:16px;
border:1px solid #ccc;
border-radius:5px;

}
label{

display:flex;
align-items:center;
gap:6px;
margin-top:4px;
margin-bottom:15px;
cursor:pointer;
font-size:16px;

}

input[type=checkbox]{

width:auto;
margin:0;

}

label{

display:flex;
align-items:center;
margin:8px 0 18px 0;
font-size:17px;
cursor:pointer;

}
button{

width:100%;
padding:13px;
background:#fc8019;
color:white;
border:none;
font-size:18px;
cursor:pointer;
border-radius:5px;

}

button:hover{

background:#e46f0f;

}

#msg{

font-size:15px;
font-weight:bold;

}

.servermsg{

text-align:center;
font-size:16px;
font-weight:bold;
margin-bottom:15px;

}

</style>

<script>

function validatePassword()
{
    var pass=document.getElementById("newpass").value;

    var special=/[!@#$%^&*(),.?":{}|<>]/;

    if(pass.length==0)
    {
        document.getElementById("msg").innerHTML="";
    }
    else if(pass.length<6)
    {
        document.getElementById("msg").style.color="red";
        document.getElementById("msg").innerHTML=
        "Password must be at least 6 characters.";
    }
    else if(!special.test(pass))
    {
        document.getElementById("msg").style.color="red";
        document.getElementById("msg").innerHTML=
        "Password must contain at least one special character.";
    }
    else
    {
        document.getElementById("msg").style.color="green";
        document.getElementById("msg").innerHTML=
        "Strong Password ✓";
    }
}

function toggleOldPassword()
{
    var x=document.getElementById("oldpass");

    if(x.type=="password")
        x.type="text";
    else
        x.type="password";
}

function toggleNewPassword()
{
    var x=document.getElementById("newpass");

    if(x.type=="password")
        x.type="text";
    else
        x.type="password";
}

function toggleConfirmPassword()
{
    var x=document.getElementById("confirmpass");

    if(x.type=="password")
        x.type="text";
    else
        x.type="password";
}

</script>

</head>

<body>

<div class="box">

<h2>Change Password</h2>

<div class="servermsg" style="color:<%=color%>;">
<%=msg%>
</div>

<div class="info">

<b>Password Requirements:</b>

<ul>

<li>Minimum 6 characters</li>

<li>At least one special character (@, #, $, %, &, !)</li>

</ul>

</div>

<form method="post">

<input
type="password"
id="oldpass"
name="oldpass"
placeholder="Current Password"
required>

<label>
<input type="checkbox" onclick="toggleOldPassword()">
<span>Show Password</span>
</label>


<input
type="password"
id="newpass"
name="newpass"
placeholder="New Password"
required
onkeyup="validatePassword()">

<label>
<input type="checkbox" onclick="toggleNewPassword()">
<span>Show Password</span>
</label>
<span id="msg" style="font-weight:bold;"></span>
<input
type="password"
id="confirmpass"
name="confirmpass"
placeholder="Confirm Password"
required>

<label>
<input type="checkbox" onclick="toggleConfirmPassword()">
<span>Show Password</span>
</label>
<button type="submit">
Update Password
</button>

</form>

</div>

</body>

</html>