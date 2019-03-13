<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<h3>답변</h3>
<body>
		<form action="qreply" method="post">
			<input type="hidden" name="qNum" value="${reply_view.qNum }" /> <input
				type="hidden" name="qGroup" value="${reply_view.qGroup }" /> <input
				type="hidden" name="qStep" value="${reply_view.qStep }" /> <input
				type="hidden" name="qIndent" value="${reply_view.qIndent }" />
			<table>

			<tr>
				<td>번호</td>
				<td>${reply_view.qNum }</td>
			</tr>
			<tr>
				<td>조회수</td>
				<td>${reply_view.qHit }</td>
			</tr>
			<tr>
				<td>닉네임</td>
				<td>${reply_view.userNick }</td>
			</tr>
			<tr>
				<td>제목</td>
				<td><input type="text" name="qTitle"
				value="${reply_view.qTitle }"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><textarea rows="5" cols="50" name="qContent">
				${reply_view.qContent }</textarea></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="답변" />
			</tr>
		</table>
	</form>
</body>
</html>
<%@include file="../footer.jsp"%>