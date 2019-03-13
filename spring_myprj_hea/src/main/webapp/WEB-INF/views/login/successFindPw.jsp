<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
function returnLogin(){
	location.href="login";
}

</script>
</head>
<body>
	<h3>successFindPw</h3>
	<table>
		<tr>
			<td>임시비밀번호 발급</td>
			<td>${SfindPw}</td>
		</tr>
	</table>
	<label>로그인 후 비밀번호를 변경해주세요</label>
	<input type="button" value="로그인하기"  onclick="returnLogin()"/>
</body>
</html>