<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function returnLogin(){
	location.href="login";
}
</script>
</head>
<body>
	<table>
		<tr>
			<td>가입된 아이디</td>
		</tr>
		<tr>
			<td>${SfindId}</td>
		</tr>
	</table>
		<input type="button" value="로그인하기" onclick="returnLogin()"/>
</body>
</html>