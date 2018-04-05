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
					<li><a href="/foodie/writepost.do" class="js-fh5co-nav-toggle" style="margin-right: 3px; color:black; size:15px;"><i class="icon-pencil">레시피 작성</i></a></li>
					<li><a href="#" class="js-fh5co-nav-toggle" style="margin-right: 3px; color:black; size:15px;"><i class="icon-login">Login/sign up</i></a></li>
				</ul>					
				</c:when>
				<c:when test="${!empty sessionScope.auth}">
				
				<a href="#" class="js-fh5co-nav-toggle fh5co-nav-toggle"><i></i></a>
				<ul class="fh5co-social">
					<li><a href="/foodie/write/writepost.do" style="margin-right: 3px; color:black; size:15px;"><i class="icon-pencil">레시피 작성</i></a></li>
					<li><a href="#" class="dropdown-toggle" data-toggle="dropdown" style="margin-right: 3px; color:black; size:15px;"> <i class="icon-bell3"></i>Notice</a>
                        <span class="caret"></span>
                        <span class="sr-only"></span>
                      <ul class="dropdown-menu text-left" role="menu">
                        <li><span class="pull-right"></span> <p style="color:#ffffff;"> 알림 목록 </p> </li>
                    </ul>
                    </li>
					</ul>
				</c:when>
				</c:choose>
				<div class="col-lg-12 col-md-12 text-center">
					<a href="/foodie/main.do"><img src="/images/logo.png" style="width: 223px; height: 184px;"></a><br/>
				</div>
			</div>
		</div>
	</header>

	<%-- <% session.invalidate();
				response.sendRedirect("main.do"); %>
					<!-- <div class="alert alert-success">
						로그아웃 성공!
					</div> --%> 