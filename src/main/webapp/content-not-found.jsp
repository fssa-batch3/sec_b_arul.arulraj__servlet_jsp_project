<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>500 Error</title>
    <style>
    @charset "ISO-8859-1";
@import url("https://fonts.googleapis.com/css?family=Fira+Code&display=swap");

* {
    margin: 0;
    padding: 0;
    font-family: "Fira Code", monospace;
}

body {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    height: 100vh;
    background-color: #ecf0f1;
}

img {
    width: 256px;
    height: 225px;
}

.container {
    text-align: center;
    margin: auto;
    padding: 4em;

    }

    p {
        margin-top: 1rem;
    }

    p.info {
        margin-top: 4em;
        font-size: 12px;

        
    }
    h1 {
        margin-top: 1rem;
        font-size: 35px;
        text-align: center;

        
    }
    span {
            font-size: 60px;
        }
a {
            text-decoration: none;
            color: rgb(84, 84, 206);
        }
    </style>
</head>

<body>
    <div class="container">
        <img src="https://iili.io/JJufepI.png" />

        <h1>
            <span>500</span> <br />
            Internal server error
        </h1>
        <p>We are currently trying to fix the problem.</p>
        <p class="info">
            Back to
            <a href="<%=request.getContextPath()%>/index" target="_blank">Home</a>
        </p>
    </div>
</body>
</html>