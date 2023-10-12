<!DOCTYPE html>
<%@page import="in.fssa.technolibrary.model.Category"%>
<%@page import="in.fssa.technolibrary.model.Publisher"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="in.fssa.technolibrary.service.BookService"%>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Book Editing Page</title>
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
	margin: 20px auto;
	width: 25%;
	margin-top: 200px;
	border-radius: 5px;
	box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
}

label {
	font-weight: bold;
}

input[type="text"], input[type="number"], input[type="date"], select {
	width: 200px;
	padding: 10px;
	margin-bottom: 10px;
	border: 1px solid #ccc;
	border-radius: 3px;
}
.main {
	margin-top: 50px;
	text-align: center;
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
}

@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}
.input{
	display: flex;
    justify-content: space-between;
}

</style>
</head>
<body>
	<%
	String errorMsg = (String) request.getAttribute("error");
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
	<%
	String bookId = request.getParameter("id");
	if (bookId != null && !bookId.isEmpty()) {
		int id = Integer.parseInt(bookId);
		Book book = BookService.findBookById(id);
		if (book != null) {
	%>
	<section class="main">
		<form action="<%=request.getContextPath()%>/book/update?id=<%=id%>"
			method="post">
			<div class="input">
				<label for="price"><b>Price:</b></label> <input type="number"
					value="<%=book.getPrice()%>" name="price" id="price"
					placeholder="Price" min="1" required>
			</div>
			<div class="input">
				<label for="title"><b>Book Name:</b></label> <input type="text"
					value="<%=book.getTitle()%>" name="title" id="title"
					placeholder="Book Name" required>
			</div>
			<div class="input">
				<label for="published_date"><b>Published Date:</b></label> <input
					type="date" value="<%=book.getPublishedDate()%>"
					name="published_date" id="date"
					placeholder="Published Date" required>
			</div>
			<div class="input">
				<label for="author"><b>Author Name:</b></label> <input type="text"
					pattern="[a-zA-Z ]+" title="Only contain Alphabets"
					value="<%=book.getAuthor()%>" name="author" id="author"
					placeholder="Author Name" required>
			</div>
			<div class="input">
				<label for="publisher_name"><b>Publisher Name:</b></label> <select
					name="publisher_name" id="publisher_name">
					<%
					Set<Publisher> publisherList = (Set<Publisher>) request.getAttribute("publisherDetails");
					for (Publisher publisher : publisherList) {
					%>
					<option value="<%=publisher.getId()%>"><%=publisher.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
			<div class="input">
				<label for="category_name"><b>Category Name:</b></label> <select
					name="category_name" id="category_name">
					<%
					Set<Category> categoryList = (Set<Category>) request.getAttribute("categoryDetails");
					for (Category category : categoryList) {
					%>
					<option value="<%=category.getId()%>"><%=category.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
			<div>
				<button type="submit">Submit</button>
			</div>
		</form>
	</section>
	<%
	} else {
	%>
	<p>User not found.</p>
	<%
	}
	}
	%>
	<script>
		// Get a reference to the date input field
		const dateInput = document.getElementById("date");

		// Add an event listener to the input field
		dateInput.addEventListener("change", function() {
			// Get the selected date value
			const selectedDate = new Date(dateInput.value);

			// Get today's date
			const today = new Date();

			// Compare the selected date with today's date
			if (selectedDate <= today) {
				// Valid date, do nothing
			} else {
				// Invalid date, reset the input field
				dateInput.value = "";
				alert("Please select a date that is today or earlier.");
			}
		});
	</script>
	<script src="<%=request.getContextPath()%>/assets/JS/errordiv.js"></script>
</body>
</html>
