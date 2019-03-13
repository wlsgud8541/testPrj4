<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function findEmail(){
	location.href="#";
}
function findPwHint(){
	location.href="findPwHint";
}
function returnLogin(){
	location.href="login";
}
</script>
</head>
<body>
<h3>findPw</h3>
<h3>비밀번호 찾기</h3>
	<input type="button" value="이메일인증" onclick="findEmail()">
	<input type="button" value="비밀번호 힌트로 찾기" onclick="findPwHint()">
	<input type="button" value="로그인하기" onclick="returnLogin()">
</body>
</html>