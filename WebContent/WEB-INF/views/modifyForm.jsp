<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--  스프링에서 지원해주는 폼태그 라이브러리  -->



<html>
<head>
<title>회원가입 수정 페이지</title>
<style type="text/css">
.msg{font-size:9px; color:red;}
</style>
</head>
<body>
<div align="center">
<h2>회원가입 페이지</h2>
<hr width="500" color="green"/>
</br>
</br>

<table border="1" cellpadding="2" cellspacing="0" width="400">
<form:form commandName="foodieMember" method="post" action="/FinalProject_Foodie/modifyOk.do">
<!--  commnadName을 사용해서 models.FoodieMember에 있는 setter와 getter에 접근하여 form태그에 사용한 것과 매핑하는데 사용됨  -->
<tr>
<td>닉네임</td>
<td>
<form:input path="nickname" maxlength="50" readonly="true"/>
<!--  닉네임에 대해 수정할 수 없도록 html input태그를 readonly속성으로 처리 --> 
<form:errors path="nickname" cssClass="msg"/>
</td>
</tr>

<tr>
<td>비밀번호</td>
<td><form:password path="pwd" maxlength="20"/></td>
<form:errors path="pwd" cssClass="msg"/>
</tr>

<tr>
<td>이메일</td>
<td><form:input path="email" maxlength="50"/></td>
<form:errors path="email" cssClass="msg"/>
</tr>
<tr>
<td colspan="2" align="center">
<input type="submit" value="수정"/>&nbsp;&nbsp;
<input type="reset" value="취소"/>
</td>
</tr>

</form:form>
</table>
 </div>


</body>
</html>