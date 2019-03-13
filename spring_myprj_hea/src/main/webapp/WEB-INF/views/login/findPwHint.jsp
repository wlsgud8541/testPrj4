<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="checkPwhint">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="checkId"></td>
			</tr>
			<tr>
				<td>비밀번호 힌트</td>
				<td><select name="checkPwhintList">
						<option value="자신이 태어난곳은?">자신이 태어난곳은?</option>
						<option value="어머니 성함은?">어머니 성함은?</option>
						<option value="아버지 성함은?">아버지 성함은?</option>
						<option value="자신의 보물 1호는?">자신의 보물 1호는?</option>
						<option value="자신이 졸업한 학교이름은?">자신이 졸업한 학교이름은?</option>
						<option value="자신이 키운 애완동물 이름은?">자신이 키운 애완동물 이름은?</option>
						<option value="자신이 살고있는 동네는?">자신이 살고있는 동네는?</option>
						<option value="가장 좋아하는 음식은?">가장 좋아하는 음식은?</option>
						<option value="가장 추억에 남는 장소는?">가장 추억에 남는 장소는?</option>
						<option value="가장 좋아하는 가수는?">가장 좋아하는 가수는?</option>
						<option value="즐겨듣는 음악은?">즐겨듣는 음악은?</option>
				</select></td>
			</tr>
			<tr>
				<td><input type="text" maxlength="50" placeholder="답 입력"
					name="checkPwhint"></td>
			</tr>
		</table>
		<input type="submit" value="확인" />
	</form>
</body>
</html>