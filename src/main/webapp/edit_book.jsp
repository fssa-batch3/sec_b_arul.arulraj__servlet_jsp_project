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
            width: 80%;
            margin-top: 200px;
            max-width: 500px;
            border-radius: 5px;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.2);
        }

        label {
            font-weight: bold;
        }

        input[type="text"],
        input[type="number"],
        input[type="date"],
        select {
            width: 100%;
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
    <form action="<%=request.getContextPath()%>/book/update?id=<%=id%>" method="post">
        <div>
            <label for="price"><b>Price:</b></label>
            <input type="number" value="<%=book.getPrice()%>" name="price" id="price" placeholder="Price" min="1" required>
        </div>
        <div>
            <label for="title"><b>Book Name:</b></label>
            <input type="text" value="<%=book.getTitle()%>" name="title" id="title" placeholder="Book Name" required>
        </div>
        <div>
            <label for="published_date"><b>Published Date:</b></label>
            <input type="date" value="<%=book.getPublishedDate()%>" name="published_date" id="published_date" placeholder="Published Date" required>
        </div>
        <div>
            <label for="author"><b>Author Name:</b></label>
            <input type="text" pattern="[a-zA-Z]+" title="Only contain Alphabets" value="<%=book.getAuthor()%>" name="author" id="author" placeholder="Author Name" required>
        </div>
        <div>
            <label for="publisher_name"><b>Publisher Name:</b></label>
            <select name="publisher_name" id="publisher_name">
                <%
                Set<Publisher> publisherList = (Set<Publisher>) request.getAttribute("publisherDetails");
                for (Publisher publisher : publisherList) {
                %>
                <option value="<%=publisher.getId()%>" ><%=publisher.getName()%></option>
                <%
                }
                %>
            </select>
        </div>
        <div>
            <label for="category_name"><b>Category Name:</b></label>
            <select name="category_name" id="category_name">
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
</body>
</html>
