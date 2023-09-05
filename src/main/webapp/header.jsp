<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<style>
a {
	text-decoration: none;
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

img {
	width: 200px;
}

.logo {
	margin-top: 10px;
	margin-left: 10px;
	width: 70px;
}

.fixed-header {
	background-color: white;
	color: #fff;
	padding: 10px;
	position: fixed;
	top: 0;
	left: 0;
	width: 100%;
	z-index: 100;
}
</style>
</head>
<body>
<header class="fixed-header">
		<a href="index.jsp"><img src="https://iili.io/HyVXucu.png"
			class="logo"></a>
		<nav id="sideNav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index.jsp">HOME</a></li>
				<li><a href="<%=request.getContextPath()%>/add_book.jsp">ADD BOOK</a></li>
				<li><a href="<%=request.getContextPath()%>/book_list.jsp">BOOKS</a></li>
			</ul>
		</nav>
		<img src="https://iili.io/HyVl5l4.png" id="menuBtn">
	</header>
	
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
</html>