<%@page import="in.fssa.technolibrary.model.User"%>
<%@page import="in.fssa.technolibrary.model.Category"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/CSS/order.css">
<title>Order form</title>
<style>
	#myform{
	 margin-top : 0px;
	}
</style>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
    <div class="overlay" id="overlay"></div>
    

    <%
	Book book = (Book) request.getAttribute("BookDetail");
	%>
	<%
	String category = (String) request.getAttribute("CategoryDetail");
	%>
	<%User user = (User) request.getAttribute("UserDetail"); %>
    <form action="<%=request.getContextPath()%>/book/order" class="form" method="post" id="myform">
    <div class="card" id="card">
        <div class="title">Purchase Receipt</div>
        <div class="info">
            <div class="row">
                <div class="col-7">
                    <span id="heading">Date</span><br>
					<span id="currentDate"></span>
                </div>
                <div class="col-5 pull-right">
                    <span id="heading">Order No.</span><br>
                    <span id="details">012j1gvs356c</span>
                </div>
            </div>
        </div>
        <div class="pricing">
            <div class="row">
                <div class="col-9">
                    <span id="name">Book Name : <%=book.getTitle()%></span>
                </div>
                <div class="col-3">
                    <span id="price">Price : <big>Rs.</big> <%=book.getPrice()%> /-</span>
                </div>
            </div>
            <div class="row">
                <div class="col-9">
                    <span id="name">Author Name</span>
                </div>
                <div class="col-3">
                    <span id="price"><%=book.getAuthor()%></span>
                </div>
            </div>
        </div>
        
            <div class="row">
                <input type="text" name="address" id="address" required>
                <label for="address">Address</label>
            </div>
        <div class="total">
            <div class="row">
                <div class="col-9">Total With delivery</div>
                <div class="col-3"><big>Rs.</big> <%=book.getPrice()%> /-</div>
            </div>
        </div>
        <div class="tracking">
            <div class="title">Tracking Order</div>
        </div>
        <div class="progress-track">
            <ul id="progressbar">
                <li class="step0 " id="step1">Waiting for Your Confirmation</li>
                <li class=" text-center" id="step2">Ordered</li>
                <li class="step0 text-right" id="step3">Shipped</li>
                <li class="step0 text-right" id="step4">Delivered</li>
            </ul>
        </div>
        <input value="<%=user.getId()%>" name="userId" style="display: none;">
        <input value="<%=book.getId()%>" name="bookId" style="display: none;">
        <div class="row">
        	<button type="submit" class="okay-button">Confirm</button>
        
        	<button class="okay-button" onclick="cancelOverlay()">Cancel</button>
        
        </div>
    </div>
    </form>
    <div id="myform">
        <h2>Order Form</h2>
        <div class="area">
            <div class="row">
                <input value="<%=user.getId()%>" name="userId" style="display: none;">
                <div class="col2">
                    <input value="<%=user.getName()%>" type="text" name ="firstname" required>
                    <label for="fistname">Name</label>
                </div>
                <div class="col2">
                    <input value="<%=user.getEmail()%>" name="lastname" required>
                    <label for="lastname">Email Id</label>
                </div>
            </div>
            <div class="row">
                <input value="<%=user.getPhoneNumber()%>" id="phone" name="phone"required>
                <label for="phone">Phone</label>
            </div>

        </div>
        <div class="area">
            <div class="ckeckarea">
                <input type="checkbox" name="paymentMethod" id="cardPayment" onclick="togglePaymentFields(this)">
                <label for="cardPayment">Card payment.</label>
            </div>
            <div class="ckeckarea">
                <input type="checkbox" name="paymentMethod" id="cashOnDelivery" onclick="togglePaymentFields(this)">
                <label for="cashOnDelivery">Cash On Delivery.</label>
            </div>
            <div class="row">
                <div class="col2 hidden" id="cardPaymentFields">
                    <input type="text">
                    <label for="name">Card Holder Name</label>
                </div>
                <div class="col2 hidden" id="cvvField" style="display: none;">
                    <input type="number" min="100" max="999">
                    <label for="cvv">CVV</label>
                </div>
                <div class="col2 hidden" id="accountNumberField">
                    <input type="number" pattern="\d{16}" title="Please enter a 16-digit account number">
                    <label for="account number">Account Number</label>
                </div>
            </div>
        </div>
        <div class="row">
            <input type="submit" value="Submit" class="btn" onclick="showCard()">
            <a href="<%=request.getContextPath()%>/index.jsp"><input type="submit" value="cancel" class="btn"></a>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/assets/JS/order.js"></script>
    
</body>
</html>