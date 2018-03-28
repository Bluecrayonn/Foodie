<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	.center{
		margin: auto;
		text-align: center;
	}
</style>

<div class="center">
			<p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.<br/>
			사용하고 계신 이메일(<strong style="color: #F3AA2F;">${sessionScope.auth.user[0].EMAIL}</strong>)은 탈퇴할 경우 재사용 및 복구가 불가능합니다.<br/>
			탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.<br/></p>
        	<a href="main.do" class="btn">회원 탈퇴</a>
        	<a href="profile.do" class="btn">프로필 페이지로 이동</a>
</div>