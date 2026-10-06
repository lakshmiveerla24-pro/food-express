<%@ page import="java.sql.*" %>

<%
String username = (String)session.getAttribute("username");

if(username==null)
{
    response.sendRedirect("login.jsp");
    return;
}

int food_id = Integer.parseInt(request.getParameter("food_id"));
double price = Double.parseDouble(request.getParameter("price"));
int quantity = Integer.parseInt(request.getParameter("quantity"));

try
{
    Class.forName("com.mysql.cj.jdbc.Driver");

    Connection con = DriverManager.getConnection(
    "jdbc:mysql://localhost:3306/food_ordering",
    "root",
    "");

    // Check whether the food already exists in the cart
    PreparedStatement check = con.prepareStatement(
    "SELECT quantity FROM cart WHERE username=? AND food_id=?");

    check.setString(1,username);
    check.setInt(2,food_id);

    ResultSet rs = check.executeQuery();

    if(rs.next())
    {
        // Food already exists -> update quantity
        int oldQty = rs.getInt("quantity");
        int newQty = oldQty + quantity;
        double total = newQty * price;

        PreparedStatement update = con.prepareStatement(
        "UPDATE cart SET quantity=?, total=? WHERE username=? AND food_id=?");

        update.setInt(1,newQty);
        update.setDouble(2,total);
        update.setString(3,username);
        update.setInt(4,food_id);

        update.executeUpdate();
    }
    else
    {
        // New food -> insert into cart
        double total = quantity * price;

        PreparedStatement insert = con.prepareStatement(
        "INSERT INTO cart(username,food_id,quantity,total) VALUES(?,?,?,?)");

        insert.setString(1,username);
        insert.setInt(2,food_id);
        insert.setInt(3,quantity);
        insert.setDouble(4,total);

        insert.executeUpdate();
    }

    con.close();

    response.sendRedirect("foodmenu.jsp?id="
    + request.getParameter("restaurant_id")
    + "&msg=added#food");

}
catch(Exception e)
{
    out.println(e);
}
%>