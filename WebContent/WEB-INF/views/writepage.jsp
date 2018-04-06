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

<!-- Place /images/favicon.ico and apple-touch-icon.png in the root directory -->
<link rel="shortcut icon" href="/images/favicon.png">
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
<link href='/css/writepage.css'	rel='stylesheet' type='text/css'>
<script src="/js/functions.js?<%=(int)(Math.random()*10)%>"></script>
<script src="/js/bootstrap-confirmation.js"></script>
<script src="/js/functions.js"></script>

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
	<!-- include libraries(jQuery, bootstrap) -->
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<!-- include summernote css/js -->
	<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.css" rel="stylesheet">
	<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.9/summernote.js"></script>

<html>
<head>
<title>Foodie-write</title>
<style type="text/css">
h1,h2,h3,h4,h5,h6,a{
	font-family: '나눔고딕'
}
</style>
</head>
<body>
	<div>
	<tiles:insertAttribute name = "nav" />
	<tiles:insertAttribute name = "sidebar" />
	<tiles:insertAttribute name = "body" />
	<tiles:insertAttribute name = "footer" />
	</div>
</body>
</html>