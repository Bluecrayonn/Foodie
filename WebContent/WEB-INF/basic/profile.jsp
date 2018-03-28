<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>
	.center{
		margin: auto;
		text-align: center;
	}
</style>
    
<div> 
    <div class="card hovercard">
        <div class="card-background">
            <img class="card-bkimg" style="color: black;">
        </div>
        <div class="useravatar">
            <img style="color: black;">
        </div>
        <div class="card-info" style="width: 800px; margin: auto;"> <span class="card-title">${sessionScope.auth.user[0].NAME}  님</span>

        </div>
    </div>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="..." style="width: 800px; margin: auto;">
        <div class="btn-group" role="group">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab"><span class="glyphicon" aria-hidden="true">개수</span>
                <div class="hidden-xs">레시피</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab"><span class="glyphicon" aria-hidden="true">개수</span>
                <div class="hidden-xs">댓글</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab"><span class="glyphicon" aria-hidden="true">개수</span>
                <div class="hidden-xs">북마크</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab4" data-toggle="tab"><span class="glyphicon" aria-hidden="true">개수</span>
                <div class="hidden-xs">팔로잉</div>
            </button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab5" data-toggle="tab"><span class="glyphicon" aria-hidden="true">개수</span>
                <div class="hidden-xs">팔로워</div>
            </button>
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
	<button class = "btn" onclick="location='dropout.do'"> 회원 탈퇴 </button>
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
    		   console.log(recipe[0]);
    		   console.log(recipe[0].MAIN_IMG);
    		   console.log(recipe[0].TITLE);
    		   console.log(recipe[0].POST_ID);
    		   console.log(recipe);
    		   var text = "";
    		   for(var i = 0; i<recipe.length; i++){
    			   text+="<a href=\"#\">"+recipe[i].MAIN_IMG+"  "+recipe[i].TITLE+"</a><br/>";
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
    		   console.log(bookmark[0].POST_ID);
    		   console.log(bookmark[0].USER_ID);
    		   console.log(bookmark);
    		   var text3 = "";
    		   for(var i = 0; i<bookmark.length; i++){
    			   text3+="<a href=\"#\">"+bookmark[i].TITLE+"</a><br/>";
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
                </script>