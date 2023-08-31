<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
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

	<%BookService bookService = new BookService();%>
 	<%Set<Book> listOfBook = bookService.findAllBook();%>
 	
 	<h1>List Of Books</h1>
 	<form action="FindBookByIdServlet">
		<input placeholder="Search Book" type="text" name="id" />
		
		<button type="submit">Search</button>
	</form>
<table>
  <tr>
    <th>Book Id</th>
    <th>Book Title</th>
    <th>Author Name</th>
    <th>Publisher Id</th>
    <th>Category Id</th>
    <th>Published Date</th>
    <th>Price</th>
    <th>View</th>
    <th>Edit</th>
    <th>Delete</th>
  </tr>
  <% for(Book book: listOfBook){ %>
  <tr>
    <td><%= book.getId() %></td>
    <td><%= book.getTitle() %></td>
    <td><%= book.getAuthor() %></td>
    <td><%= book.getPublisherId() %></td>
    <td><%= book.getCategoryId() %></td>
    <td><%= book.getPublishedDate() %></td>
    <td><%= book.getPrice() %></td>
    <%String userId = request.getParameter("id");%>
    <td><a href="book_list/details?id=<%= book.getId()%>"><button type="submit">View</button></a></td>
    <td><a href="book/edit?id=<%= book.getId()%>"><button>Edit</button></a></td>
    <td><a href="book/delete?id=<%= book.getId()%>"><button>Delete</button></a></td>
  </tr>
  <% }%>
  </table>
  <a href="index.jsp"><h1>Back to Home Page</h1></a>
</body>
</html>