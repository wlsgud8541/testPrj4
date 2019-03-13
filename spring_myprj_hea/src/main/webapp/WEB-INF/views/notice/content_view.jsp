<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>content_view</h3>
		<form action="modify" method="post">
			<input type="hidden" name="master" value="${content_view.master }" />
			<input type="hidden" name="mNum" value="${content_view.mNum }" />
			<table>
			<tr>
				<td>번호</td>
				<td>${content_view.mNum }</td>
			</tr>
			<tr>
				<td>히트</td>
				<td>${content_view.mHit }</td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="master" value="${content_view.master }" /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="mTitle" value="${content_view.mTitle }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="20" cols="50" name="mContent">${content_view.mContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정" />&nbsp;&nbsp;
					<a href="list">목록보기</a>&nbsp;&nbsp;
					<a href="delete?mNum=${content_view.mNum }">삭제</a>
				</td>
			</tr>
		</table>
		</form>
</body>
</html>
<%@include file="../footer.jsp"%>