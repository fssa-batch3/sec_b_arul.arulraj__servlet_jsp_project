<%@page import="in.fssa.technolibrary.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register or login</title>
<style>
	
.overlay {
	position: fixed;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
	background: rgba(0, 0, 0, 0.7);
}
.overlay:target {
	visibility: visible;
	opacity: 1;
}
.popup {
	margin: 70px auto;
	padding: 20px;
	background: #fff;
	border-radius: 5px;
	width: 30%;
	position: relative;
	left: 500px;
	top: 100px;
	transition: all 5s ease-in-out;
}
.popup h2 {
	margin-top: 0;
	color: #333;
	font-family: Tahoma, Arial, sans-serif;
}
.popup .close {
	position: absolute;
	top: 20px;
	right: 30px;
	transition: all 200ms;
	font-size: 30px;
	font-weight: bold;
	text-decoration: none;
	color: #333;
}
.popup .close:hover {
	color: #06D85F;
}
.popup .content {
	max-height: 30%;
	overflow: auto;
}
#alert {
	padding: 0.4rem 2rem 0.2rem 2rem;
	margin: 1rem 0rem 0rem 8rem;
	background-color: black;
	color: white;
	border: none;
	border-radius: 10px;
}@media screen and (max-width: 700px) {
	.box {
		width: 70%;
	}
	.popup {
		width: 70%;
	}
}
a{
text-decoration:none;
color:black;
}
.password-toggle-1 {
    position: absolute;
    top: 48%;
    transform: translateY(-50%);
    cursor: pointer;
    left: 84%;
}
.password-toggle-2 {
    position: absolute;
    top: 57%;
    transform: translateY(-50%);
    cursor: pointer;
    left: 84%;
}
.password-toggle-3 {
    position: absolute;
    top: 70%;
    transform: translateY(-50%);
    cursor: pointer;
    left: 84%;
}
.fa-eye {
	color: #3498DB;
}


</style>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/CSS/login.css">
</head>
<body>
	
	<%
	String errorMsg = (String) request.getAttribute("error");
	String email = (String) request.getAttribute("email");
	String password = (String) request.getAttribute("password");
	%>
	<%
	if (errorMsg != null && !errorMsg.isEmpty()) {
	%>
	<div id="popup1" class="overlay">
		<div class="popup">
			<h2>Alert !</h2>
			<a class="close" href="#">&times;</a>
			<div class="content">
				<%=errorMsg%>
			</div>
			<button id="alert" onclick="closeAlert()" type="button">Ok</button>
		</div>
	</div>
	<%
	}
	%>
	<jsp:include page="header.jsp"></jsp:include>
				<%
				User user = (User) request.getAttribute("userDetail");
				%>
	<div class="wrapper">
		<div class="form-container sign-up">
			<form action="<%=request.getContextPath()%>/user/create"
				method="post">
				<h2>sign up</h2>
				<div class="form-group">
					<input name="username" id="username" type="text" pattern="[a-zA-Z]+" title="Only contain Alphabets"
							value="<%=(user != null) ? user.getName() : ""%>"
							 required>
					<label for="username">username</label> <i class="fas fa-user"></i>
				</div>
				<div class="form-group">
					<input name="useremail" id="useremail" type="email" value="<%=(user != null) ? user.getEmail() : ""%>"
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed." required>
					<label for="useremail">email</label> <i class="fas fa-at"></i>
				</div>
				<div class="form-group">
					<input name="userphone" id="userphone" type="text" pattern="[6-9][0-9]{9}" type="tel" name="phone_number"
							value="<%=(user != null) ? user.getPhoneNumber() : ""%>"
							title="It should be a 10-digit number starting with a digit between 6 and 9." maxlength="10" required>
					<label for="userphone">phone number</label> <i class="fas fa-phone"></i>
				</div>
				<div class="form-group">
					<input name="userpassword" id="user_password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
						required> <label for="user_password"> New password</label> <i
						class="fas fa-lock" ></i>
				</div>
				<div class="password-toggle-2">
							<i class="fas fa-eye" id="togglePassword2" style="font-size: 15px;"></i>
						</div>
				<div class="form-group">
					<input name="usercpassword" id="confirm_password" type="password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
						required> <label for="confirm_password">confirm
						password</label> <i class="fas fa-lock"></i>
				</div>
				<div class="password-toggle-3">
							<i class="fas fa-eye" id="togglePassword3" style="font-size: 15px;"></i>
						</div>
					
				<button type="submit" class="btn" style="cursor: pointer;" onclick="return checkPassword()">sign up</button>
				<div class="link">
					<p>
						You already have an account?<a class="signin-link" style="cursor: pointer;">
							sign in</a>
					</p>
				</div>
			</form>
		</div>
		
		<div class="form-container sign-in">
			<form action="<%=request.getContextPath()%>/user/login" method="post">
				<h2>login</h2>
				<div class="form-group">
					<input name="email" id="mail" type="email" value="<%=(email != null) ? email : ""%>"
							pattern="^[a-zA-Z0-9]+([a-zA-Z0-9_+\-\. ]*[a-zA-Z0-9]+)?@[a-zA-Z0-9]+([a-zA-Z0-9\-\.]*[a-zA-Z0-9])?\.[a-zA-Z]{2,}$"
							title="Must contain @ and only lower case is allowed." required> <i
						class="fas fa-user"></i> <label for="email">Email</label>
				</div>

				<div class="form-group">
					<input name="password" type="password" id="user_password1" value="<%=(password != null) ? password : ""%>"
							title="Must contain at least one  number and one uppercase and lowercase letter, and at least 8 or more characters"
							pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"
							required> <i
						class="fas fa-lock"></i> <label for="">Password</label>
						
				</div>
				<div class="password-toggle-1">
							<i class="fas fa-eye" id="togglePassword1" style="font-size: 15px;"></i>
						</div>
				<div class="forgot-pass">
					<a href="#">forgot password?</a>
				</div>
				<button type="submit" class="btn">login</button>
				<div class="link">
					<p>
						Don't have an account?<a class="signup-link" style="cursor: pointer;"> sign up</a>
					</p>
				</div>
			</form>
		</div>

	</div>
	<script src="https://kit.fontawesome.com/9e5ba2e3f5.js"
		crossorigin="anonymous"></script>
		<script src="<%=request.getContextPath()%>/assets/JS/errordiv.js"></script>
	<script>
	    const wrapper = document.querySelector('.wrapper');
	    const signUpLink = document.querySelector('.link .signin-link');
	    const signInLink = document.querySelector('.link .signup-link');
	
	    signUpLink.addEventListener('click', () => {
	        wrapper.classList.remove('animated-signin');
	        wrapper.classList.add('animated-signup');
	    });
	
	    signInLink.addEventListener('click', () => {
	        wrapper.classList.remove('animated-signup');
	        wrapper.classList.add('animated-signin');
	    });
	</script>
	<script>
	function checkPassword() {
	    let user_password = document.getElementById("user_password").value;
	    let confirm_password = document.getElementById("confirm_password").value;
	    
	    if (user_password !== confirm_password) {
	        alert("Password doesn't match. Please re-enter the password");
	        document.getElementById("confirm_password").value = "";
	        return false;
	    }
	    
	    return true;
	}
	
	const passwordInput1 = document.getElementById('user_password1');
	const togglePasswordButton1 = document.getElementById('togglePassword1');
	const eyeIcon1 = document.getElementById('togglePassword1');

	togglePasswordButton1.addEventListener('click', () => {
	togglePasswordVisibility(passwordInput1, eyeIcon1);
	});
	
	function togglePasswordVisibility(inputField, eyeIcon) {
	const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
	inputField.setAttribute('type', type);
	eyeIcon.classList.toggle('fa-eye');
	eyeIcon.classList.toggle('fa-eye-slash');
	}
	
	const passwordInput2 = document.getElementById('user_password');
	const togglePasswordButton2 = document.getElementById('togglePassword2'); 
	const eyeIcon2 = document.getElementById('togglePassword2'); 

	const passwordInput3 = document.getElementById('confirm_password');
	const togglePasswordButton3 = document.getElementById('togglePassword3'); 
	const eyeIcon3 = document.getElementById('togglePassword3'); 

	togglePasswordButton2.addEventListener('click', () => {
	    togglePasswordVisibility(passwordInput2, eyeIcon2);
	});

	togglePasswordButton3.addEventListener('click', () => {
	    togglePasswordVisibility(passwordInput3, eyeIcon3);
	});

	function togglePasswordVisibility(inputField, eyeIcon) {
	    const type = inputField.getAttribute('type') === 'password' ? 'text' : 'password';
	    inputField.setAttribute('type', type);
	    eyeIcon.classList.toggle('fa-eye');
	    eyeIcon.classList.toggle('fa-eye-slash');
	}
	
	</script>
</body>

</html>