
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="fh5co-offcanvas" >
	<a href="#" class="fh5co-close-offcanvas js-fh5co-close-offcanvas"><span>
			<i class="icon-cross3"></i> <span>Close</span>
	</span></a>
	<div class="fh5co-bio" id="sidebar">
		<c:choose>
			<c:when test="${empty sessionScope.auth}">
				<h2 style="margin-right: 20px;">로그인</h2>
				<div id="login-container" style="width: 250px">
               <form id="login-form" autocomplete="off">
                  <p>
                     <input id="login-email" type="text" name="id"
                        class="form-control" placeholder="이메일 입력"
                        style="padding: 5px; font-size: 14pt; width: 250px;"
                        pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$"
                        required />
                  </p>
                  <p>
                     <input id="login-password" type="password" onkeydown="enterevent();" name="pass"
                        class="form-control" placeholder="비밀번호 입력"
                        style="padding: 5px; font-size: 14pt; width: 250px;" required />
                  </p>
                  <p>
                     <button type="button" id="login-form-button"
                        style="padding: 5px; font-size: 14pt; width: 250px;">로그인</button>
                  </p>
                  <p>
                     <input type="checkbox" name="keep" value="on" />로그인 상태유지
                  </p>

					</form>
					<font size="2em" color="FFA500" style="margin-right: 20px;"> 아직 회원이 아니신가요? </font> <br/> 
					<font size="2em" color="FFA500" style="margin-right: 20px;"> 혹은 비밀번호가 기억나지 않으신가요? </font> <br/> 
					<a data-toggle="modal" href="#signupModal" class="js-fh5co-close-offcanvas">회원가입</a> 
					| <a data-toggle="modal" href="#pwsettingModal" class="js-fh5co-close-offcanvas" style="margin-right: 20px;">비밀번호 찾기</a>
				</div>

			</c:when>
			<c:when test="${!empty sessionScope.auth}">
