<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<html>
<head>
<title>회원 탈퇴 오류</title>
<script type="text/javascript">
alert("삭제하고자하는 닉네임이 존재하지 않습니다.");

 location.href="<%=request.getContextPath()%>/deleteSend.do"; 


//다시 deleteMember.jsp로 넘어가기 위함  
// request.getContextPath(): 프로젝트의 경로를 가져옴 => /foodie_Member/deleteSend.do"와 같음






</script>


</head>
<body>

</body>
</html>