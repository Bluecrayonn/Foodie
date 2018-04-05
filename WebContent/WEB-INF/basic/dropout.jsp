<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri = "http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>	
	
<style>
.center {
	margin: auto;
	text-align: center;
}
</style>

<div class="center">
	<p>
		회원탈퇴를 하시게 되면 레시피, 북마크, 댓글, 프로필이 모두 삭제됩니다.<br /> 사용하고 계신 이메일(<strong
			style="color: #F3AA2F;">${sessionScope.auth.EMAIL}</strong>)은 탈퇴할 경우
		<strong style="color: red;">재사용 및 복구가 불가능 </strong>하므로 신중하게 선택하시기
		바랍니다.<br />
	</p>
	
	<a data-toggle="modal" href="#dropoutModal" class="btn"
		style="color: #fff; background-color: red;">회원 탈퇴</a> <a
		href="profile.do" class="btn"
		style="color: #fff; background-color: #F2BF2B;">프로필 페이지로 이동</a>
		
</div>
<div class="modal fade" id="dropoutModal" role="dialog">
	<div class="modal-dialog">

		<!-- pw setting Modal content-->
		<div  class="modal-content" style="font-family: '나눔고딕'">
			<div class="modal-header" style="font-family: '나눔고딕'">
				<button type="button" class="close" data-dismiss="modal">×</button>
				<h4 class="text" align="center">회원 탈퇴하기 비밀번호 확인</h4>
			</div>
			<div class="modal-body" style="font-family: '나눔고딕'">
				 
					<h4 id="password-email-check-text" class="text">비밀번호를 입력하세요</h4>
					
					
					<input id="password-delete-check" type="text" name="receiver" class="form-control"
						placeholder="비밀번호 입력" style="font-size: 12pt; width: 100%;"
 						required />
					<div class="modal-footer">
						<button id = "password-delete-check-btn" type="button"  
							class="btn " data-dismiss="modal"  >전송</button>
					</div>
 			</div>

		</div>
	</div>
</div>
<script>
$("#password-delete-check-btn").click(function(){
	$.ajax("/account/dlMember.do",{
		"method":"post",
		"async":true,
		"data":{
			"pwd":$("#password-delete-check").val(),
			"email":"${sessionScope.auth.EMAIL}"
				
		}
	}).done(function(obj){
		console.log(obj);
		if(obj=="success"){
			var confirm = window.confirm("회원 탈퇴에 성공 하셨습니다.");
			if(confirm){
				location.href="/authentication/logout.do";
			}
 			
 		}else if (obj=="fail"){
			window.alert("회원 탈퇴에 실패 하셨습니다.");
 		}
	})
	
})


</script>



