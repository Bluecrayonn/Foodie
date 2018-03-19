<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title>Foodie-profile</title>
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