<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	<div id="fh5co-offcanvas">
		<a href="#" class="fh5co-close-offcanvas js-fh5co-close-offcanvas"><span>
		<i class="icon-cross3"></i> <span>Close</span></span></a>
		<div class="fh5co-bio">
			<form action="/foodie/profile.jsp" autocomplete="off">
			<p> <input type="text" name="id" class="form-control" placeholder="이메일 입력"
					style="padding: 5px; font-size: 14pt; width: 250px;" pattern="[A-Za-z0-9]+" required/></p>
			<p> <input type="password" name="pass" class="form-control" placeholder="비밀번호 입력"
					style="padding: 5px; font-size: 14pt; width: 250px;" required/> </p>
			<p> <button type="submit" style="padding: 5px; font-size: 14pt; width: 250px;">로그인</button> </p>
			<p> <input type="checkbox" name="keep" value="on"/>로그인 상태유지 </p>
		</form>
		<font size="2em" color="FFA500"> 아직 회원이 아니신가요? </font> <br/>
		<a data-toggle="modal" href="#myModal" class="js-fh5co-close-offcanvas">회원가입</a> | <a href="">아이디찾기</a> | <a href="">비밀번호찾기</a>
		

			<figure>
				<img src="/templet/images/person1.jpg"
					alt="Free HTML5 Bootstrap Template" class="img-responsive">
			</figure>
			<h3 class="heading">사용자</h3>
			<h2>Test1</h2>
			<p>Im a Foodie!</p>
			<ul class="fh5co-social">
				<li><a href="#"><i class="icon-twitter"></i></a></li>
				<li><a href="#"><i class="icon-facebook"></i></a></li>
				<li><a href="#"><i class="icon-instagram"></i></a></li>
			</ul>
		</div>
		<div class="fh5co-menu">
			<div class="fh5co-box">
				<h3 class="heading">Categories</h3>
				<ul>
					<li><a href="#">프로필</a></li>
					<li><a href="#">레시피</a></li>
					<li><a href="#">북마크</a></li>
				</ul>
			</div>
		</div>
		</div>
		<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="font-family: '나눔고딕'">
        <div class="modal-header" style="font-family: '나눔고딕'">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body" style="font-family: '나눔고딕'">
          <form action="/foodie/profile.jsp" autocomplete="off">
			<p> <input type="text" name="id" class="form-control" placeholder="이메일 입력"
					style="padding: 5px; font-size: 14pt; width: 250px;" pattern="[A-Za-z0-9]+" required/></p>
			<p> <input type="password" name="pass" class="form-control" placeholder="비밀번호 입력"
					style="padding: 5px; font-size: 14pt; width: 250px;" required/> </p>
		</form>
        </div>
        <div class="modal-footer">
          <a href="#" class="button" style="font-family: '나눔고딕'">회원가입</a>
        	<button type="button" class="btn btn-default" data-dismiss="modal" style="font-family: '나눔고딕'">닫기</button>
        </div>
      </div>
    </div>
  </div>