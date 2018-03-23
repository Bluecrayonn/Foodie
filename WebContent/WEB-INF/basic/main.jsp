<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="ownerId" value="${sessionScope.auth.user[0].ACCOUNT_ID }" />
<div class="fh5co-box">
	<h3 class="heading">Search</h3>
	<form action="/foodie/search.do" method="post">
		<div class="form-group">
			<!-- orderType 추가해야함 -->
			<input name="keywords" type="text" class="form-control"
				placeholder="검색하고 싶은 키워드를 입력하세요 여러가지 키워드는 띄어쓰기로 구분해주세요"
				id="searchInput">
		</div>
	</form>
</div>

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

<div class="divs">
	<input type="text" class="tb" placeholder="검색"
		style="font-size: 12pt; width: 400px;" />
</div>
<br />

<div class="container-fluid">

	<div class="row fh5co-post-entry">
		<c:set var="postList_vrr" value="${requestScope.postList}" />


		<c:forEach var="obj" items="${postList_vrr}">

			<article 
				class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box postedarticles">
				<figure>
					<a href="single.html"><img
						src="/template/images/${obj.MAIN_IMG}" alt="Image"
						class="img-responsive"></a>
					<ul class="fh5co-social">
						<li><i  id="${obj.POST_ID }" class="icon-bookmark bookmarked">${obj.BOOKMARK_COUNT}</i></li>
						<li><i name="" ${obj.WRITER_ID} class="icon-heart"></i></li>

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
	$(".icon-bookmark").click(function() {
		console.log($("ownerId"));
		console.log($(this).attr("id"))
		$.ajax("/social/addBookmarkRDB.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"postId" : $(this).attr("id")
			}

		}).done(function() {
			$.ajax("/social/bookmarkList.do", {
				"method" : "post",
				"async" : true,
				"data" : {

				}
			})
		}).done(function(obj) {
			console.log(obj);
		})

	})

	//여기서 비교할 bookmarklist 가지고 와서 bookmark 비교해줄것입니다.
	$(function() {
		$.ajax("/social/bookmarkList.do", {
			"method" : "post",
			"async" : true
		}).done(function(obj) {
			var hearts = $(".bookmarkicon");
			var bookmarks = JSON.parse(obj);
			
			for(var h = 0; h< hearts.length;h++){
				//console.log(hearts.eq(h).attr("id"));
				for(var k =0;k<bookmarks.length-1;k++){
 					if(bookmarks[k].POST_ID==hearts.eq(h).attr("id")){
						console.log("Match Found");
						hearts.eq(h).attr("class").val("icon-bookmark icon-bookmarked");
					}
				}
			}
			
			
			
  
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