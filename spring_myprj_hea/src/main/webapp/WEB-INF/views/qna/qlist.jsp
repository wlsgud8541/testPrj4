<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../header.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>질문게시판</h3>
	<table border="1">
	<colgroup>
	<col width="5%">
	<col width="30%">
	<col width="10%">
	<col width="5%">
	<col width="3%">	
	</colgroup>
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성일</th>
			<th>닉네임</th>
			<th>조회수</th>
		</tr>
		<c:forEach items="${qlist}" var="dto">
		<tr>
		<td>${dto.qNum }</td>
		<td>
		<c:set value="${dto.qIndent }" var="endIndent" /> 
			<c:forEach begin="1" end="${dto.qIndent }" var="cnt"> &nbsp;
				<c:if test="${cnt eq endIndent }">
					<img alt="" src="resources/img/reply.png">
				</c:if>
			</c:forEach>
			
		<a href="qcontent_view?qNum=${dto.qNum }">${dto.qTitle }</a></td>
		<td>${dto.qDate }</td>
		<td>${dto.userNick }</td>
		<td>${dto.qHit }</td>
		</tr>
			</c:forEach>
		<tr>
			<td colspan="5"><a href="qwrite_view">작성</a></td>
		</tr>
	</table>

</body>
</html>
<%@include file="../footer.jsp"%>