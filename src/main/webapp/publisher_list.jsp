<%@page import="in.fssa.technolibrary.model.User"%>
<%@page import="in.fssa.technolibrary.service.PublisherService"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.model.Publisher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Publisher List</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
}

h1 {
	text-align: center;
	margin-top: 120px;
}

table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 8px;
	text-align: left;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
}

th {
	background-color: #f67c92;
	color: white;
}
.btn{
	position: relative;
	left: 90%;
	bottom: 60px;
	border: none;
	border-radius: 10px;
	background-color: #f67c92;
	color: white;
	padding: 10px;
}
.btn:hover{
	background-color: rgba(74,174,201,255);
	color: white;
}
form {
	background-color: #fff;
	border: 1px solid #ddd;
	padding: 20px;
	margin: 20px auto;
	width: 300px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

.inputDiv {
	margin-bottom: 10px;
}

label {
	display: block;
	font-weight: bold;
}

input[type="number"] {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

#submit {
	text-align: center;
}

.btn2 {
	background-color: #f67c92;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

.btn2:hover {
	background-color: #0056b3;
}

form {
	margin-top: 150px;
}
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
}
.overlay:target {
	visibility: visible;
	opacity: 1;
}
.popup {
	margin: 70px auto;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	width: 30%;
	position: relative;
	left: 500px;
	top: 100px;
	transition: all 5s ease-in-out;
}
.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}
.popup .close:hover {
	color: #06D85F;
}
.popup .content {
	max-height: 30%;
	overflow: auto;
}
#alert {
	padding: 0.4rem 2rem 0.2rem 2rem;
	margin: 1rem 0rem 0rem 8rem;
	background-color: black;
	color: white;
	border: none;
	border-radius: 10px;
}@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}
</style>
</head>
<body>
<%
	String errorMsg = (String) request.getAttribute("error");
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
	%>
	<%
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div id="popup1" class="overlay">
		<div class="popup">
			<h2>Alert !</h2>
			<a class="close" href="#">&times;</a>
			<div class="content">
				<%=errorMsg%>
			</div>
			<button id="alert" onclick="closeAlert()" type="button">Ok</button>
		</div>
	</div>
	<%
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>
	
	<form id="publisherForm" action="<%=request.getContextPath()%>/publisher/create" method="post" style="display: none;">
    <div class="inputDiv">
        <label><strong>Publisher Name:</strong></label>
        <input type="text" type="text" pattern="[a-zA-Z ]+" title="Only contain Alphabets" name="name" required>
    </div>
    <input class="btn2" type="submit">
    <button class="btn2" type="button" onclick="closeForm()">Cancel</button>
</form>
	
	<h1>Publisher List</h1>

	<%
	User user = (User) session.getAttribute("user");
	String loggedInUserEmail = user != null ? user.getEmail() : "";
	String adminEmail = "admin05@gmail.com"; // Change this to the admin's email

	// Determine whether the user is the admin
	boolean isAdmin = loggedInUserEmail.equals(adminEmail); // Change this to your actual logic
	if (isAdmin) {
	%>
	<button id="addPublisherButton" class="btn" onclick="openForm()"><b>ADD PUBLISHER</b></button>

	<%
	}
	%>


	<table border="1">
		<tr>
			<th>Publisher Id</th>
			<th>Publisher Name</th>
		</tr>
		<%
		Set<Publisher> publisherList = (Set<Publisher>) request.getAttribute("publisherDetails");
		%>
		<%
		for (Publisher publisher : publisherList) {
		%>
		<tr>
			<td><%=publisher.getId()%></td>
			<td><%=publisher.getName()%></td>
		</tr>
		<%
		}
		%>
	</table>
	
	<script>
// JavaScript function to open the form
function openForm() {
    var form = document.getElementById('publisherForm');
    form.style.display = 'block';
}

// JavaScript function to close the form
function closeForm() {
    var form = document.getElementById('publisherForm');
    form.style.display = 'none';
}
</script>
	<script src="<%=request.getContextPath()%>/assets/JS/errordiv.js"></script>
</body>
</html>