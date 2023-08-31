<%@page import="in.fssa.technolibrary.service.BookService"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<style>

* {
    margin: 0;
    padding: 0;
    font-family: 'Roboto', sans-serif;
}

.about-container {
    margin-top: 100px;
    padding: 100px 0;
    display: flex;
    flex-direction: row;
}

.about-left-col {
    flex-basis: 50%;
}

.about-left-col img {
    width: 100%;
    margin-top: -10px;
}

.about-right-col {
    margin-left:35px;
    flex-basis: 50%;
    text-align: right;
}
.main_bg {
    background-color:#fff;
    max-width: 1280px;
    height: 800px;
    display: flex;
    justify-content: center;
    align-items: center;
    margin: 0 auto;
}

.form {
    width: 650px;
}
.inputDiv{
   
    padding-top:15px;
}
.form-text {
    text-align: center;
    margin: 0 0 40px 0;
}

.form-text h1 span img {
    margin: 0 10px;

}

.form-text h1 {
    color: black;
    font-size: 35px;
    margin-bottom: 20px;
}

.form-text p {
    color: black;
    font-size: medium;
  margin-left:15px;
}

.main-form div {
    margin: 10px 10px;
    width: 300px;
    display: inline-block;
}

.main-form div input {
    width: 80%;
    background: none;
    border: 1px solid #f67c92;
    font-size: 20px;
    color: black;
    outline: none;
    padding: 3px 0 3px 10px;
    margin-top: 10px;
}

.main-form div select {
    width: 84%;
    background: none;
    border: 1px solid #f67c92;
    font-size: 20px;
    outline: none;
    padding: 3px 0 3px 10px;
    margin-top: 10px;
}
::placeholder {
    color: grey; 
}

option[disabled] {
    color: grey; 
}
.main-form div span {
    width: 100%;
    color: black;
    font-size: 25px;
}

#submit {
    margin-top:30px;
    padding:5px;
    width: 100%;
    text-align: center;
}

#submit input {
    width: 200px;
    background-color: #f67c92 !important;
    color: white !important;
    transition: all .3s;
}

#submit input:hover {
    width: 200px;
    background-color: white !important;
    color: black !important;
}

#submit input:active {
    font-size: 19px;
    background-color: rgb(46, 20, 5) !important;
    color: black !important;
}


@media screen and (max-width:710px) {
    .main-form {
        text-align: center;
    }
}


#sideNav {
    width: 250px;
    height: 100vh;
    position: fixed;
    right: 0;
    top: 0;
    background: #f67c92;
    z-index: 2;
}

nav ul li {
    list-style: none;
    margin: 50px 20px;
}

nav ul li a {
    text-decoration: none;
    color: #fff;

}

#menuBtn {
    width: 40px;
    position: fixed;
    right: 5%;
    top: 30px;
    z-index: 2;
    cursor: pointer;
    transition: .5s;
}
</style>
<head>
    <meta charset="UTF-8">
    <title>Book Form</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;1,100;1,300&display=swap"
        rel="stylesheet">
</head>

<body class="main_bg">
    <section id="about">
        <div class="about-container">
            <div class="about-left-col">
                <img src="https://iili.io/HyV7oCv.jpg">
            </div>
            <div class="about-right-col">
                <div class="form">
                    <div class="form-text">
                        <h1><span><img src="art-1.png" alt=""></span>Add Book<span><img src="art-1.png" alt=""></span>
                        </h1>
                    </div>
                    <div class="main-form">
                        <form action="create" method="post">
                            <div class="inputDiv">
                                <span>Book Title</span>
                                <input type="text" name="title" id="name" placeholder="Book Title" required>
                            </div>
                            <div class="inputDiv">
                                <span>Author Name</span>
                                <input type="text" name="author" id="name" placeholder="Author Name" required>
                            </div>
                            <div class="inputDiv">
                                <span>Category Id</span>
                                <input type="number" name="category_id" id="number" placeholder="Category Id" required>
                            </div>
                            <div class="inputDiv">
                                <span>Publisher Id</span>
                                <input type="number" name="publisher_id" id="number" placeholder="Publisher Id" required>
                            </div>
                            <div class="inputDiv">
                                <span>Published Date</span>
                                <input type="date" name="published_date" id="date" placeholder="date" required>
                            </div>
                            <div class="inputDiv">
                                <span>Price</span>
                                <input type="number" name="price" id="number" placeholder="Price" required>
                            </div>
                            <div id="submit">
                                <input type="submit" value="SUBMIT" id="submit">
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <nav id="sideNav">
        <ul>
            <li><a href="index.jsp">HOME</a></li>
            <li><a href="add_book.jsp">ADD BOOK</a></li>
            <li><a href="book_list.jsp">BOOKS</a></li>
            <li><a href="get_book_by_id.jsp">FIND BOOK BY ID</a></li>
        </ul>
    </nav>
    <img src="https://iili.io/HyVl5l4.png" id="menuBtn">
    <script>
        let menuBtn = document.getElementById("menuBtn");
        let sideNav = document.getElementById("sideNav");
        sideNav.style.right = "-250px";


        menuBtn.onclick = function () {
            if (sideNav.style.right === "-250px") {
                sideNav.style.right = "0";
            } else {
                sideNav.style.right = "-250px";
            }
        }
    </script>
</body>

</html>