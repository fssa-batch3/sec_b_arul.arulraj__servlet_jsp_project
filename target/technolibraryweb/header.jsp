<%@page import="in.fssa.technolibrary.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/header.css">
</head>
<body>
	<header class="fixed-header">
		<a href="<%=request.getContextPath()%>/index"><img
			src="https://iili.io/HyVXucu.png" class="logo"></a>
			<%
			User user = (User) session.getAttribute("user");
			out.println(user);
			boolean isLogin_in = user != null;
			String hardcodedEmail = "Admin05@gmail.com";
			%>
			<%
			if (isLogin_in == false) {
			%>
			<nav id="sideNav">
			 <ul>
				<li><a href="<%=request.getContextPath()%>/index">HOME</a></li>
				<li><a href="<%=request.getContextPath()%>/book/list">BOOKS</a></li>
				<li><a href="<%=request.getContextPath()%>/publisher/list">PUBLISHERS</a></li>
				<li><a href="<%=request.getContextPath()%>/category/list">CATEGORYS</a></li>
				<li><a href="<%=request.getContextPath()%>/login.jsp">Login</a></li>
			  </ul>
			</nav>

			<%
			} else if(user.getEmail().equals(hardcodedEmail)) {
			%>

			<nav id="sideNav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">HOME</a></li>
				<li><a href="<%=request.getContextPath()%>/book/new">ADD
						BOOK</a></li>
				<li><a href="<%=request.getContextPath()%>/book/list">BOOKS</a></li>
				<li><a href="<%=request.getContextPath()%>/publisher/new">ADD
						PUBLISHER</a></li>
				<li><a href="<%=request.getContextPath()%>/publisher/list">PUBLISHERS</a></li>
				<li><a href="<%=request.getContextPath()%>/category/new">ADD
						CATEGORYS</a></li>
				<li><a href="<%=request.getContextPath()%>/category/list">CATEGORYS</a></li>
				<li><a href="<%=request.getContextPath()%>/logout">LogOut</a></li>
			</ul>
			</nav>
			<%
			} else{
			%>

			<nav id="sideNav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/book/list">Books</a></li>
				<li><a href="<%=request.getContextPath()%>/user/profile">Profile</a></li>
				<li><a href="<%=request.getContextPath()%>/logout">LogOut</a></li>
			</ul>
			</nav>
			<%
			}
			%>
		


		<img src="https://iili.io/HyVl5l4.png" id="menuBtn">
	</header>

	<script src="<%=request.getContextPath()%>/assets/JS/header.js"></script>
</body>
</html>