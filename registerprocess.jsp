<%@ page import="java.sql.*" %>

<%
String name = (String)session.getAttribute("name");
String email = (String)session.getAttribute("email");
String mobile = (String)session.getAttribute("mobile");
String address = (String)session.getAttribute("address");
String username = (String)session.getAttribute("username");
String password = (String)session.getAttribute("password");

if(name==null || email==null || mobile==null || username==null || password==null)
{
    response.sendRedirect("register.jsp");
    return;
}

Connection con = null;
PreparedStatement ps = null;
ResultSet rs = null;

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    con = DriverManager.getConnection(
        "jdbc:mysql://localhost:3306/food_ordering",
        "root",
        ""
    );

    // Check mobile number
    ps = con.prepareStatement("SELECT * FROM customer WHERE mobile=?");
    ps.setString(1, mobile);

    rs = ps.executeQuery();

    if(rs.next())
    {
        // Keep all details except mobile number
        session.setAttribute("name", name);
        session.setAttribute("email", email);
        session.setAttribute("address", address);
        session.setAttribute("username", username);
        session.setAttribute("password", password);

        // Clear only mobile number
        session.setAttribute("mobile", "");

        // Error message
        session.setAttribute("error",
        "Mobile number already registered. Please enter another mobile number.");

        response.sendRedirect("register.jsp");
        return;
    }

    rs.close();
    ps.close();

    ps = con.prepareStatement(
    "INSERT INTO customer(name,email,mobile,address,username,password) VALUES(?,?,?,?,?,?)");

    ps.setString(1,name);
    ps.setString(2,email);
    ps.setString(3,mobile);
    ps.setString(4,address);
    ps.setString(5,username);
    ps.setString(6,password);

    int i = ps.executeUpdate();

    if(i>0)
    {
        session.invalidate();
        response.sendRedirect("login.jsp");
    }
    else
    {
        out.println("<h3>Registration Failed</h3>");
    }

}
catch(Exception e)
{
    out.println("<h3>Error : "+e+"</h3>");
}
finally
{
    try{
        if(rs!=null) rs.close();
        if(ps!=null) ps.close();
        if(con!=null) con.close();
    }
    catch(Exception ex){}
}
%>