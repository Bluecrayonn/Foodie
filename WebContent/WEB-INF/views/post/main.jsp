<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="ismine" value="${sessionScope.auth.user[0].ACCOUNT_ID == post.WRITER_ID}" />

<a href="#" class="fh5co-post-prev"><span><i
			class="icon-chevron-left"></i> Prev</span></a>
	<a href="#" class="fh5co-post-next"><span>Next <i
			class="icon-chevron-right"></i></span></a>
	<!-- END #fh5co-header -->
	<div class="container-fluid">
		<div class="row fh5co-post-entry single-entry">
			<article
				class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
				<figure class="animate-box">
					<img src="/upload_img/${post.MAIN_IMG}" alt="Image"
						class="img-responsive">
				</figure>
				<span class="fh5co-meta animate-box"><a href="single.html">${post.TITLE}</a></span>
				<h2 class="fh5co-article-title animate-box" >
					<a href=#>${post.TITLE}</a>
				</h2>
				<span class="fh5co-meta fh5co-date animate-box">${post.POST_DATE}</span>
				<div class="col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-left content-article">
					<div class="row">
						<div class="col-lg-8 cp-r animate-box">
							<h4>재료</h4>
							<c:forEach var="item" items="${ingredient}">
								<a href="#">${item.name} ${item.qty}${item.unit}</a><br/>
							</c:forEach>
						</div>
						<div class="col-lg-4 animate-box">
							<div class="fh5co-highlight right">재료를 선택하여 주십시오.</div>
						</div>
					</div>
					<c:if test="${sessionScope.auth.ACCOUNT_ID == post.WRITER_ID}">
						<div class="animate-box"><a href="/foodie/write/modifypost.do?pid=${post.POST_ID}">mod available</a></div>
					</c:if>
					<div class="row rp-b">
						<div class="col-md-12 animate-box">${post.CONTENT}</div>
					</div>
				</div>
			</article>
		</div>
	</div>