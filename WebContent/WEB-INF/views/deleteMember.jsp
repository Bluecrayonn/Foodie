<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!--  스프링에서 지원해주는 폼태그 라이브러리  -->



<html>
<head>
<title>회원 정보 삭제</title>
<style type="text/css">
.errMsg {
	font-size: 9px;
	color: red;
}
</style>
</head>
<body>
	<div align="center">
		<h2>회원정보삭제</h2>
		<hr width="300" color="orange" />
		<br />
		<table border="1" cellpadding="2" cellspacing="0" width="300">
			<%-- <form:form commandName="foodieMember" name="member"     method="post"
				action="${pageContext.request.contextPath}/deleteOk.do"> --%>
				
				<%-- <form:form commandName="foodieMember" name="member"     method="get"
				action="${pageContext.request.contextPath}/deleteOk.do"> --%>
				
				
				 <form:form commandName="foodieMember" name="member"     method="get"
				action="${pageContext.request.contextPath}/dlMember.do"> 
				
				<!-- 절대경로 action="/foodie_Member/deleteOk.do"와 같음> -->
				<!--  commnadName을 사용해서 models.FoodieMember에 있는 setter와 getter에 접근하여 
			form태그에 사용한 것과 매핑하는데 사용됨  -->
				<tr>
					<td align="center"><br /> 닉네임: <form:input path="nickname" 
							maxlength="20" /> 
							<%--  <form:errors path="nickname" cssclass="errMsg" /> --%>
						<p /> <!-- 스프링의 폼태그 라이브러리에서는 submit을 지원안하기 때문에
					html 태그방식으로 작성 --> 
					<span > <!--  style="display:none"-->
					<input  id="del" type="submit" value="탈퇴" />  &nbsp; &nbsp;
					</span> 
				

				</tr>
			</form:form>
			
				
		</table>
<%-- 		<table>
<form:form commandName="nickname"  method="get"
				action="${pageContext.request.contextPath}/dlMember.do"> 
				 <button>확인</button> </form:form> 
				</table>  --%>
	</div>



</body>
</html>