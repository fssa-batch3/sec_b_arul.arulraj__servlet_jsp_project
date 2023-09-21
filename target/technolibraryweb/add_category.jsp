<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Create Publisher</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f5f5f5;
	margin: 0;
	padding: 0;
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

input[type="submit"] {
	background-color: #f67c92;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}

form {
	margin-top: 150px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<form action="<%=request.getContextPath()%>/category/create"
		method="post">
		<div class="inputDiv">
			<label><strong>Category Name :</strong></label> <input type="text"
				name="name" required>
		</div>
		<input type="submit">
	</form>
</body>
</html>