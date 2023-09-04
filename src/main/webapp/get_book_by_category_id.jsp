<!DOCTYPE html>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.service.BookService"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
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

<h1>Book List By Category</h1>
<%String categoryIdParam = request.getParameter("categoryId"); %>
    <%int id = Integer.parseInt(categoryIdParam); %>
    <%BookService bookService = new BookService();%>
 	<%Set<Book> listOfBook = bookService.findBookByCategoryId(id);%>
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
         <% for(Book book: listOfBook){ %>
  <tr>
    <td><%= book.getId() %></td>
    <td><%= book.getTitle() %></td>
    <td><%= book.getAuthor() %></td>
    <td><%= book.getPublisherId() %></td>
    <td><%= book.getCategoryId() %></td>
    <td><%= book.getPublishedDate() %></td>
    <td><%= book.getPrice() %></td>
  <% }%>
  </table>
</body>
</html>