<%@page import="in.fssa.technolibrary.model.User"%>
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

.hidden {
	display: none;
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
	Book book = (Book) request.getAttribute("BookDetail");
	%>
	<%
	String publisher = (String) request.getAttribute("PublisherDetail");
	%>
	<%
	String category = (String) request.getAttribute("CategoryDetail");
	%>
	<%
    User user = (User) session.getAttribute("user");
    String loggedInUserEmail = user != null ? user.getEmail() : "";
    String adminEmail = "admin05@gmail.com"; // Change this to the admin's email

    // Determine whether the user is the admin
    boolean isAdmin = loggedInUserEmail.equals(adminEmail);
    %>
	<%
	if (book != null) {
	%>
	<section class="top">
		<section class="left">
			<img class="main-img" src="https://iili.io/J9IIfZg.png" />
		</section>
		<section class="right">
			<h1 class="heading"><%=book.getTitle()%></h1>
			<p>
				<strong>Book Id:</strong>
				<%=book.getId()%></p>
			<p>
				<strong>Author Name:</strong>
				<%=book.getAuthor()%></p>
			<div class="amount">
				<p class="prize">
					<strong>Price:</strong>
					<%=book.getPrice()%>
				</p>
				<p class="hidden"><%=book.getId()%></p>
			</div>
			<p>
				<strong>Publisher Name:</strong>
				<%=publisher%></p>
			<p>
				<strong>Category Name:</strong>
				<%=category%></p>
			<p>
				<strong>Published Date:</strong>
				<%=book.getPublishedDate()%></p>
			<% if (isAdmin) { %>
            <a href="<%=request.getContextPath()%>/book_list/edit?id=<%=book.getId()%>"><button>Edit</button></a>
            <a onclick="return confirm('Are you sure to delete this book?');" href="<%=request.getContextPath()%>/book/delete"><button>Delete</button></a>
        <% } else { %>
            <a href="<%=request.getContextPath()%>/order/new?id=<%=book.getId()%>"><button id="buyButton">Buy</button></a>
        <% } %>
        </section>
	</section>
	<%
	} else {
	%>
	<p>Book not found.</p>
	<%
	}
	%>
	
	<script>
	
	document.getElementById('buyButton').addEventListener('click', function(event) {
	    // Check if the user is logged in (you can modify this condition as needed)
	    var isLoggedIn = <%= (user != null) %>;
	    
	    if (!isLoggedIn) {
	        event.preventDefault(); // Prevent the default behavior (i.e., following the link)
	        
	        // Display an alert to the user
	        alert('Please log in to make a purchase.');
	        
	        // Redirect to the login page (you need to specify the URL)
	        window.location.href = '<%= request.getContextPath() %>/user/login'; // Change '/login' to the actual login page URL
	    }
	});
	
	</script>
</body>
</html>