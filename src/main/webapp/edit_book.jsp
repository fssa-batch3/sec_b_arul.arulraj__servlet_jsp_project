<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="in.fssa.technolibrary.service.BookService"%>
<%@page import="in.fssa.technolibrary.model.Category"%>
<%@page import="in.fssa.technolibrary.service.CategoryService"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.service.PublisherService"%>
<%@page import="in.fssa.technolibrary.model.Publisher"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String bookId = request.getParameter("id");
	if (bookId != null && !bookId.isEmpty()) {
		int id = Integer.parseInt(bookId);
		Book book = BookService.findBookById(id);
		if (book != null) {
	%>
	<form action="update/price?id=<%=id %>" method="post">
		<input type="number" value="<%= book.getPrice() %>" name="price" placeholder="Price" required>
		<button type="submit">Submit</button>
	</form>
	<form action="titleAndDate_update" method="post">
		<input type="text" name="title" placeholder="book name" required>
		<input type="date" name="published_date" placeholder="published date"
			required>
		<button type="submit">Submit</button>
		
	</form>
	<form action="authorNameAndPublisherIdCategoryId_update" method="post">
		<input type="text" name="author" placeholder="author name" required>
		<label><b>Publisher Id : </b></label>
		<select>
	<% PublisherService publisherService = new PublisherService();
               Set<Publisher> listOfPublisher = publisherService.findAllPublisher();
               for (Publisher publisher : listOfPublisher) { %>
                <option  value="<%= publisher.getId() %>" ><%= publisher.getName() %></option>
            <% } %>
		</select> 
		
		<label><b>Category Id : </b></label>
		<select>
	<% CategoryService categoryService = new CategoryService();
               Set<Category> listOfCategory = categoryService.findAllcategory();
               for (Category category : listOfCategory) { %>
                <option  value="<%= category.getId() %>" ><%= category.getName() %></option>
            <% } %>
		</select> 
		<button type="submit">Submit</button>
		<%
			} else {
			%>
			<p>User not found.</p>
			<%
			}
			%>
			<%
			}
			%>
	</form>
</body>
</html>