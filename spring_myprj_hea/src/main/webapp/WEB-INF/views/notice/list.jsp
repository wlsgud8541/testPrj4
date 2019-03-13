<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link type="text/css" rel="stylesheet" href="resources/css/mstyle.css">
<title>Insert title here</title>
</head>
<body>
	<table>
		<tr>
			<th>이름</th>
			<th>제목</th>
			<th>날짜</th>
			<th>히트</th>
		</tr>
		<c:forEach items="${list }" var="dto">
			<tr>
				<td>${dto.master }</td>
				<td><a href="content_view?master=${dto.master }">${dto.mTitle }</a></td>
				<td>${dto.mDate }</td>
				<td>${dto.mHit }</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4"><a href="write_view">글작성</a></td>
		</tr>
	</table>
</body>
</html>
<%@include file="../footer.jsp"%>