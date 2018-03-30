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
					<li><a href="write.do" style="margin-right: 3px; color:black; size:15px;"><i class="icon-pencil">레시피 작성</i></a></li>
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
			<a href="/foodie/main.do"><img src="/template/images/logo.png" style="width: 223px; height: 184px;"></a><br/>
				</div>
			</div>
		</div>
	</header>