<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<div class="wrapper">
        <div class="container">
        	<div class="row">
                <div class="col-md-12">
                <header id="header">
  <div class="slider">
  <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox">
    <div class="item active">
      <img src="헤더이미지" style="width: 1200px; height: 400px;">
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="fa fa-angle-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="fa fa-angle-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
</div>
                	<nav class="navbar navbar-default">
                        <div class="navbar-header">
                          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#mainNav">
                          </button>
                          <a class="navbar-brand" href="#"><img class="프로필이미지"></a>
                          <span class="site-name" style="color=#000000;">${sessionScope.auth.user[0].NAME}</span>
                        </div>
<div class="container">
    <div class="row">
        <div class="col-md-12" style="width: 800px">
            <div class="panel with-nav-tabs panel-primary" style="background-color: #ffffff; border-color: #F3AA2F; width: 802px">
                <div class="panel-heading" style="background-color: #ffffff; border-color: #F3AA2F; width: 800px">
                        <ul class="nav nav-tabs">
                            <li class="active"><a href="#tab1primary" data-toggle="tab">레시피 (갯수)</a></li>
                            <li><a href="#tab2primary" data-toggle="tab">댓글 (갯수)</a></li>
                            <li><a href="#tab3primary" data-toggle="tab">북마크 (갯수)</a></li>
                            <li><a href="#tab4primary" data-toggle="tab">팔로잉 (갯수)</a></li>
                            <li><a href="#tab5primary" data-toggle="tab">팔로워 (갯수)</a></li>
                </ul>
                </div>
                <div class="panel-body">
                    <div class="tab-content">
                        <div class="tab-pane fade in active" id="tab1">
                        	
                        </div>
                        <div class="tab-pane fade" id="tab2">2222</div>
                        <div class="tab-pane fade" id="tab3">3333</div>
                        <div class="tab-pane fade" id="tab4">4444</div>
                        <div class="tab-pane fade" id="tab5">5555</div>
                    </div>
                </div>
            </div>
        </div>
	</div>
</div>
					</nav>
                </header>         
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
    		   console.log(recipe[0]);
    		   console.log(recipe[0].TITLE);
    		   console.log(recipe[0].POST_ID);
    		   console.log(recipe);
    		   var text = "";
    		   for(var i = 0; i<recipe.length; i++){
    			   text+="<a href=\"#\">"+recipe[i].TITLE+"</a><br/>";
    		   }
    		   $("#tab1").html(text);
    	   })
       })
       
                </script>