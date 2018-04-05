<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>


<c:set var="ownerId" value="${sessionScope.auth.user[0].ACCOUNT_ID }" />
<div class=" container-fluid" style="margin-left: 23px;">
	<!-- 여기서 검색어 리스트 뿌려줄 것입니다. -->
	<div>
		<h4 style="color:#F2BF2B">실시간 검색어 순위</h4>
	</div>
	<div >
		<label class="radio-inline"><input
			style="vertical-align: middle; margin-top: 0; position: relative;"
			type="radio" name="term" value="1d" class=" recent-keyword">1 Day</label> 
			<label class="radio-inline "><input
			style="vertical-align: middle; margin-top: 0; position: relative;"
			type="radio" name="term"  value="1h"  class=" recent-keyword">1 Hour</label> 
			<label class="radio-inline"><input
			style="vertical-align: middle; margin-top: 0; position: relative;"
			type="radio" name="term"  value="30m"  class=" recent-keyword">30 Minutes</label> 
			<label
			class="radio-inline" ><input
			style="vertical-align: middle; margin-top: 0; position: relative;"
			type="radio" name="term"  value="10m"  class=" recent-keyword">10 Minutes</label>
	</div>
	<div>
	
	 <ul class="list-inline keyword-ranking">
  <li class="list-inline-item"><button type="button" class="btn" style="border-color:  #f2bf2b; color:#fff" >1</button></li>
  <li class="list-inline-item"><button type="button" class="btn">2</button></li>
  <li class="list-inline-item"><button type="button" class="btn">3</button></li>
</ul>
	</div>

</div>
<div class="fh5co-box">
	<form action="/foodie/search.do" method="post">
		<div class="form-group">
			<!-- orderType 추가해야함 -->
			<input name="keywords" type="text" class="form-control"
				placeholder="검색하고 싶은 키워드를 입력하세요 여러가지 키워드는 띄어쓰기로 구분해주세요"
				id="searchInput" style="width: 95%; margin: auto;">
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

<!-- <div class="divs">
	<input type="text" class="tb" placeholder="검색"
		style="font-size: 12pt; width: 400px;" />
</div> -->
<br />

<div class="container-fluid">

	<div class="row fh5co-post-entry">
		<c:set var="postList_vrr" value="${requestScope.postList}" />


		<c:forEach var="obj" items="${postList_vrr}">

			<article
				class="col-lg-3 col-md-3 col-sm-3 col-xs-6 col-xxs-12 animate-box postedarticles">
				<figure>
					<a href="#"><img src="/upload_img/${obj.MAIN_IMG}" alt="Image"
						class="img-responsive"></a>
					<ul class="fh5co-social">
						<li><i style="font-size: 18pt" id="${obj.POST_ID }"
							class="icon-bookmark bookmarkicon"></i></li>
						<li><i style="font-size: 18pt" id="${obj.WRITER_ID}"
							class="icon-heart hearticon"></i></li>

					</ul>
				</figure>
				<!-- 여기 아이디 넣음(Email? or nickname)  -->
				<span class="fh5co-meta" style="color: #F2BF2B">${obj.NAME }</span>
				<h2 class="fh5co-article-title">
					<a href="/foodie/post.do?pid=${obj.POST_ID}">${obj.TITLE}</a>
				</h2>
				<span class="fh5co-meta fh5co-date">${obj.POST_DATE}</span>
			</article>
		</c:forEach>


		<div
			class="clearfix visible-lg-block visible-md-block visible-sm-block visible-xs-block"></div>
		<div class="clearfix visible-xs-block"></div>
	</div>
</div>
<div style="position:fixed; bottom: 30px; right: 30px; background-color: white; border: 3px solid #F2BF2B;">
<a href="#"><i class="icon-arrow-with-circle-up" style="width:55; height:55; font-size:30px; "></i></a>
</div>
<script>
	$(".bookmarkicon").click(function() {
		var bookmark = $(this);
		if ($(this).hasClass(""))

			console.log($("ownerId"));
		console.log($(this).attr("id"))
		$.ajax("/social/addBookmarkRDB.do", {
			"method" : "post",
			"async" : true,
			"data" : {
				"postId" : $(this).attr("id")
			}

		}).done(function(obj) {

			if (obj == "adddone") {
				bookmark.css("color", "#48C9B0");
				console.log(obj);
			} else if (obj == "removedone") {
				bookmark.css("color", "black");
				console.log(obj);

			} else if (obj == "notlogedon") {
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
			if (obj == "adddone") {
				for (var h = 0; h < hearticon.length; h++) {
					//console.log(hearts.eq(h).attr("id"));

					if (targetId == hearticon.eq(h).attr("id")) {
						console.log("Match Found");
						hearticon.eq(h).css("color", "#E74C3C");

					}

				}
			} else if (obj == "removedone") {
				for (var h = 0; h < hearticon.length; h++) {
					//console.log(hearts.eq(h).attr("id"));

					if (targetId == hearticon.eq(h).attr("id")) {
						console.log("Match Found");
						hearticon.eq(h).css("color", "black");

					}

				}

			} else if (obj == "notlogedon") {
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
			for (var h = 0; h < bookmarkicon.length; h++) {
				//console.log(hearts.eq(h).attr("id"));
				for (var k = 0; k < bookmarks.length - 1; k++) {
					if (bookmarks[k].POST_ID == bookmarkicon.eq(h).attr("id")) {
						console.log("Match Found");
						console.log(bookmarks[k].USER_ID);
						bookmarkicon.eq(h).css("color", "#48C9B0");

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
			for (var h = 0; h < hearticon.length; h++) {
				//console.log(hearts.eq(h).attr("id"));
				for (var k = 0; k < hearts.length - 1; k++) {
					if (hearts[k].TARGET_ID == hearticon.eq(h).attr("id")) {
						console.log("Match Found");
						hearticon.eq(h).css("color", "#E74C3C");

					}
				}
			}
		})

	})
	var d =  $(function(){
		var term = $("recent-keyword").val();
		if(term==null){
			term="1d";
		}
		
		$.ajax("/foodie/keywordlist.do",{
			"method" : "post",
			"async" : true,
			"data":{
				"term":term
				
			}
		}).done(function(obj){
			console.log(obj);
			var text ="";
			
			
			for(var cnt =0;cnt < obj.length;cnt++){
				text += "<li class=\"list-inline-item\"><button type=\"button\" class=\"btn btn-primary keyword-ranking-item\" style=\"border-color:  #f2bf2b\">"+obj[cnt]._id+"</button></li>";
			}
			$(".keyword-ranking").html(text);
$(".keyword-ranking-item").click(function(){
				
	var item = $(this).html();
	console.log(item);
		$("#searchInput").val($("#searchInput").val()+item+" ");		 		
			})
		})
		
	})
	$(".recent-keyword").click(function(){
		var term =$(this).val();
		
		
		$.ajax("/foodie/keywordlist.do",{
			"method" : "post",
			"async" : true,
			"data":{
				"term":term
				
			}
		}).done(function(obj){
			console.log(obj);
			var text ="";
			if(obj.length>0){
				for(var cnt =0;cnt < obj.length;cnt++){
					text += "<li class=\"list-inline-item\"><button type=\"button\" class=\"btn btn-primary keyword-ranking-item\" style=\"border-color:  #f2bf2b\">"+obj[cnt]._id+"</button></li>";
				}
				$(".keyword-ranking").html(text);
			}else{
				text += "<li class=\"list-inline-item\"><button type=\"button\" class=\"btn btn-primary keyword-ranking-item\" style=\"border-color:  #f2bf2b\">검색결과가 없네요 ㅠㅠ</button></li>";
				$(".keyword-ranking").html(text);

			};
			
			
	$(".keyword-ranking-item").click(function(){
		
		var item = $(this).html();
		console.log(item);
 		$("#searchInput").val($("#searchInput").val()+item+" ");
 		
	})
			
			
			
		})
		
		
	});
	
	 
	
	//여기서 비교할 bookmarklist 가지고 와서 bookmark 비교해줄것입니다.

	//필요없는 부분
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
	
	})	  */
</script>