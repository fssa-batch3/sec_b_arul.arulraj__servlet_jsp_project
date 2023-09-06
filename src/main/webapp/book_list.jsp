<%@page import="in.fssa.technolibrary.model.Category"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book List</title>
<style>
body {
	background-color: #f5f5f5;
	font-family: Arial, sans-serif;
	color: #333;
	margin: 0;
	padding: 0;
}

.mainsection {
	display: flex;
	flex_direction: row;
	margin-top: 20px;
}

h1 {
	text-align: center;
	font-size: 24px;
	margin-top: 120px;
}

h2 {
	font-size: 18px;
	margin-top: 20px;
	margin-bottom: 10px;
}

form {
	margin-top: 10px;
}

input[type="text"] {
	width: 150px;
	padding: 5px;
	margin-left: 7px;
	border: 1px solid #ccc;
	border-radius: 4px;
	border: 1px solid #ccc;
}

button {
	cursor: pointer;
	margin-top: 20px;
	margin-left: 40px;
	padding: 5px 10px;
	background-color: #f67c92;
	color: #fff;
	border: none;
	border-radius: 4px;
}

button:hover {
	background-color: #0056b3;
}

.search_box {
	margin-left: 10px;
}

.Category_box {
	margin-left: 10px;
}
/* Style the book container */
.book-container {
	display: flex;
	flex-wrap: wrap;
	justify-content: flex-start;
	gap: 20px;
}

/* Style each book box */
.book-box {
	border: 1px solid #ccc;
	padding: 20px;
	width: 200px;
	background-color: #f9f9f9;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
	border-radius: 5px;
	display: flex;
	flex-direction: column;
}

/* Style the book details section */
.book-details {
	flex-grow: 1;
}

.section2 {
	margin-left: 20px;
}

.book-actions {
	display: flex;
	justify-content: space-between;
	margin-top: 10px;
}

.book-actions a {
	text-decoration: none;
	padding: 5px 10px;
	background-color: #f67c92;
	color: #fff;
	border-radius: 5px;
}

.book-actions a:hover {
	background-color: #0056b3;
}

.hide {
	display: none;
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<h1>List Of Books</h1>
	<section class="mainsection">
		<section class="section1">
			<%
			Set<Book> bookList = (Set<Book>) request.getAttribute("bookDetails");
			%>
			<%
			Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryDetails");
			%>

			<div class="search_box">
				<form action="<%=request.getContextPath()%>/book_list/authorDetails"
					method="get">
					<input placeholder="Search Author" type="text" name="authorName" />

					<button type="submit">Search</button>
				</form>
			</div>
			<div class="Category_box">
				<h2>Filter by Category</h2>
				<form
					action="<%=request.getContextPath()%>/book_list/categoryDetails"
					method="get">
					<div>

						<%
						for (Category category : categoryList) {
						%>
						<label> <input type="radio" name="categoryId"
							value="<%=category.getId()%>"> <%=category.getName()%>
						</label><br>
						<%
						}
						%>
					</div>

					<button type="submit">Apply Filter</button>
				</form>
			</div>
		</section>

		<section class="section2">
			<div class="book-container">
				<%
				for (Book book : bookList) {
				%>
				<div class="book-box">
					<div class="book-details">
						<p>
							<strong>Book Title:</strong>
							<%=book.getTitle()%></p>
						<div>
							<img src="https://iili.io/J9IIfZg.png">
						</div>
						<p>
							<strong>Author Name:</strong>
							<%=book.getAuthor()%></p>
						<p>
							<strong>Price:</strong> <b>Rs.</b><%=book.getPrice()%>
						</p>
						<p class="hide"><%=book.getCategoryId()%></p>
						<p class="hide"><%=book.getAuthor()%></p>
						<p class="hide"><%=book.getId()%></p>
					</div>
					<div class="book-actions">
						<a
							href="<%=request.getContextPath()%>/book_list/details?id=<%=book.getId()%>">View</a>

					</div>
				</div>
				<%
				}
				%>
			</div>
		</section>
	</section>
</body>
</html>