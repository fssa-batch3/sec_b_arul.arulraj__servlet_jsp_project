<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}
td, th {
  border: 1px solid #DDDDDD;
  text-align: left;
  padding: 8px;
}
tr:nth-child(even) {
  background-color: #DDDDDD;
}
</style>
</head>
<body>
    <% String bookIdParam = request.getParameter("id");
       if (bookIdParam != null && !bookIdParam.isEmpty()) {
           int id = Integer.parseInt(bookIdParam);
           Book book = BookService.findBookById(id);
           if (book != null) {
    %>
    <table>
        <tr>
            <th>Book Id</th>
            <th>Book Title</th>
            <th>Author Name</th>
            <th>Publisher Id</th>
            <th>Category Id</th>
            <th>Published Date</th>
            <th>Price</th>
        </tr>
        <tr>
            <td><%= book.getId() %></td>
            <td><%= book.getTitle() %></td>
            <td><%= book.getAuthor() %></td>
            <td><%= book.getPublisherId() %></td>
            <td><%= book.getCategoryId() %></td>
            <td><%= book.getPublishedDate() %></td>
            <td><%= book.getPrice() %></td>
        </tr>
    </table>
    <%
           } else {
    %>
    <p>Book not found.</p>
    <%
           }
       } else {
    %>
    <p>No book ID provided.</p>
    <%
       }
    %>
    
    <a href="index.jsp"><h1>Back to Home Page</h1></a>
</body>
</html>
</html>