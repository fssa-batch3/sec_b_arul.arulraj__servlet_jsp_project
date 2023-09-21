<%@page import="in.fssa.technolibrary.model.Category"%>
<%@page import="java.util.Set"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Category List</title>
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
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>Publisher List</h1>
	<table border="1">
		<tr>
			<th>Category Id</th>
			<th>Category Name</th>
		</tr>
		<%
		Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryDetails");
		%>
		<%
		for (Category category : categoryList) {
		%>
		<tr>
			<td><%=category.getId()%></td>
			<td><%=category.getName()%></td>
		</tr>
		<%
		}
		%>
	</table>
</body>
</html>