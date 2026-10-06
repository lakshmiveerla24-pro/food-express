<%@ page session="true" %>

<%
String username=(String)session.getAttribute("username");

if(username==null)
{
response.sendRedirect("login.jsp");
return;
}
%>

<!DOCTYPE html>
<html>
<head>

<title>Feedback</title>

<style>

body{
font-family:Arial;
background:#f5f5f5;
}

.container{

width:450px;
margin:60px auto;
background:white;
padding:30px;
border-radius:10px;
box-shadow:0 0 10px gray;

}

h2{
text-align:center;
color:#fc8019;
}

select,textarea{

width:100%;
padding:10px;
margin-top:10px;
margin-bottom:20px;

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

<div class="container">

<h2>Customer Feedback</h2>

<form action="feedbackprocess.jsp" method="post">

<label>Rating</label>

<select name="rating" required>

<option value="">Select Rating</option>
<option>5</option>
<option>4</option>
<option>3</option>
<option>2</option>
<option>1</option>

</select>

<label>Comments</label>

<textarea
name="comments"
rows="5"
placeholder="Write your feedback..."
required></textarea>

<button>

Submit Feedback

</button>

</form>

</div>

</body>
</html>