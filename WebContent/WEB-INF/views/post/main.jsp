<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<style>
	#fixed-menu {
        width: 100%;
        background-color: #fff;
        position: fixed;
  		bottom: 0px;
  		left: 0px;
      }
      #fixed-menu li {
        display: inline-block;
        margin-right: 30px;
      }
      .textbox {
	box-shadow: none;
  	background: transparent;
  	border: 2px solid rgba(0, 0, 0, 0.1);
  	height: 54px;
  	font-size: 18px;
  	font-weight: 300;
  	border-radius: 5px;
	}
	.textbox:active, .textbox:focus {
  	outline: none;
  	box-shadow: none;
  	border-color: #f7c873;
	}
	</style>
	
<c:set var="ismine" value="${sessionScope.auth.user[0].ACCOUNT_ID == post.WRITER_ID}" />

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
								<a href="#" onclick="return getOutput();">${item.name} ${item.qty}${item.unit}</a><br/>
							</c:forEach>
						</div>
						<div class="col-lg-4 animate-box">
							<div class="fh5co-highlight right"  style="border-radius:10px; width: 500px; height: 300px; text-align: center; vertical-align: ;">
								<div style="height: 70%;"id="output">재료를 선택하여 주십시오</div>
							</div>
						</div>
					</div>
					<c:if test="${sessionScope.auth.ACCOUNT_ID == post.WRITER_ID}">
					<div class="row rp-b">
						<div class="col-md-12 animate-box"><h4>방법</h4>${post.CONTENT}</div>
						<div class="animate-box"><a href="/foodie/write/modifypost.do?pid=${post.POST_ID}" style="margin-left:50%;">수정하기</a></div>
						</div>
						</c:if>
				</div>
			</article>
			<div>
			<!-- 댓글 영역 -->
			<ul id="comments" style="list-style-type:none" class="col-lg-8 col-lg-offset-2 col-md-8 col-md-offset-2 col-sm-8 col-sm-offset-2 col-xs-8 col-xs-offset-2 text-left content-article">
			<!-- 더미 코멘트 -->
			<li id="dummy-row" style="display:none"><span>코멘트 1<small style="font-size:12px"> – halfer Oct 22 '11 at 12:21</small></span></li>
					</ul>
		</div>
	</div>
</div>

<nav class="navbar navbar-default navbar-fixed-bottom">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-left" onsubmit="onSubmitComment(); return false;">
				<div class="form-group">
					<a href="#"><img src="/images/icon_comment.png"></img></a>
					<input id="input_comment" style="width: 400px; height: 38.65px; padding: 5px 10px 5px 10px; border-width: 1px;"
						type="text" class="form-control"
						placeholder="이 레시피에 대한 당신의 생각을 남겨주세요.">
				</div>
				<button type="button" onclick="onSubmitComment()" class="btn" style="background-color: #F2BF2B; color:#fff;">제출</button>
			</form>
			<ul class="nav navbar-nav navbar-right" style="margin:10px 10px 0 0;">
				<li><i style="font-size: 18pt" id="${post.POST_ID }"
					class="icon-bookmark bookmarkicon"></i></li>
				<li><i style="font-size: 18pt" id="${post.WRITER_ID}"
					class="icon-heart hearticon"></i></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>


	
	<script>
	function getOutput() {
	    $.ajax({
	        complete: function (response) {
	            $('#output').html("(최근 1주일간의 가격입니다.)<br/>상품 &nbsp;&nbsp;&nbsp;&nbsp;가격<br/>적색잎치커리 &nbsp;&nbsp;&nbsp;&nbsp;1000원");
	        },
	    });
	    return false;
	}
	
	function get_action() { // inside script tags
		return form_action;
	}
	$(document).ready(function() {
		/*** basic main.jsp의 script와 공통부분, 어딘가로 합치자 ***/ 
		$(".bookmarkicon").click(function() {
			var bookmark = $(this);
			if ($(this).hasClass(""))
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