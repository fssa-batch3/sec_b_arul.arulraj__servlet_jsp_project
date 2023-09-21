<%@page import="in.fssa.technolibrary.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/CSS/profile.css">
<title>Insert title here</title>
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
					<div class="user-bio">
						<h5>Address</h5>
						<p class="bio">
							Lorem ipsum dolor sit amet, hello how consectetur adipisicing
							elit. Sint consectetur provident magni yohoho consequuntur,
							voluptatibus ghdfff exercitationem at quis similique. Optio,
							amet! <i class="fa fa-home"
								style="color: black; font-size: 40px;" aria-hidden="true"></i>
						</p>
					</div>
					<div class="profile-btn">
						<button class="chatbtn" id="chatBtn">
							<i class="fa fa-comment"></i> Edit profile
						</button>
					</div>
					
				<form action="<%=request.getContextPath()%>/user/update" method="post">
					<input type="hidden" id="imageUrl" name="imageUrl" required>
					<label for="audioFile">Select image File:</label> 
					<input
						type="file" name="imageFile" id="imageFile"> <br> <br>
					<small><strong>Do not upload image that exceeds
							limit of 5 Mb.</strong></small> <small> <strong>Please wait don't
							click upload Image again.</strong>
					</small>
					<button type="button" id="uploadImageButton"
						style="position: relative; bottom: 54px; left: 280px;">
						Upload Image<i class="fas fa-upload"></i>
					</button>
					<button type="submit"  id="submitButton" disabled>
				Upload <i class="fas fa-upload"></i>
			</button>
				</form>
				
					<div class="user-rating">
						<h3 class="rating">4.5</h3>
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
				</div>

			</div>
			<div class="right-side">

				<div class="nav">
					<ul>
						<li onclick="tabs(0)" id="border1" class="user-post active">Current
							Order Status</li>
						<li onclick="tabs(1)" id="border2" class="user-review">Order
							History</li>
					</ul>
				</div>
				<div class="profile-body">
					<div class="profile-posts tab">
						<h1>Your Order Status</h1>

						<div class="card">
							<div class="title">Purchase Reciept</div>
							<div class="info">
								<div class="row">
									<div class="col-7">
										<span id="heading">Date</span><br> <span id="details">10
											October 2018</span>
									</div>
									<div class="col-5 pull-right">
										<span id="heading">Order No.</span><br> <span
											id="details">012j1gvs356c</span>
									</div>
								</div>
							</div>
							<div class="pricing">
								<div class="row">
									<div class="col-9">
										<span id="name">BEATS Solo 3 Wireless Headphones</span>
									</div>
									<div class="col-3">
										<span id="price">&pound;299.99</span>
									</div>
								</div>
								<div class="row">
									<div class="col-9">
										<span id="name">Shipping</span>
									</div>
									<div class="col-3">
										<span id="price">&pound;33.00</span>
									</div>
								</div>
							</div>
							<div class="total">
								<div class="row">
									<div class="col-9"></div>
									<div class="col-3">
										<big>&pound;262.99</big>
									</div>
								</div>
							</div>
							<div class="tracking">
								<div class="title">Tracking Order</div>
							</div>
							<div class="progress-track">
								<ul id="progressbar">
									<li class="step0 active " id="step1">Ordered</li>
									<li class="step0 active text-center" id="step2">Shipped</li>
									<li class="step0 active text-right" id="step3">On the way</li>
									<li class="step0 text-right" id="step4">Delivered</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				<div class="profile-reviews tab">
					<h1>Previous orders</h1>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
						Aliquam pariatur officia, aperiam quidem quasi, tenetur molestiae.
						Architecto mollitia laborum possimus iste esse. Perferendis
						tempora consectetur, quae qui nihil voluptas. Maiores debitis
						repellendus excepturi quisquam temporibus quam nobis voluptatem,
						reiciendis distinctio deserunt vitae! Maxime provident, distinctio
						animi commodi nemo, eveniet fugit porro quos nesciunt quidem a,
						corporis nisi dolorum minus sit eaque error sequi ullam. Quidem ut
						fugiat, praesentium velit aliquam!</p>
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
	
	const uploadImageButton = document.getElementById("uploadImageButton");
    const imageFileInput = document.getElementById("imageFile");
    const imageUrlInput = document.getElementById("imageUrl");
    uploadImageButton.addEventListener("click", () => {
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
	</script>
</body>
</html>