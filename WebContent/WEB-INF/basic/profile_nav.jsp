<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="fh5co-header">
		<div class="container-fluid">
			<div class="row">
			<c:choose>
			<c:when test="${empty sessionScope.auth}">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
					
				</c:when>
				<c:when test="${!empty sessionScope.auth}">
				
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
				<ul class="fh5co-social">
					<li><a href="#"><i class="icon-bell3"></i>Notice</a></li>
				</ul>
				</c:when>
				
				</c:choose>
				<div class="col-lg-12 col-md-12 text-center">
					<h1><a href="/foodie/main.do">Foodie</a></h1><br/>
				</div>
			</div>
		</div>
	</header>