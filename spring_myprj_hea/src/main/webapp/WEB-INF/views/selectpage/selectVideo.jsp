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
<hr>
<h3>select video</h3>
비디오 검색결과
	<table>
		<c:forEach items="${selectVideo}" var="sV">
		<tr>
			<td></td>
			<td>
				<a href="videoView?vNum=${sV.vNum }" >
					<img alt="not found" src="${sV.vImage}" width="200px" height="100px">
				</a>
			</td>
			<td>
				<a href="videoView?vNum=${sV.vNum }" >
					${sV.vTitle}
				</a>
			</td>
			<td>${sV.userId}</td>
			<td>${sV.vHit}</td>
		</tr>
		</c:forEach>

	</table>
</body>
</html>
<%@include file="../footer.jsp"%>