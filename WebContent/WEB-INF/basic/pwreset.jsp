<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
	.center{
		margin: auto;
		text-align: center;
	}
</style>

<div class="center">
	비밀번호 재설정을 위한 이메일이 전송되었습니다.<br/>
	이메일에 전송된 코드를 입력하세요.<br/><br/>
	<input type="text" name="id" class="form-control" placeholder="코드 입력"
	style="font-size: 12pt; width: 40%; margin: auto;" pattern="[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$" required/> <br/>
	<button class="btn" onclick="" style="color: #fff; background-color : #F2BF2B;">인증</button>
</div>