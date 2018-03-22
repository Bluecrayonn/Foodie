<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.tb {
	left: 0%;
	margin-left: 430px;
}

input {
	vertical-align: middle;
}

divs {
	width: 700px;
}

</style>

<c:set var="ownerId" value="${sessionScope.auth.user[0].ACCOUNT_ID }" />
<div class="fh5co-box">
	<form action="/foodie/search.do" method="post">
		<div class="form-group">
			<!-- orderType 추가해야함 -->
			<input name="keywords" type="text" class="form-control"
				placeholder="검색하고 싶은 키워드를 입력하세요 여러가지 키워드는 띄어쓰기로 구분해주세요"
				id="searchInput" style="width: 800px; margin: auto;">
		</div>
	</form>
</div><br/>

<div class="container-fluid">
	<div class="row fh5co-post-entry">
		<c:set var="postList_vrr" value="${requestScope.postList}" />
		<c:forEach var="obj" items="${postList_vrr}">
			<article id="${obj.POST_ID }"
				class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box postedArticles">
				<figure>
					<a href="single.html"><img
						src="/template/images/${obj.MAIN_IMG}" alt="Image"
						class="img-responsive"></a>
					<ul class="fh5co-social">
						<li><i class="icon-bookmark">${obj.BOOKMARK_COUNT}</i></li>
						<li><i class="icon-heart"></i></li>
					</ul>
				</figure>
				<span class="fh5co-meta"><a href="single.html">Food &amp;
						Drink</a></span>
				<h2 class="fh5co-article-title">
					<a href="/foodie/detail.do">${obj.TITLE}</a>
				</h2>
				<span class="fh5co-meta fh5co-date">${obj.POST_DATE}</span>
			</article>
		</c:forEach>
		<div
			class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
		<div class="clearfix visible-xs-block"></div>
	</div>
</div>

<script>
	$(".icon-bookmark").click(function(){
		console.log($("ownerId"))
		 $.ajax("/social/bookmarkList.do",{
			"method" : "post",
			"async" : true,
			
			
		}).done(function(obj){
			console.log(obj);
			$(".postedArticles").each(function(index,element){
				 console.log($(element).attr("id"));
				 
			 })
		}) 
		 
	})

	/* $("#searchInput").change(function(){
		$.ajax("/foodie/search.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"keywords" : $("#searchInput").val(),
				"orderType" : "",
			}
		}).done(function(obj){
			$(postList_vrr)=obj;
		})
		
	})	 */
	</script>