<%@page import="in.fssa.technolibrary.model.User"%>
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
.btn2{
	margin: 0px;
	position: absolute ;
	top: 120px;
	left: 93%;
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
					<input 
					pattern="[a-zA-Z ]+" title="Only contain Alphabets" placeholder="Search Author" type="text" name="authorName" />

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
			<div>
			<%
	User user = (User) session.getAttribute("user");
	String loggedInUserEmail = user != null ? user.getEmail() : "";
	String adminEmail = "admin05@gmail.com"; // Change this to the admin's email

	// Determine whether the user is the admin
	boolean isAdmin = loggedInUserEmail.equals(adminEmail); // Change this to your actual logic
	if (isAdmin) {
	%>
	<a href="<%=request.getContextPath()%>/book/new"><button class="btn2">ADD BOOK</button></a>

	<%
	}
	%>
			
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
	<script src="<%=request.getContextPath()%>/assets/JS/errordiv.js"></script>
</body>
</html>