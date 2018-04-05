<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="Free HTML5 Template by FREEHTML5.CO" />
<meta name="keywords"
	content="free html5, free template, free bootstrap, html5, css3, mobile first, responsive" />
<meta name="author" content="FREEHTML5.CO" />


<!-- Place favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="favicon.png">
<!-- Google Fonts -->
<link href='https://fonts.googleapis.com/css?family=Nanum+Gothic'
	rel='stylesheet' type='text/css'>
<!-- Animate -->
<link rel="stylesheet" href="/css/animate.css">
<!-- Icomoon -->
<link rel="stylesheet" href="/css/icomoon.css">
<!-- Bootstrap  -->
<link rel="stylesheet" href="/css/bootstrap.css">

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/notice.css">

<!-- jQuery -->
<script src="/js/jquery-3.3.1.min.js"></script>
<!-- jQuery Easing -->
<script src="/js/jquery.easing.1.3.js"></script>
<!-- Bootstrap -->
<script src="/js/bootstrap.min.js"></script>
<!-- Waypoints -->
<script src="/js/jquery.waypoints.min.js"></script>
<!-- Main JS -->
<script src="/js/main.js"></script>
<!-- Modernizr JS -->
<script src="/js/modernizr-2.6.2.min.js"></script>
<!-- FOR IE9 below -->
<!--[if lt IE 9]>
	<script src="js/respond.min.js"></script>
	<![endif]-->
<style type="text/css">
h1,h2,h3,h4,h5,h6,a{
	font-family: '나눔고딕'
}
.center{
		margin: auto;
		text-align: center;
	}
</style>

<html>
<head>
<title>Foodie-Error</title>
<header id="fh5co-header">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-12 col-md-12 text-center">
					<h1><a href="/foodie/main.do">Foodie</a></h1>
				</div>
			</div>
		</div>
	</header>
</head>
<body>
<div class="center">
<c:choose>
  <c:when test="${requestScope['javax.servlet.error.status_code'] == 404}">
    <p><strong>404</strong> Page Not Found!</p>
    <p>You are lost the way Foodie.</p>
    <button class="btn" style="center;" onclick="location='/foodie/main.do'">홈으로</button>
  </c:when>
  <c:when test="${requestScope['javax.servlet.error.status_code'] == 500}">
    <p><strong>500</strong> That's an error!</p>
    <p>Please try again later.</p>
    <button class="btn" style="center;" onclick="location='/foodie/main.do'">홈으로</button>
  </c:when>
  </c:choose>
  </div>
  <footer id="fh5co-footer">
		<p><small>&copy; copyright 2018 <font style="color: #F2BF2B">foodie</font> All Rights Reserved</small></p>
	</footer>
</body>
</html>