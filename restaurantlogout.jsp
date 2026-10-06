<%
session.removeAttribute("restaurant_id");
session.removeAttribute("restaurant_name");

response.sendRedirect("restaurantlogin.jsp");
%>