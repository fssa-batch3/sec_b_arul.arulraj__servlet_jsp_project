<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Book Details</title>
<style>
div .img {
	height: 40px;
	width: 40px;
	padding-right: 20px;
	padding-bottom: 10px;
}

.top {
	display: flex;
	flex-direction: row;
	flex-wrap: nowrap;
	margin-top: 70px;
	justify-content: space-evenly;
	align-items: space-evenly;
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
.main-img {
	margin-top: 30px;
	height: 500px;
	width: 500px;
	border-radius: 10px;
}

.right {
	padding-left: 100px;
	padding-right: 80px;
	padding-top: 60px;
}

.company {
	color: hsl(26, 100%, 55%);
	font-size: 20px;
}

.heading {
	font-size: 50px;
	margin-top: 5px;
	margin-bottom: 20px;
}

.article {
	color: hsl(219, 9%, 45%);
}

.amount {
	display: inline;
}

.prize {
	font-size: 25px;
}

section.right button.btn-primary {
	color: hsl(26, 100%, 55%);
	background-color: hsl(25, 100%, 94%);
	border: white;
	padding-left: 10px;
	padding-right: 10px;
	padding-top: 5px;
	padding-bottom: 5px;
	border-radius: 5px;
	margin: 10px;
	font-size: 15px;
}
.hidden{
	display:none;
}
.discount {
	font-size: 15px;
	padding-top: 0px;
	margin-top: 0px;
	color: hsl(220, 14%, 75%);
}

</style>
</head>
<body>
<body>
	<jsp:include page="header.jsp"></jsp:include>
    <%
    String bookIdParam = request.getParameter("id");
    if (bookIdParam != null && !bookIdParam.isEmpty()) {
        int id = Integer.parseInt(bookIdParam);
        Book book = BookService.findBookById(id);
        if (book != null) {
    %>
    <section class="top">
		<section class="left">
			<img class="main-img" src="https://iili.io/J9IIfZg.png" />
		</section>
		<section class="right">
			<h1 class="heading"><%= book.getTitle() %></h1>
			<p><strong>Book Id:</strong> <%= book.getId() %></p>
        <p><strong>Author Name:</strong> <%= book.getAuthor() %></p>
			<div class="amount">
				<p class="prize">
					<strong>Price:</strong> <%= book.getPrice() %>
				</p>
				<p class="hidden"><%= book.getId() %></p>
			</div>
			<p><strong>Publisher Id:</strong> <%= book.getPublisherId() %></p>
        <p><strong>Category Id:</strong> <%= book.getCategoryId() %></p>
        <p><strong>Published Date:</strong> <%= book.getPublishedDate() %></p>
			<a href="<%=request.getContextPath()%>/book_list/edit?id=<%=book.getId()%>"><button>Edit</button></a> 
			<a onclick="return confirm('Are you sure to delete this book?');"
				href="<%=request.getContextPath()%>/book/delete?id=<%=book.getId()%>"><button>Delete</button></a>
		</section>
		</section>
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
</body>
</html>