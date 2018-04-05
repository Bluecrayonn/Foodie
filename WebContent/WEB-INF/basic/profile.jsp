<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
.center {
	margin: auto;
	text-align: center;
}

.recipeimg {
	width: 60px;
	height: 50px;
}

button:focus {
	outline: none;
}

button {
	outline: none;
}
</style>

<div>
	<div class="card hovercard" style="height: 400px;">

		<div class="card-background"
			style="background-image: URL(images/test1.jpg); height: 300px">
			<img class="card-bkimg">
		</div>
		<div class="useravatar">
			<img id="profile-img" src="/profile_image/${sessionScope.auth.PROFILE_IMG}" width="200px"
				style="background-image: URL(); margin-top: 100px; border: none;">
			
		</div>
		<div class="card-info"
			style="width: 800px; margin: auto; height: 80px">
			<h5 class="card-title" style="margin-top: 40px;">${sessionScope.auth.NAME}
				님</h5>
				
		</div>
	</div>
	<form action="/profile/" id="profile-img-upload-form" method="post" enctype="multipart/form-data">
			<input type="file" id="profile-img-upload" name="pf-image"  accept="image/*" style="display: none">
			<button class ="btn"  type="button" id="profile-img-upload-form-btn">사진 바꾸기</button>
			</form>
	<br />
	<div style="width: 800px; margin-left: 830px">
 		<a data-toggle="modal" href="#profile-change-Modal"
						class="js-fh5co-close-offcanvas">회원가입</a> 
	</div>
	<br />
	<div class="btn-pref btn-group btn-group-justified btn-group-lg"
		role="group" aria-label="..."
		style="width: 800px; margin: auto; outline: none;">
		<div class="btn-group" role="group" style="outline: none;">
			<button type="button" id="stars" class="btn btn-primary" href="#tab1"
				data-toggle="tab" style="height: 50px; outline: none;">레시피</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" id="favorites" class="btn btn-default"
				href="#tab2" data-toggle="tab" style="height: 50px; outline: none;">댓글</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" id="bookmark" class="btn btn-default"
				href="#tab3" data-toggle="tab" style="height: 50px; outline: none;">북마크</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" id="following" class="btn btn-default"
				href="#tab4" data-toggle="tab" style="height: 50px; outline: none;">팔로잉</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" id="follower" class="btn btn-default"
				href="#tab5" data-toggle="tab" style="height: 50px; outline: none;">팔로워</button>
		</div>
		<div class="btn-group" role="group">
			<button type="button" id="myinfo" class="btn btn-default"
				href="#tab6" data-toggle="tab" style="height: 50px; outline: none;">내
				정보</button>
		</div>
	</div>

	<div class="well" style="width: 800px; margin: auto;">
		<div class="tab-content">
			<div class="tab-pane fade in active" id="tab1"></div>
			<div class="tab-pane fade in" id="tab2"></div>
			<div class="tab-pane fade in" id="tab3"></div>
			<div class="tab-pane fade in" id="tab4"></div>
			<div class="tab-pane fade in" id="tab5"></div>
			<div class="tab-pane fade in" id="tab6">
				<ul style="list-style: none;" >
					<li>${sessionScope.auth.NAME}님의내 정보</li>
					<li>&nbsp;&nbsp;&nbsp;이메일 : ${sessionScope.auth.EMAIL}</li>

					<li>&nbsp;&nbsp;&nbsp;성별 : ${sessionScope.auth.GENDER}</li>
					<li>&nbsp;&nbsp;&nbsp;생일 : ${sessionScope.auth.BIRTH}</li>
					<li>&nbsp;&nbsp;&nbsp;직장 : OO마트</li>
					<!-- 마트관리자만! -->
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="profile-change-Modal" role="dialog">
	<div class="modal-dialog">

		<!-- pw setting Modal content-->
		<div  class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="text" align="center">회원정보 수정 비밀번호 확인</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				 
					<h4 id="profile-change-check-text" class="text">비밀번호를 입력하세요</h4>
					
					
					<input id="profile-change-check" type="text" name="receiver" class="form-control"
						placeholder="비밀번호 입력" style="font-size: 12pt; width: 100%;"
 						required />
					<div class="modal-footer">
						<button id = "profile-change-check-btn" type="button"  
							class="btn " data-dismiss="modal"  >전송</button>
					</div>
 			</div>

		</div>
	</div>
</div>
<div class="center">
	<br />
	<button class="btn" onclick="location='dropout.do'"
		style="color: #fff; background-color: red;">회원 탈퇴</button>
</div>

<script>
	/*   
	 $("#login-form-button").click(function(){
	 $.ajax("/authentication/login.do",{
	 "method": "POST",
	 "async": false ,
	 "data": {"email": $("#login-email").val()  , "password": $("#login-password").val() }
	 })
	 .done(function( msg ) {
	 console.log(msg)
	 })
	 })
	 */
	$("#login-form-button").click(function() {
		$.ajax("/authentication/login.do", {
			"method" : "post",
			"async" : false,
			"data" : {
				"email" : $("#login-email").val(),
				"password" : $("#login-password").val()
			}
		}).done(function(obj) {
			if (obj.auth == 0) {
				$("#login-container").hide();
				$("#logon-container").show();
				location.href = "/foodie/main.do"
			}
		})
	})

	$(function() {

		$(".tab_content").hide();
		$(".tab_content:first").show();

		$("ul.tabs li").click(function() {
			$("ul.tabs li").removeClass("active").css("color", "#000000");
			//$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
			$(this).addClass("active").css("color", "darkred");
			$(".tab_content").hide()
			var activeTab = $(this).attr("rel");
			$("#" + activeTab).fadeIn()
		});
	});

	$(function() {
		$
				.ajax("/profile/recipe_List.do", {
					"method" : "post",
					"async" : true
				})
				.done(
						function(obj) {
							var recipe = JSON.parse(obj);
							console.log(obj);
							/* console.log(recipe[0]);
							console.log(recipe[0].MAIN_IMG);
							console.log(recipe[0].TITLE);
							console.log(recipe[0].POST_ID);
							console.log(recipe); */
							var text = "";
							for (var i = 0; i < recipe.length; i++) {
								text += "<img class='recipeimg' src='/template/images/"+recipe[i].MAIN_IMG+"'/>"
										+ "     "
										+ "<a href=\"#\">"
										+ recipe[i].TITLE + "</a><br/>";
							}
							$("#tab1").html(text);
						})
	})

	$(function() {
		$
				.ajax("/profile/bookmark_List.do", {
					"method" : "post",
					"async" : true
				})
				.done(
						function(obj3) {
							var bookmark = JSON.parse(obj3);
							console.log(bookmark[0]);
							console.log(bookmark[0].MAIN_IMG);
							console.log(bookmark[0].POST_ID);
							console.log(bookmark[0].USER_ID);
							console.log(bookmark);
							var text3 = "";
							for (var i = 0; i < bookmark.length; i++) {
								text3 += "<img class='recipeimg' src='/template/images/"+bookmark[i].MAIN_IMG+"'/>"
										+ "     "
										+ "<a href=\"#\">"
										+ bookmark[i].TITLE + "</a><br/>";
							}
							$("#tab3").html(text3);
						})
	})

	$(document).ready(
			function() {
				$(".btn-pref .btn").click(
						function() {
							$(".btn-pref .btn").removeClass("btn-primary")
									.addClass("btn-default");
							// $(".tab").addClass("active"); // instead of this do the below 
							$(this).removeClass("btn-default").addClass(
									"btn-primary");
						});
			});
	$(function() {
		$.ajax("/profile/following_List.do", {
			"method" : "post",
			"async" : true
		}).done(
				function(obj3) {
					var following = JSON.parse(obj3);
					console.log(obj3);

					var text3 = "";
					if (following != null) {
						for (var i = 0; i < following.length; i++) {
							text3 += "<a href=\"#\">" + following[i].NAME
									+ " - " + following[i].EMAIL + "</a><br/>";
						}
					}
					$("#tab4").html(text3);
				})
	})
	$(function() {
		$.ajax("/profile/follower_List.do", {
			"method" : "post",
			"async" : true
		}).done(
				function(obj3) {
					var follower = JSON.parse(obj3);
					console.log(obj3);
					var text3 = "";
					if (follower != null) {
						for (var i = 0; i < follower.length; i++) {
							text3 += "<a href=\"#\">" + follower[i].NAME
									+ " - " + follower[i].EMAIL + "</a><br/>";
						}
					}
					$("#tab5").html(text3);
				})
	})
	$("#profile-img").click(function(){
		$("#profile-img-upload").change(function() {
  			if (!this.files[0].type.startsWith('image')) {
				window.alert("이미지 파일만 선택가능합니다.");
				this.value = "";
			} else {
				var reader = new FileReader();
				reader.readAsDataURL(this.files[0]);
				reader.onload = function() {
					$("#profile-img").attr("src", this.result);
				}
			}
  			console.log($("#profile-img-upload")[0].files[0]);
		}); 
		$("#profile-img-upload").click();
		
	 

	})
	$("#profile-img-upload-form-btn").click(function(){
 		var formData = new FormData();
 		//var file = $("#profile-img-upload")[0].files[0];
 		//console.log(file);
		formData.append('pf-image', $("#profile-img-upload")[0].files[0]);
		/* console.log( $("#profile-img-upload").attr('files'));
		console.log(formData); */
		 $.ajax({
		        url:"/profile/profileimage.do",
		        data: formData,
		        processData: false,
 		        contentType: false,
 		        encType:"multipart/form-data",
		        type : 'POST',
		        success: function (data) {
		        	console.log(data);
		            window.alert("이미지 업로드 성공");
		        }
		    });
 

		//출처: http://lordpark.tistory.com/8 [The World of Web]
  	})
  	$("#profile-change-check-btn").click(function(){
  		$.ajax("/account/profilecheck.do",{
  			method:"post",
  			async:true,
  			data:{
  				"password":$("#profile-change-check").val()
  			}
  		}).done(function(result){
  			//console.log("result : "+obj);
  			//var result = $.parseJSON(obj);
  			console.log(result);
  			var text="<form action=\"/account/profilechange.do\" method=\"post\">";
  			
  			 
			 
			 
		 
  			if(result.result=="success"){
  				$("#myinfo").click();
  				text+="<ul style=\"list-style: none;\" >";
  				text+="<li>이름 : <input type=\"text\" name=\"name\" value=\""+result.NAME+"\" /></li>";
  				text+="<li>비밀번호 : <input type=\"password\" name=\"password\" value=\""+result.PASSWORD+"\" /></li>";
  				text+="<li>성별 : <input type=\"text\" name=\"GENDER\" value=\""+result.GENDER+"\" disabled=\"disabled\"/ ></li>";
  				text+="<li>나이 : <input type=\"text\" name=\"BIRTH\" value=\""+result.BIRTH+"\" disabled=\"disabled\"/></li>";
  				text+="</ul>"
  				text+="<button type=\"submit\"> 전송하기 </button>" 
  				text+="</form>"
  				$("#tab6").html(text);
  			}else  {
  				window.alert("비밀번호가 틀렸습니다.");
  			}
  		})
  		
  	})
</script>