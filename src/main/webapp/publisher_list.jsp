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
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
		<h1>Publisher List</h1>
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
        <td><%= publisher.getId() %></td>
        <td><%= publisher.getName() %></td>
    </tr>
    <%
    }
    %>
</table>
</body>
</html>