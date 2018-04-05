<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<c:set var="ismine"
	value="${sessionScope.auth.ACCOUNT_ID == post.WRITER_ID}" />

<!-- END #fh5co-header -->
<div class="container-fluid">
	<div class="row fh5co-post-entry single-entry">
		<article
			class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-12 col-xs-offset-0">
			<figure class="animate-box">
				<img src="/upload_img/${post.MAIN_IMG}" alt="Image"
					class="img-responsive">
			</figure>
			!!! 수정필요<span class="fh5co-meta animate-box" style="color: #F2BF2B">${obj.NAME }</span>
			<h2 class="fh5co-article-title animate-box">
				<a href=#>${post.TITLE}</a>
			</h2>
			<span class="fh5co-meta fh5co-date animate-box">${post.POST_DATE}</span>
			<div
				class="col-lg-12 col-lg-offset-0 col-md-12 col-md-offset-0 col-sm-12 col-sm-offset-0 col-xs-12 col-xs-offset-0 text-left content-article">
				<div class="row">
					<div class="col-lg-8 cp-r animate-box" style="width: 390px; ">
						<h4>재료</h4>
						<c:forEach var="item" items="${ingredient}">
							<a href="#">${item.name} ${item.qty}${item.unit}</a>
							<br />
						</c:forEach>
					</div>
					<div class="col-lg-4 animate-box" style="width: 400px;">
						<div class="fh5co-highlight right" style="border-radius: 10px">재료를 선택하여 주십시오.</div>
					</div>
				</div>
				<c:if test="${sessionScope.auth.ACCOUNT_ID == post.WRITER_ID}">
					<div class="animate-box">
						<a href="/foodie/write/modifypost.do?pid=${post.POST_ID}">수정</a>
					</div>
				</c:if>
				<div class="row rp-b">
					<div class="col-md-12 animate-box" id="postContent">${post.CONTENT}</div>
				</div>
			</div>
		</article>

		<div class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2 text-left content-article"
			style="height: 500px;">
			<h2 style="color:#F2BF2B"> 댓글 </h2>
			<!-- 댓글 영역 -->
			<ul id="comments" style="list-style: none;"></ul>
			<!-- 더미 코멘트 -->
			<li id="dummy-row" style="list-style: none;"><span><small style="font-size:12px"></small></span></li>

		</div>
	</div>
</div>

<script>
	$(document).ready(function() {
		/*** basic main.jsp의 script와 공통부분, 어딘가로 합치자 ***/ 
		$(".bookmarkicon").click(function() {
			console.log($(this).attr("id"));
			var bookmark = $(this);
			$.ajax("/social/addBookmarkRDB.do", {
				"method" : "post",
				"async" : true,
				"data" : {
					"postId" : $(this).attr("id")
				}
			}).done(function(obj) {
				if (obj == "adddone") {
					bookmark.css("color", "#48C9B0");
				} else if (obj == "removedone") {
					bookmark.css("color", "black");
				} else if (obj == "notlogedon") {
					window.alert("로그인을 먼저 진행해주세요 ")
				}
			})
		})
		
		$(".hearticon").click(function() {
			console.log($(this).attr("id"));
			var heart = $(this);
			var targetId = $(this).attr("id");

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
						if (targetId == hearticon.eq(h).attr("id")) {
							hearticon.eq(h).css("color", "#E74C3C");

						}

					}
				} else if (obj == "removedone") {
					for (var h = 0; h < hearticon.length; h++) {
						if (targetId == hearticon.eq(h).attr("id")) {
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
				for (var h = 0; h < bookmarkicon.length; h++) {
					for (var k = 0; k < bookmarks.length - 1; k++) {
						if (bookmarks[k].POST_ID == bookmarkicon.eq(h).attr("id")) {
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
				for (var h = 0; h < hearticon.length; h++) {
					for (var k = 0; k < hearts.length - 1; k++) {
						if (hearts[k].TARGET_ID == hearticon.eq(h).attr("id")) {
							hearticon.eq(h).css("color", "#E74C3C");
						}
					}
				}
			})
		})
		
		getAllComment();
	});

	var getAllComment = function() {
		$.ajax({
            type : 'post',
            url : '/comment/get.do',
            data : 'pid=' + '${post.POST_ID}',
            dataType : 'JSON',
            success : function(rst){
            	var obj = JSON.parse(rst);
            	if (!isEmpty(obj)) {
            		var comments = obj[0].comments;
	            	// 코멘트 붙이기 붙이기
	            	$("#comments").html(' ');
	            	for (var i = 0; i < comments.length; i++) {
						console.log(comments[i]);
						var cloneRow = $("#dummy-row").clone();
						cloneRow.html('<span>'+comments[i].msg+'<small style="font-size:12px"> – ' + (comments[i].nick != null ? comments[i].nick : comments[i].uid) + ' ' + new Date(comments[i].WRITE_DATE) +'</small></span>');
						cloneRow.prependTo($("#comments"));
						cloneRow.css("display", "");
					}
            	}
            	
            }
		});
	}
	
	var onSubmitComment = function() {
		if(!'${sessionScope.auth}') {
			window.alert("로그인을 먼저 진행해주세요 ");
			return;
		}		
		if($("#input_comment").val().trim() == ''){
		 	$("#input_comment").val('').focus();
			return;	
		}
		$.ajax({
            type : 'post',
            url : '/comment/add.do',
            data : 'pid=' + '${post.POST_ID}' + '&msg=' + $("#input_comment").val(),
            dataType : 'text',
            success : function(rst){
            	$("#input_comment").val('');
            	getAllComment();
            }
		});
	}
</script>