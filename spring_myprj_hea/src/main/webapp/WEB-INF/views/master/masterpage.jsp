<%@page import="java.util.function.Function"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
	#modify{
	width: 400px;
	height: 800px;
	margin-right: 100px;
	}
	#statistics{
	width: 400px;
	height: 800px;
	}
</style>
<script type="text/javascript">
function mpSelectUser(){
	location.href="master/mpSelectUser";
}
function mpStatisticsUser(){
	location.href="master/mpStatisticsUser";
}
</script>
</head>
<body>
<h3>MasterPage.jsp</h3>
<!-- <iframe src="mpmodifyuser" width="40%" 
height="800px" frameborder="1" marginwidth="left">회원관리</iframe> -->
<!-- <iframe src="login/join" width="40%" 
height="800px" frameborder="1" marginwidth="right">통계확인</iframe> -->
<input type="button" value="회원관리" id="modify" onclick="mpSelectUser()">
<input type="button" value="통계확인" id="statistics" onclick="mpStatisticsUser()">
</body>
</html>