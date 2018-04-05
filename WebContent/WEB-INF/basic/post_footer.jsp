<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>    
    
<footer class="navbar navbar-default navbar-fixed-bottom">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<form class="navbar-form navbar-left" onsubmit="onSubmitComment(); return false;" style="margin-left: 30%">
				<div class="form-group">
					<img src="/images/icon_comment.png"></img>
					<input id="input_comment" style="width: 400px; height: 38.65px; padding: 5px 10px 5px 10px; border-width: 1px;"
						type="text" class="form-control"
						placeholder="이 레시피에 대한 당신의 생각을 남겨주세요.">
				</div>
				<button type="button" onclick="onSubmitComment()" class="btn" style="background-color: #F2BF2B; color: #fff">제출</button>
			</form>
			<ul class="nav navbar-nav navbar-right" style="margin:10px 10px 0 0; margin-left: 150px;">
				<li><i style="font-size: 18pt" id="${post.POST_ID }"
					class="icon-bookmark bookmarkicon"></i></li>
				<li><i style="font-size: 18pt" id="${post.WRITER_ID}"
					class="icon-heart hearticon"></i></li>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</footer>

 