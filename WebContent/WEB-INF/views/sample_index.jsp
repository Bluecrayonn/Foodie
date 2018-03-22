<%@ page language="java" contentType="text/html; charset=UTF-8"
 	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>

<title>Insert title here</title>
</head>
<body>
	<div>
		<tiles:insertAttribute name="nav" />
	</div>
	<div>
		<tiles:insertAttribute name="body" />
	</div>
	<div>
		<tiles:insertAttribute name="content" />
	</div>
	<div>
		<tiles:insertAttribute name="footer" />
	</div>
</body>
</html>