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
	<h3>수정</h3>

		<form action="qna/qmodify" method="post">
		<input type="hidden" name="qNum" value="${list.qNum }">
			<table border="1">
			<tr>
				<td>번호</td>
				<td>${list.qNum }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${list.qHit }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td><input type="text" name="userNick"
					value="${userId}" disabled /></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="qTitle"
					value="${list.qTitle }" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="30" type="text" name="qContent">
						${list.qContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="수정" />&nbsp;&nbsp;
				<a href="qlist">목록보기</a>&nbsp;&nbsp;
				<a href="qdeleted?qNum=${list.qNum }">삭제</a>&nbsp;&nbsp;
				<a href="qreply_view?qNum=${list.qNum }">답변</a>
				</td>

			</tr>


			</table>
		</form>
</body>
</html>
<%@include file="../footer.jsp"%>