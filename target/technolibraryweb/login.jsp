<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Register or login</title>

<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');

* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins', sans-serif;
}

:root {
    --mainColor: #89216b;
    --whiteColor: #ffffff;
    --titleColor: #555555;
    --labelColor: #333333;
}

html {
    font-size: 62.5%;
    scroll-behavior: smooth;
}

body {
    background: white;
    font-weight: 400;
    min-height: 100vh;
    display: grid;
    place-content: center;
    overflow: hidden;
}

.wrapper {
    position: relative;
    width: 35rem;
    height: 50rem;
}

@media(min-width:540px) {
    .wrapper {
        width: 40rem;
    }
}

.wrapper .form-container {
    position: absolute;
    top: 0;
    left: 0;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 100%;
    height: 100%;
    background-color: var(--whiteColor);
    border-radius: .5rem;
    box-shadow: 0 0 1rem 0 rgba(0, 0, 0, 0.2);
}

.wrapper .form-container form h2 {
    font-size: 3rem;
    text-align: center;
    text-transform: capitalize;
    color: var(--titleColor);
}

.wrapper .form-container form .form-group {
    position: relative;
    width: 32rem;
    margin: 3rem 0;
}

.wrapper .form-container form .form-group i,
.wrapper .form-container form .form-group label {
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    font-size: 1.6rem;
    text-transform: capitalize;
    color: var(--labelColor);
    padding: 0 .5rem;
    pointer-events: none;
    transition: all .5s ease;
}

.wrapper .form-container form .form-group i {
    left: .5rem;
}

.wrapper .form-container form .form-group label {
    left: 2.5rem
}

.wrapper .form-container form .form-group input {
    width: 100%;
    height: 4rem;
    padding: 0 1rem;
    border-radius: .5rem;
    border: none;
    outline: none;
    border: .1rem solid var(--labelColor);
    font-size: 1.6rem;
    color: var(--labelColor);
    background: transparent;
}

form .form-group input:focus~label,
form .form-group input:valid~label,
form .form-group input:focus~i,
form .form-group input:valid~i {
    top: 0 !important;
    font-size: 1.2rem !important;
    background-color: var(--whiteColor);
}

.wrapper .form-container form .forgot-pass {
    margin: -1.5rem 0 1.5rem;
}

.wrapper .form-container form .forgot-pass a {
    color: var(--labelColor);
    text-decoration: none;
    font-size: 1.4rem;
    text-transform: capitalize;
    transform: all .5s ease;
}

.wrapper .form-container form .forgot-pass a:hover {
    color: var(--mainColor);
}

.wrapper .form-container form .btn {
    background: linear-gradient(to right, #da4453, var(--mainColor));
    color: var(--whiteColor);
    text-transform: capitalize;
    width: 100%;
    height: 4rem;
    font-size: 1.6rem;
    font-weight: 500;
    outline: none;
    border: none;
    border-radius: .5rem;
    cursor: pointer;
    box-shadow: 0 .2rem 1rem rgba(0, 0, 0, 0.4);
}

.wrapper .form-container form .link {
    text-align: center;
    font-size: 1.4rem;
    color: var(--labelColor);
    margin: 2.5rem 0;
}

.wrapper .form-container form .link a {
    text-transform: capitalize;
    color: var(--mainColor);
    text-decoration: none;
    font-weight: 600;
    transition: all .5s ease;
}

.wrapper .form-container form .link a:hover {
    color: #da4453;
}

.wrapper .sign-up {
    transform: rotate(7deg);
}

.wrapper.animated-signin .form-container.sign-in {
    animation: signin-flip 1s ease-in-out forwards;
}

@keyframes signin-flip {
    0% {
        transform: translateX(0);
    }

    50% {
        transform: translateX(-50rem) scale(1.1);
    }

    100% {
        transform: translateX(0) rotate(7deg) scale(1);
    }
}

.wrapper.animated-signin .form-container.sign-up {
    animation: rotatecard .7s ease-in-out forwards;
    animation-delay: .3s;
}

@keyframes rotatecard {
    0% {
        transform: rotate(7deg);
    }

    100% {
        transform: rotate(0);
        z-index: 1;
    }
}

.wrapper.animated-signup .form-container.sign-up {
    animation: signup-flip 1s ease-in-out forwards;
}

@keyframes signup-flip {
    0% {
        transform: translateX(0);
        z-index: 1;
    }

    50% {
        transform: translateX(50rem) scale(1.1);
    }

    100% {
        transform: translateX(0) rotate(7deg) scale(1);
    }
}

.wrapper.animated-signup .form-container.sign-in {
    transform: rotate(7deg);
    animation: rotatecard .7s ease-in-out forwards;
    animation-delay: .3s;
}

@keyframes rotatecard {
    0% {
        transform: rotate(7deg);
    }

    100% {
        transform: rotate(0);
        z-index: 1;
    }
}
</style>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<%
	String errorMsg = (String) request.getAttribute("error");
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
	<div class="wrapper">
		<div class="form-container sign-up">
			<form action="<%=request.getContextPath()%>/user/create"
				method="post">
				<h2>sign up</h2>
				<div class="form-group">
					<input name="username" id="username" type="text" required>
					<label for="username">username</label> <i class="fas fa-user"></i>
				</div>
				<div class="form-group">
					<input name="useremail" id="useremail" type="email" required>
					<label for="useremail">email</label> <i class="fas fa-at"></i>
				</div>
				<div class="form-group">
					<input name="userphone" id="userphone" type="text" required>
					<label for="userphone">phone number</label> <i class="fas fa-phone"></i>
				</div>
				<div class="form-group">
					<input name="userpassword" id="user_password" type="password"
						required> <label for="user_password">password</label> <i
						class="fas fa-lock"></i>
				</div>
				<div class="form-group">
					<input name="usercpassword" id="confirm_password" type="password"
						required> <label for="confirm_password">confirm
						password</label> <i class="fas fa-lock"></i>
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
					<input name="email" id="mail" type="text" required> <i
						class="fas fa-user"></i> <label for="email">Email</label>
				</div>

				<div class="form-group">
					<input name="password" type="password" required> <i
						class="fas fa-lock"></i> <label for="">Password</label>
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
	</script>
</body>

</html>