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
<title>Book Editing page</title>
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
	margin: 20px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

input[type="text"], input[type="number"], input[type="date"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

select {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}

.main {
	margin-top: 150px;
}

button[type="submit"] {
	background-color: #f67c92;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

button[type="submit"]:hover {
	background-color: #0056b3;
}

h1 {
	text-align: center;
	margin-bottom: 20px;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	String bookId = request.getParameter("id");
	if (bookId != null && !bookId.isEmpty()) {
		int id = Integer.parseInt(bookId);
		Book book = BookService.findBookById(id);
		if (book != null) {
	%>
	<section class="main">
		<form
			action="<%=request.getContextPath()%>/book/update/price?id=<%=id%>"
			method="post">
			<label><b>Price : </b></label><input type="number"
				value="<%=book.getPrice()%>" name="price" placeholder="Price" min="1"
				required>
			<button type="submit">Submit</button>

		</form>
		<form
			action="<%=request.getContextPath()%>/book/update/titleandpublisheddate?id=<%=id%>"
			method="post">
			<label><b>Book Name : </b></label> <input type="text"
				value="<%=book.getTitle()%>" name="title" placeholder="book name"
				required> <label><b>Published Date : </b></label> <input
				type="date" value="<%=book.getPublishedDate()%>"
				name="published_date" placeholder="published date" required>
			<button type="submit">Submit</button>

		</form>
		<form
			action="<%=request.getContextPath()%>/book/update/AuthorNamePublisherIdcategoryId?id=<%=id%>"
			method="post">
			<label><b>Author Name : </b></label> <input type="text"
				value="<%=book.getAuthor()%>" name="author"
				placeholder="author name" required> <label><b>Publisher
					Name : </b></label> <select name="publisher_name">
				<%
				Set<Publisher> publisherList = (Set<Publisher>) request.getAttribute("publisherDetails");
				%>
				<%
				for (Publisher publisher : publisherList) {
				%>
				<option value="<%=publisher.getId()%>"><%=publisher.getName()%></option>
				<%
				}
				%>
			</select> <label><b>Category Name : </b></label> <select name="category_name">
				<%
				
				Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryDetails");
				%>
				<%
				for (Category category : categoryList) {
				%>
				<option value="<%=category.getId()%>"><%=category.getName()%></option>
				<%
				}
				%>
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
	</section>
</body>
</html>