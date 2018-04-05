<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.center{
		margin: auto;
		text-align: center;
	}
	.recipeimg{
		width: 60px;
		height: 50px;
	}
</style>
    
<div> 
    <div class="card hovercard" style="height: 400px;">
    
        <div class="card-background" style="background-image:URL(/images/test1.jpg); height: 300px">
            <img class="card-bkimg" style="color: black;">
        </div>
        <div class="useravatar">

            <img style="background-image:URL(/images/test2.jpg); margin-top: 100px; border: none;">
        </div> <br/>
        <div class="card-info" style="width: 800px; margin: auto; height: 80px"> <h5 class="card-title" style="margin-top: 40px;">${sessionScope.auth.NAME}  님</h5></div>
    </div> <br/> <br/>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="..." style="width: 800px; margin: auto; outline: none;">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab" style="height: 50px;">레시피</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab" style="height: 50px;">댓글</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab" style="height: 50px;">북마크</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab4" data-toggle="tab" style="height: 50px;">팔로잉</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab5" data-toggle="tab" style="height: 50px;">팔로워</button>
        </div>
           </div>

        <div class="well" style="width: 800px; margin: auto;">
      <div class="tab-content">
        <div class="tab-pane fade in active" id="tab1">
        </div>
        <div class="tab-pane fade in" id="tab2">
        </div>
        <div class="tab-pane fade in" id="tab3">
        </div>
        <div class="tab-pane fade in" id="tab4">
        </div>
        <div class="tab-pane fade in" id="tab5">
        </div>
      </div>
    </div>
    </div>
    
    <div class="center"><br/>
	<a data-toggle="modal" href="#dropoutModal" class="btn" style="color: #fff; background-color : red;">회원 탈퇴</a>
	</div>
	
	<!-- dropout Modal -->
<div class="modal fade" id="dropoutModal" role="dialog">
	<div class="modal-dialog">

		<!-- dropout content-->
		<div class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="text" align="center">비밀번호 확인</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				<form action="/mail/passwordauthkey.do" method="post"
					autocomplete="off">
					<h4 id="password-email-check-text" class="text">비밀번호를 입력하세요.</h4>
					
					
					<input id="password-check" type="password" name="receiver" class="form-control"
						placeholder="비밀번호 입력" style="font-size: 12pt; width: 100%;"
						required />
					<div class="modal-footer" style="border: none;">
						<button id = "password-email-check-btn" type="submit" formaction="/foodie/dropout.do"
							class="btn " data-toggle="modal"   disabled="disabled" style="margin-left: 480px; background-color: #F2BF2B; color: #fff">전송</button>
					</div>
				</form>
			</div>
		</div>
	</div>
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
            	
            $(function () {

    $(".tab_content").hide();
    $(".tab_content:first").show();

    $("ul.tabs li").click(function () {
        $("ul.tabs li").removeClass("active").css("color", "#000000");
        //$(this).addClass("active").css({"color": "darkred","font-weight": "bolder"});
        $(this).addClass("active").css("color", "darkred");
        $(".tab_content").hide()
        var activeTab = $(this).attr("rel");
        $("#" + activeTab).fadeIn()
    });
});	
            	
            	
       $(function(){
    	   $.ajax("/profile/recipe_List.do",{
    		   "method": "post",
    		   "async" : true
    	   }).done(function(obj){
    		   var recipe = JSON.parse(obj);
    		   console.log(obj);
    		   /* console.log(recipe[0]);
    		   console.log(recipe[0].MAIN_IMG);
    		   console.log(recipe[0].TITLE);
    		   console.log(recipe[0].POST_ID);
    		   console.log(recipe); */
    		   var text = "";
    		   for(var i = 0; i<recipe.length; i++){
    			   text+="<img class='recipeimg' src='/images/"+recipe[i].MAIN_IMG+"'/>"+"     "+"<a href=\"#\">"+recipe[i].TITLE+"</a><br/>";
    		   }
    		   $("#tab1").html(text);
    	   })
       })
       
        $(function(){
    	   $.ajax("/profile/bookmark_List.do",{
    		   "method": "post",
    		   "async" : true
    	   }).done(function(obj3){
    		   var bookmark = JSON.parse(obj3);
    		   console.log(bookmark[0]);
    		   console.log(bookmark[0].MAIN_IMG);
    		   console.log(bookmark[0].POST_ID);
    		   console.log(bookmark[0].USER_ID);
    		   console.log(bookmark);
    		   var text3 = "";
    		   for(var i = 0; i<bookmark.length; i++){
    			   text3+="<img class='recipeimg' src='/images/"+bookmark[i].MAIN_IMG+"'/>"+"     "+"<a href=\"#\">"+bookmark[i].TITLE+"</a><br/>";
    		   }
    		   $("#tab3").html(text3);
    	   })
       })
       
       $(document).ready(function() {
		$(".btn-pref .btn").click(function () {
   		 $(".btn-pref .btn").removeClass("btn-primary").addClass("btn-default");
    		// $(".tab").addClass("active"); // instead of this do the below 
    		$(this).removeClass("btn-default").addClass("btn-primary");   
});
});
       
       $("#password-check").keyup(function(){
   		var regid = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
   		if(regid.test($(this).val())){

   			$.ajax("/account/emailcheck.do", {
   				"method" : "post",
   				"async" : true,
   				"data" : {
   					"email" : $(this).val()
   				}
   			}).done(
   					function(obj) {
   						console.log(obj)
   						if (obj == "exists") {
   							$("#password-email-check-text").css("color",
   									"green");
   							$("#password-email-check-text").html(
   									"비밀번호가 올바릅니다.");
   							$("#password-email-check-btn").removeAttr("disabled");
   						} else if (obj == "possible") {
   							$("#password-email-check-text").css("color",
   									"red");
   							$("#password-email-check-text").html(
   									"비밀번호가 맞지 않습니다. 다시 확인해주세요.")
   						}
   					})
   		}
   		

   		
   	})
       
                </script>