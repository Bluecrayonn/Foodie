<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

	<div class="fh5co-box">
		<h3 class="heading">Search</h3>
		<form action="#">
			<div class="form-group">
				<input type="text" class="form-control" placeholder="Type a keyword">
			</div>
		</form>
	</div>

	<div class="container-fluid">
		<div class="row fh5co-post-entry">
		<c:forEach begin="1" end="5" var="cnt">
		<article
				class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box">
				<figure>
					<a href="single.html"><img src="/templet/images/pic_${cnt}.jpg"
						alt="Image" class="img-responsive"></a>
						<ul class="fh5co-social">
						<li><i class="icon-bookmark"></i></li>
						<li><i class="icon-heart"></i></li>

					</ul>
				</figure>
				<span class="fh5co-meta"><a href="single.html">Food &amp;
						Drink</a></span>
				<h2 class="fh5co-article-title">
					<a href="/foodie/detail.do">recipe ${cnt}</a>
				</h2>
				<span class="fh5co-meta fh5co-date">March 6th, 2016</span>
			</article>
		</c:forEach>
			
			
			<div
				class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
			<div class="clearfix visible-xs-block"></div>
		</div>
	</div>