<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>글쓰기</h3>
		<form action="qwrite" method="post">
	<table>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="userNick" size="30"  value="${uInfo.userId}" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="qTitle" size="30" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea name="qContent" rows="5" cols="30" ></textarea></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="입력" />&nbsp;&nbsp;
				<a href="qlist">목록보기</a>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>
<%@include file="../footer.jsp"%>
