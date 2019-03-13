<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="resources/css/mstyle.css">
<title>Insert title here</title>
</head>
<body>
	<h3>write_view.jsp</h3>
		<form action="write" method="post">
		<table>
			<tr>
				<td class="left">이름</td>
				<td><input type="text" name="master" size="30"></td>
			</tr>
			<tr>
				<td class="left">제목</td>
				<td><input type="text" name="mTitle" size="30""></td>
			</tr>
			<tr>
				<td class="left">내용</td>
				<td><input type="text" name="mContent" rows="5" cols="50"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="submit" value="입력" />&nbsp;&nbsp;
				<a href="list">목록보기</a>
				</td>
			</tr>
		</table>
		</form>
</body>
</html>
<%@include file="../footer.jsp"%>