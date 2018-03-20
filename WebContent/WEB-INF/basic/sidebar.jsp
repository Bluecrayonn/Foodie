<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<style type="text/css">
		.button{
			font-family: '나눔고딕';
			background-color: #F7C772; 
			color: white;
		}
		.text{
			color: #F7C772;
		}
		.tb{
			padding : 26px;
		}
	</style>
	
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
		</div>
		<!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content" style="font-family: '나눔고딕'">
        <div class="modal-header" style="font-family: '나눔고딕'">
          <button type="button" class="close" data-dismiss="modal">×</button>
          <h4 class="text" align="center">회원가입</h4>
        </div>
        <div class="modal-body" style="font-family: '나눔고딕'">
          <form action="/foodie/profile.jsp" autocomplete="off">
     <h4 class="text">회원 종류를 선택하세요.</h4>
      <label for="sel1"></label>
      <select class="form-control" id="sel1" style="font-size: 12pt;">
        <option>일반 유저</option>
        <option>마트 관리자</option>
      </select>
			<h4 class="text">이메일을 입력하세요.</h4><input type="text" name="id" class="form-control tb" placeholder="이메일 입력"
					style="font-size: 12pt; width: 100%;" pattern="[A-Za-z0-9]+" required/>
			<h4 class="text">비밀번호를 입력하세요.</h4><input type="password" name="pass" class="form-control tb" placeholder="비밀번호 입력"
					style="font-size: 12pt; width: 100%;" required/>
			<h4 class="text">닉네임을 입력하세요.</h4><input type="text" name="id" class="form-control tb" placeholder="닉네임 입력"
					style="font-size: 12pt; width: 100%;" pattern="[A-Za-z0-9]+" required/>
		</form>
        </div>
        <div class="modal-footer">
        	<button type="button" class="button btn btn-defult" data-dismiss="modal">닫기</button>
        </div>
      </div>
    </div>
  </div>