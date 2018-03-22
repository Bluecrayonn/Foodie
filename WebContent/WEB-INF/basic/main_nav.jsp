<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<header id="fh5co-header">
<!-- <script
  src="https://code.jquery.com/jquery-3.3.1.js"
  integrity="sha256-2Kok7MbOyxpgUVvAk/HJ2jigOSYS2auK4Pfzbm7uH60="
  crossorigin="anonymous"></script> -->
		<div class="container-fluid">
			<div class="row">
			<c:choose>
			<c:when test="${empty sessionScope.auth}">
					<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>	
					<ul class="fh5co-social">
					<a href="#" class="js-fh5co-nav-toggle" style="margin-right: 3px; color:black; size:15px;"><i class="icon-login">Login/sign up</i></a>
				</ul>					
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

	<%-- <% session.invalidate();
				response.sendRedirect("main.do"); %>
					<!-- <div class="alert alert-success">
						로그아웃 성공!
					</div> --%> 