<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta charset="UTF-8">
    <title>Techno Library</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;1,100;1,300&display=swap"
        rel="stylesheet">
    <style>
    * {
    margin: 0;
    margin-left: 15px;
    padding: 0;
    font-family: 'Roboto', sans-serif;
}

#header {
    height: 100vh;
    background-image: url(https://iili.io/HyVXpHb.png);
    background-position: center;
    background-size: cover;
}

.conmtainer {
    margin-right: 100px;
    margin-left: 100px;
}

.logo {
    margin-top: 30px;
    width: 100px;
}

.header-text {
    max-width: 350px;
    margin-top: 140px;
}

h1 {
    font-size: 34px;
}

.square {
    height: 12px;
    width: 12px;
    display: inline-block;
    background: #f67c92;
    margin: 15px 0;
}

.common-btn {
    padding: 18px 40px;
    background: transparent;
    outline: none;
    border: 2px solid #f67c92;
    font-weight: bold;
    cursor: pointer;
}

p {
    font-size: 15px;
    line-height: 18px;
    color: #777;
}

.header-text button {
    margin-top: 20px;
    margin-bottom: 60px;
}

.line {
    line-height: 8px;
}

.line-1 {
    width: 15px;
    height: 15px;
    background: #f67c92;
    display: inline;
}

.line-2 {
    width: 80px;
    height: 1px;
    background: #f67c92;
    display: inline;
}

.line-3 {
    width: 60px;
    height: 1px;
    background: #f67c92;
    display: inline;
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
</head>

<body>

    <section id="header">
        <div class="container">
            <img src="https://iili.io/HyVXucu.png" class="logo">
            <div class="header-text">
                <h1>The purpose is to teach, bring learning to people.</h1>
                <span class="square"></span>
                <p>There are many variations of passages of Lorem Ipsum available, but the majority have suffered
                    alteration in some form, by injected humour, or randomised words which don't look even slightly
                    believable.</p>
                <button class="common-btn">Read More</button>
                <div class="line">
                    <span class="line-1"></span><br>
                    <span class="line-2"></span><br>
                    <span class="line-3"></span><br>
                </div>
            </div>
        </div>
    </section>
    <nav id="sideNav">
        <ul>
            <li><a href="index.jsp">HOME</a></li>
            <li><a href="add_book.jsp">ADD BOOK</a></li>
            <li><a href="book_list.jsp">BOOKS</a></li>
        </ul>
    </nav>
    <img src="https://iili.io/HyVl5l4.png" id="menuBtn">


    <script>
					document.addEventListener("DOMContentLoaded", function() {
						let menuBtn = document.getElementById("menuBtn");
						let sideNav = document.getElementById("sideNav");

						sideNav.style.right = "-250px";

						menuBtn.onclick = function() {
							if (sideNav.style.right === "-250px") {
								sideNav.style.right = "0";
							} else {
								sideNav.style.right = "-250px";
							}
						}

					});
				</script>
</body>

</body>
</html>