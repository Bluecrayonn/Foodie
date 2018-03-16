<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
<title>회원가입</title>
</head>
<body>
<div align="center"></div>
<h2>회원가입 페이지</h2>
<hr width="500" color="green"/>

<table border="1" cellpadding="2" cellspacing="0" width="400">
<form:form commandName="inputMember" method="post" action="insertOK">
<tr>
<td>닉네임</td>
<td><form:input  path="nickname" maxlength="50"/></td>
</tr>
<tr>
<td>비밀번호</td>
<td><form:password path="pwd" maxlength="20"/></td>
</tr>
<tr>
<td>이메일</td>
<td><form:input path="email" maxlength="50"/></td>
</tr>
<tr>
<td colspan="2" align="center">
<input type="sumit" value="등록"/>&nbsp;&nbsp;
<input type="reset" value="취소"/>
</td>
</tr>
</form:form>
</table>
 


</body>
</html>