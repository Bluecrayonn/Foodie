<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.center{
		margin: auto;
		text-align: center;
	}
</style>

<div class="center">
			<p>회원탈퇴를 하시게 되면 레시피, 북마크, 댓글, 프로필이 모두 삭제됩니다.<br/>
			사용하고 계신 이메일(<strong style="color: #F3AA2F;">${sessionScope.auth.user[0].EMAIL}</strong>)은 탈퇴할 경우 <strong style="color: red;">재사용 및 복구가 불가능 </strong>하므로 신중하게 선택하시기 바랍니다.<br/></p>
        	<a href="main.do" class="btn" style="color: #fff; background-color : red;">회원 탈퇴</a>
        	<a href="profile.do" class="btn" style="color: #fff; background-color : #F2BF2B;">프로필 페이지로 이동</a>
</div>