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
<link
	href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;1,100;1,300&display=swap"
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
	width: 70px;
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
.words{
	font-size: 20px;
}
</style>
</head>

<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section id="header">
		<div class="container">
			<img src="https://iili.io/HyVXucu.png" class="logo">
			<div class="header-text">
				<h1>The purpose is to teach, bring learning to people.</h1>
				<span class="square"></span>
				<p class="words">One glance at a book and you hear the voice of another
					person, perhaps someone dead for 1,000 years. To read is to voyage
					through time."</p>
				<button class="common-btn">Read More</button>
				<div class="line">
					<span class="line-1"></span><br> <span class="line-2"></span><br>
					<span class="line-3"></span><br>
				</div>
			</div>
		</div>
	</section>

</body>

</body>
</html>