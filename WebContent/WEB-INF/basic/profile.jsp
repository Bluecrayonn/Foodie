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
   button:focus {
      outline: none;
   }
   button {
      outline: none;
   }
</style>
    
<div> 
    <div class="card hovercard" style="height: 400px;">
    
        <div class="card-background" style="background-image:URL(/template/images/test1.jpg); height: 300px">
            <img class="card-bkimg">
        </div>
        <div class="useravatar">
            <img  style="background-image:URL(/template/images/test2.jpg); margin-top: 100px; border: none;">
        </div> <br/>
        <div class="card-info" style="width: 800px; margin: auto; height: 80px"> <h5 class="card-title" style="margin-top: 40px;">${sessionScope.auth.NAME}  님</h5></div>
    </div>
     <br/>
     <div style="width: 800px; margin-left: 830px"> <button class="btn">프로필 수정</button><button class="btn">내 정보 수정</button></div><br/>
    <div class="btn-pref btn-group btn-group-justified btn-group-lg" role="group" aria-label="..." style="width: 800px; margin: auto; outline: none;">
        <div class="btn-group" role="group" style="outline: none;">
            <button type="button" id="stars" class="btn btn-primary" href="#tab1" data-toggle="tab" style="height: 50px; outline: none;">레시피</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="favorites" class="btn btn-default" href="#tab2" data-toggle="tab" style="height: 50px; outline: none;">댓글</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab3" data-toggle="tab" style="height: 50px; outline: none;">북마크</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab4" data-toggle="tab" style="height: 50px; outline: none;">팔로잉</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab5" data-toggle="tab" style="height: 50px; outline: none;">팔로워</button>
        </div>
        <div class="btn-group" role="group">
            <button type="button" id="following" class="btn btn-default" href="#tab6" data-toggle="tab" style="height: 50px; outline: none;">내 정보</button>
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
         <div class="tab-pane fade in" id="tab6">
         <ul style="list-style: none;">
            <li>${sessionScope.auth.NAME} 님의 내 정보</li>
            <li>&nbsp;&nbsp;&nbsp;이메일 : ${sessionScope.auth.EMAIL}</li>
            
            <li>&nbsp;&nbsp;&nbsp;성별 : ${sessionScope.auth.GENDER}</li>
            <li>&nbsp;&nbsp;&nbsp;생일 : ${sessionScope.auth.BIRTH}</li>
            <li>&nbsp;&nbsp;&nbsp;직장 : OO마트</li> <!-- 마트관리자만! -->
        </ul>
        </div>
      </div>
    </div>
    </div>
    
    <div class="center"><br/>
   <button class = "btn" onclick="location='dropout.do'" style="color: #fff; background-color : red;"> 회원 탈퇴 </button>
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
                text+="<img class='recipeimg' src='/template/images/"+recipe[i].MAIN_IMG+"'/>"+"     "+"<a href=\"#\">"+recipe[i].TITLE+"</a><br/>";
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
                text3+="<img class='recipeimg' src='/template/images/"+bookmark[i].MAIN_IMG+"'/>"+"     "+"<a href=\"#\">"+bookmark[i].TITLE+"</a><br/>";
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