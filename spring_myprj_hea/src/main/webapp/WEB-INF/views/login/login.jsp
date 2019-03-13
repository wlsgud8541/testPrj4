<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<script>
/*  function checkValue() {
	inputForm=eval("document.loginInfo");
	if(!inputForm.userId.value){
		alert("아이디 입력");
		inputForm.userId.focus();
		return false;
	}
	if(!inputForm.usePw.value){
		alert("패스워드 입력");
		inputForm.userPw.focus();
		return false;
	}
} */ 
function join() {
	location.href="join";
}
</script>

</head>
<body>
	<h3>login.jsp</h3>
	<div>
		<div id="wrap">
			<form method="post" action="loginAction"
				onsubmit="return checkValue()">
				<table>
					<tr>
						<td >아이디</td>
						<td><input type="text" name="userId" maxlength="30"></td>
					</tr>
					<tr>
						<td>비밀번호</td>
						<td><input type="password" name="userPw" maxlength="30"></td>
					</tr>
				</table>
				<input type="submit" value="로그인" />
				<input type="button" value="회원가입" onclick="join()" />
				<a href="findIdview">아이디 찾기</a>
				<a href="findPwview">비밀번호 찾기</a>
				<br>
				<% 
				String error=(String)session.getAttribute("error");
				if(error!=null){
				%>
				<input type="text" id="check" value="<%=error%>" />
				<% session.invalidate();} %>
			</form>
		</div>
	</div>
</body>
</html>
<%@include file="../footer.jsp"%>