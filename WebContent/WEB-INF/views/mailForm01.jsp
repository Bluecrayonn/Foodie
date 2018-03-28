<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<c:set var="path" value="${pageContext.request.contextPath}" />  
<!DOCTYPE html>
<html>
<head>
<!--  -->
<meta name="viewport" 
  content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="${path}/comm/com.css"/> 

<script src="${path}/comm/mobile/jquery-1.6.4.min.js"></script>

<script>
$(document).ready(function(){
 var isSnd="${isSnd}";
 if(isSnd=="Y"){
  alert("메일 전송 완료!!");
 }

});
</script>
</head>

<body><center>
<h3 align="center">메일 전송</h3>
<form method="post">
<table>
 <tr><td class="tt">수신자</td>
  <td><input type="text" name="receiver"/></td></tr>
 <tr><td class="tt">제목</td>
  <td><input type="text" name="subject"/></td></tr>
 <tr><td class="tt">내용</td>
  <td>
   <textarea name="content" rows="13"></textarea>
  </td></tr>
 <tr><td colspan="2" align="center">
  <input type="submit" value="메일발송"/></td></tr>
</table>
</form>
</body>
</html>

