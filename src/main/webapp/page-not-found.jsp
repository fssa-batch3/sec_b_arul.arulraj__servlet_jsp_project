<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>404 Error</title>
    <style>
        .page_404 {
            margin-left: 400px;
            text-align: center;
            padding: 40px 0;
            background: #fff;
            font-family: 'Arvo', serif;
        }
        .page_404 img {
            width: 100%;
        }
        .four_zero_four_bg {
            background-image: url(https://cdn.dribbble.com/users/285475/screenshots/2083086/dribbble_1.gif);
            height: 400px;
            width: 700px;
            background-position: center;
        }
        .four_zero_four_bg h1 {
            font-size: 80px;
        }
        .four_zero_four_bg h3 {
            font-size: 80px;
        }
        .link_404 {
            color: #fff !important;
            padding: 10px 20px;
            border-radius: 15px;
            background: #F67C92;
            margin: 20px 0;
            display: inline-block;
        }
        .link_404:hover {
            color: #f67c92 !important;
            padding: 10px 20px;
            background: #fff;
            border: solid 1px #f67c92;
            border-radius: 15px;
            margin: 20px 0;

        }
        a {
            text-decoration: none;
        }
        .contant_box_404 {
            margin-top: -50px;
            margin-right: 400px;
        }
    </style>
</head>
<body>
    <section class="page_404">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 ">
                    <div class="col-sm-10 col-sm-offset-1  text-center">
                        <div class="four_zero_four_bg">
                            <h1 class="text-center ">404</h1>
                        </div>
                        <div class="contant_box_404">
                            <h3 class="h2">
                                Look like you're lost
                            </h3>
                            <p>the page you are looking for not avaible!</p>
                            <a href="<%=request.getContextPath()%>/index" class="link_404">Go to Home</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</body>
</html>