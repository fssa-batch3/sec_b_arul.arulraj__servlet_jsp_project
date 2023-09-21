<%@page import="in.fssa.technolibrary.model.User"%>
<%@page import="java.util.ArrayList"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.model.Order"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order List</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/CSS/order_list.css">
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0/dist/js/select2.min.js"></script>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
			
			<table class="width">
								<thead>
									<tr>
										<td><label for="inv">Order Id</label></td>
										<td>Order Date</td>
										<td>Book Name</td>
										<td>User Name</td>
										<td>Address</td>
										<td>Amount</td>
										<td>Order Status</td>
										<td>Edit</td>
									</tr>
								</thead>
								<tbody>
									<%
									Set<Order> orderList = (Set<Order>) request.getAttribute("orders");
									%>
									<%
									List<Book> bookList = (List<Book>) request.getAttribute("BookDetail");
									%>
									<%
									List<User> userList = (List<User>) request.getAttribute("UserDetail");
									%>
									<%
										
										List<Order> orderListAsList = new ArrayList<>(orderList);
										
										for (int i = 0; i < orderListAsList.size(); i++) {
										    
										%>
										<form action="<%=request.getContextPath()%>/order/update" method="post">
										<input name="bookId" value="<%=orderListAsList.get(i).getId()%>" style="display: none;">
										<tr>
										    <td><label for="num1">#<%=orderListAsList.get(i).getId()%></label></td>
										    <td><%=orderListAsList.get(i).getOrder_date()%></td>
										    <td><%=bookList.get(i).getTitle()%></td>
										    <td><%=userList.get(i).getName()%></td>
										    <td><%=orderListAsList.get(i).getAddress()%></td>
										    <td>Rs.<%=bookList.get(i).getPrice()%></td>
										    <td>
										        <select name="status" class="but but-con radius-4">
										        <option class="option">
										        <%=orderListAsList.get(i).getStatus()%>
										        </option>
										        <option>
										        	Ordered
										        </option>
										        <option style="background-color: #FFC0CB;">
										        	Canceled
										        </option>
										        <option style="background-color: #87CEEB;">
										        	Delivered
										        </option>
										        </select>
										    </td>
										    <td>
										    	<button class="but but-con radius-4"> Save </button>
										    </td>
										    <td><i class="fas fa-ellipsis-h"></i></td>
										</tr>
										</form>
										<%
										}
										%>
								</tbody>
							</table>
</body>
</html>