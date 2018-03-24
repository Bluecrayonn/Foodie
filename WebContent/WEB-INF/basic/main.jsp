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
						<li><i style="font-size: 18pt "  id="${obj.POST_ID }" class="icon-bookmark bookmarkicon"></i></li>
						<li><i style="font-size: 18pt " id="${obj.WRITER_ID}" class="icon-heart hearticon"></i></li> 

					</ul>
				</figure>
				<!-- 여기 아이디 넣음(Email? or nickname)  -->
				<span class="fh5co-meta"><a href="single.html">${obj.NAME }</a></span>
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
	$(".bookmarkicon").click(function() {
		var bookmark = $(this);
		if($(this).hasClass(""))
		
		console.log($("ownerId"));
		console.log($(this).attr("id"))
		$.ajax("/social/addBookmarkRDB.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"postId" : $(this).attr("id")
			}

		}).done(function(obj) {
			
 			if(obj=="adddone"){
				bookmark.css("color","red");
				console.log(obj);
			}else if (obj =="removedone"){
				bookmark.css("color","black");
				console.log(obj);

			}else if(obj=="notlogedon"){
				window.alert("로그인을 먼저 진행해주세요 ")
			}
 			
			
		})

	})
	$(".hearticon").click(function() {
		var heart = $(this);
		var targetId = $(this).attr("id");
		
		
		console.log($(this).attr("id"))
		$.ajax("/social/addFollowRDB.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"targetId" : targetId
			}

		}).done(function(obj) {
 			var hearticon = $(".hearticon");
 			if(obj=="adddone"){
 				for(var h = 0; h< hearticon.length;h++){
 					//console.log(hearts.eq(h).attr("id"));
 					 
 	 					if(targetId==hearticon.eq(h).attr("id")){
 							console.log("Match Found");
 							hearticon.eq(h).css("color","red");
 							
 							
 							
 						}
 					 
 				}
			}else if (obj =="removedone"){
				for(var h = 0; h< hearticon.length;h++){
 					//console.log(hearts.eq(h).attr("id"));
 					 
 	 					if(targetId==hearticon.eq(h).attr("id")){
 							console.log("Match Found");
 							hearticon.eq(h).css("color","black");
 							
 							
 							
 						}
 					 
 				}

			}else if(obj=="notlogedon"){
				window.alert("로그인을 먼저 진행해주세요 ")
			}
 			
 			
			
		})

	})

	//여기서 비교할 bookmarklist 가지고 와서 bookmark 비교해줄것입니다.
	$(function() {
		$.ajax("/social/bookmarkList.do", {
			"method" : "post",
			"async" : true
		}).done(function(obj) {
			var bookmarkicon = $(".bookmarkicon");
			var bookmarks = JSON.parse(obj);
			console.log(bookmarks);
			for(var h = 0; h< bookmarkicon.length;h++){
				//console.log(hearts.eq(h).attr("id"));
				for(var k =0;k<bookmarks.length-1;k++){
 					if(bookmarks[k].POST_ID==bookmarkicon.eq(h).attr("id")){
						console.log("Match Found");
						bookmarkicon.eq(h).css("color","red");
						
						
						
					}
				}
			}
		})

	})
			//여기서 비교할 following 가지고 와서 following 비교해줄것입니다.

	$(function() {
		$.ajax("/social/followingList.do", {
			"method" : "post",
			"async" : true
		}).done(function(obj) {
			var hearticon = $(".hearticon");
			var hearts = JSON.parse(obj);
			console.log(hearts);
			for(var h = 0; h< hearticon.length;h++){
				//console.log(hearts.eq(h).attr("id"));
				for(var k =0;k<hearts.length-1;k++){
 					if(hearts[k].TARGET_ID==hearticon.eq(h).attr("id")){
						console.log("Match Found");
						hearticon.eq(h).css("color","red");
						
						
						
					}
				}
			}
		})

	})
		//여기서 비교할 bookmarklist 가지고 와서 bookmark 비교해줄것입니다.


	 $("#searchInput").change(function(){
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
		
	})	 
</script>