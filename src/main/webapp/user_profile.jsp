<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="in.fssa.technolibrary.model.Book"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="in.fssa.technolibrary.model.Order"%>
<%@page import="java.util.Set"%>
<%@page import="in.fssa.technolibrary.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/CSS/profile.css">
<title>User Profile</title>
<style>
	body {
    background: #fff;
    overflow: hidden;
    padding-top: 0px;
    font-family: "Poppins", sans-serif;
}
.order-list{
	width: 1200px;
	background-color: #fff;
	padding: 20px;
}
.right-side{
	overflow-y: scroll;
    height: 90vh;
}
.right-side::-webkit-scrollbar {
    width: 0;
}

.right-side::-webkit-scrollbar-thumb {
    background-color: transparent; 
    }

.width{
  width: 100%;
}
.empty{
	margin-left: 250px;
}
.empty2{
	position: relative;
	top: 100px;
}
</style>
</head>
<body>
	<%
	User user = (User) request.getAttribute("UserDetail");
	%>
	
	<div class="container">
		<div class="profile-header">
			<div class="profile-img">
				<img src="<%=user.getImage()%>" width="200" alt="Profile Image">
			</div>
			<div class="profile-nav-info">
				<h3 class="user-name"><%=user.getName()%></h3>
				<div class="address">
					<p id="state" class="state">Chennai ,</p>
					<span id="country" class="country">IN.</span>
				</div>

			</div>
		</div>


		<div class="main-bd">
			<div class="left-side">
				<div class="profile-side">
					<p class="mobile-no">
						<i class="fa fa-phone"></i><%=user.getPhoneNumber()%>
					</p>
					<p class="user-mail">
						<i class="fa fa-envelope"></i>
						<%=user.getEmail()%>
					</p>

					<div class="user-rating">
						<h3 class="rating"></h3>
						<div class="rate">
							<div class="star-outer">
								<div class="star-inner">
									<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i> <i class="fa fa-star"></i> <i
										class="fa fa-star"></i>
								</div>
							</div>
							<span class="no-of-user-rate"><span></span>&nbsp;&nbsp;Orders</span>
						</div>

					</div>
					<div class="user-bio">
						<h5></h5>
						<p class="bio">
							<i class="fa fa-home" style="color: black; font-size: 40px;"
								aria-hidden="true"></i>
						</p>
					</div>
					<div class="profile-btn">
						<button class="chatbtn" id="chatBtn">
							<i class="fa fa-comment"></i> Edit profile
						</button>
					</div>

					<form action="<%=request.getContextPath()%>/user/update"
						method="post" enctype="multipart/form-data">
						<input type="hidden" id="imageUrl" name="imageUrl" required>
						<label for="imageFile">Select image File:</label> 
						<input type="file" name="imageFile" id="imageFile">
						 <br> <br>
						<small><strong>Do not upload image that exceeds
								limit of 5 Mb.</strong></small> <small> <strong>Please wait
								don't click upload Image again.</strong>
						</small>
						<button type="button" id="uploadImageButton"
							style="position: relative; bottom: 90px; left: 100px;">
							Upload Image<i class="fas fa-upload"></i>
						</button>
						<button type="submit" id="submitButton"
							style="position: relative; bottom: 63px; left: 50px;" disabled>
							Upload <i class="fas fa-upload"></i>
						</button>
					</form>
				</div>

			</div>
			<div class="right-side">

				<div class="nav">
					<ul>
						<li id="border1" class="user-post active">Order Status</li>
					</ul>
				</div>
				<div class="empty">
				<div class="empty2">
				   <h3>Your Bag is empty</h3>
					<h5>Buy something to make me happy :)</h5>
					</div>
					
				   <img src="https://iili.io/JJAGhQt.jpg" style="width: 700px; height:700px;" alt="Image Description">
				   
				</div>
				
				<div class="profile-body">
					<div class="profile-posts ">
						<div class="order-list radius-6">
							<h4>Order List</h4>
							<table class="width">
								<thead>
									<tr>
										<td><label for="inv">Order Id</label></td>
										<td>Order Date</td>
										<td>Book Name</td>
										<td>Address</td>
										<td>Amount</td>
										<td>Order Status</td>
										<td>Last Update Date</td>
									</tr>
								</thead>
								<tbody>
									<%
									Set<Order> orderList = (Set<Order>) request.getAttribute("orderDetails");
									
									List<Book> bookList = (List<Book>) request.getAttribute("BookDetail");
									
										SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd"); // Define the date format
										Calendar calendar = Calendar.getInstance();
										
										List<Order> orderListAsList = new ArrayList<>(orderList);
										List<Book> bookListAsList = new ArrayList<>(bookList);
										
										int count = 0;
										for (int i = 0; i < orderListAsList.size(); i++) {
										    String orderDateStr = orderListAsList.get(i).getOrder_date(); // Get the order date as a String
										    Date orderDate = sdf.parse(orderDateStr); // Parse the String to a Date
										    calendar.setTime(orderDate);
										    calendar.add(Calendar.DAY_OF_MONTH, 7); // Add 7 days to the order date
										
										    String deliveryDate = sdf.format(calendar.getTime()); // Format the delivery date
										%>
										
										<tr>
										    <td><label for="num1">#<%=orderListAsList.get(i).getId()%></label></td>
										    <td><%=orderListAsList.get(i).getOrder_date()%></td>
										    <td><%=bookListAsList.get(i).getTitle()%></td>
										    <td><%=orderListAsList.get(i).getAddress()%></td>
										    <td>Rs.<%=bookListAsList.get(i).getPrice()%></td>
										    <td>
											    <button class="but but-con radius-4" style="background-color:
											        <% 
											        String status = orderListAsList.get(i).getStatus();
											        if ("Canceled".equals(status)) {
											            out.print("#FF5733"); // Red
											        } else if ("Delivered".equals(status)) {
											            out.print("#87CEEB"); // Sky Blue
											        } else if ("Ordered".equals(status)) {
											            out.print("#FFD700"); // Light Orange
											        } else {
											            out.print("#FFFFFF"); // Default white color or another color of your choice
											        }
											        %>;">
											        <%= status %>
											    </button>
											</td>
										    <td>
											    <span>
											        <% 
											        String lastUpdate = orderListAsList.get(i).getLast_update_on();
											        if (lastUpdate == null) {
											            out.print("Waiting for Admin response");
											        } else {
											            out.print(lastUpdate);
											        }
											        %>
											    </span>
											</td>
										    
										</tr>
										<%
										count++;
										}
										%>
								</tbody>
							</table>

						</div>
					</div>


				</div>
			</div>
		</div>
</div>
		<nav id="sideNav">
			<ul>
				<li><a href="<%=request.getContextPath()%>/index">Home</a></li>
				<li><a href="<%=request.getContextPath()%>/book/list">Books</a></li>
				<li><a href="<%=request.getContextPath()%>/user/profile">Profile</a></li>
				<li><a href="<%=request.getContextPath()%>/logout">LogOut</a></li>
			</ul>
		</nav>
		<img src="https://iili.io/HyVl5l4.png" id="menuBtn">
		
		
		<script src="<%=request.getContextPath()%>/assets/JS/profile.js"></script>
		<script>
		
		//image uploading
	
	const uploadImageButton = document.getElementById("uploadImageButton");
	const submitButton = document.getElementById("submitButton");
    const imageFileInput = document.getElementById("imageFile");
    const imageUrlInput = document.getElementById("imageUrl");
    
    uploadImageButton.addEventListener("click", () => {
        console.log("Upload button clicked.");
        const imageFile = imageFileInput.files[0];
        if (imageFile) {
            uploadImage(imageFile);
        } else {
            alert("Please select an image file.");
        }
    });
    
     function uploadImage(imageFile) {
	  const url = 'https://image-cdn.p.rapidapi.com/upload?async=true&allow-webp=true&compression=auto';
	  const data = new FormData();
	  data.append('image', imageFile);

	  const options = {
	    method: 'POST',
	    headers: {
			'X-RapidAPI-Key': 'd9eb13440dmshcbba8b0182f24a9p1b0820jsn2559ad2433fa',
			'X-RapidAPI-Host': 'image-cdn.p.rapidapi.com'
		},
	    body: data
	  };
		  
	    fetch(url, options)
        .then(response => response.text())
        .then(result => {
        	const data = JSON.parse(result);
            const url_value = data['url'];
            imageUrlInput.value = url_value;
            console.log(imageUrlInput);
            console.log(url_value);
            console.log(data);
            submitButton.disabled = false;
        })
.catch((error) => {
        // Handle any errors here
        console.error('API Error:', error);
    });
	        }
     
  // Get the count value from JSP
     const count = <%=count%>;

     // Get references to the table and empty div
     const table = document.querySelector(".profile-body");
     const emptyDiv = document.querySelector(".empty");

     // Check if count is zero and toggle visibility accordingly
     if (count === 0) {
         table.style.display = "none"; // Hide the table
         emptyDiv.style.display = "block"; // Show the empty div
     } else {
         table.style.display = "block"; // Show the table
         emptyDiv.style.display = "none"; // Hide the empty div
     }

     // Set the count value in the user-rating element
     document.querySelector(".rating").textContent = count;
	</script>
</body>
</html>