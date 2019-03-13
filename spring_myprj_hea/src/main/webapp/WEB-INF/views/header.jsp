<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<style>
#id{
	display: inline-block;
}
#sidemenu{
	display: inline-block;
}
#selectmenu{
	display: inline-block;
}
#loginmenu{
	display: inline-block;
}
#logo{
	display: inline-block;
}
.sideMenu{
	height: 100%;
	width: 0;
	position: fixed;
	z-index:1;
	top: 0;
	left: 0;
	background-color: white;
	overflow-x:hidden;
	transition:0.3s ease-in-out;
	padding-top: 60px;	
}

.sideMenu a{
	padding: 8px 8px 8px 32px;
	text-decoration: none;
	font-size: 25px;
	color: gray;
	display: block;
	transition:0.5s ease-in-out;
}

.sideMenu a:hover, .offcanvas a:focus {
	color: black;
}

.closeBtn {
	position: absolute;
	top: 0;
	right: 25px;
	font-size: 36px !important;
	margin-left: 50px;
}
.openBtn:hover {
	color:rgb(0,154,200);
	transition:0.6s ease-in-out;
}
.openBtn {
	font-size: 25px;
	cursor:pointer;
	transition:0.6s ease-in-out;			
}

/* ---------------------------------------- */

</style>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script>
	function openSideMenu() {
		document.getElementById('sideMenu').style.width='250px';
		document.getElementById('main').style.marginLeft='250px';
	}
	function closeSideMenu() {
		document.getElementById('sideMenu').style.width='0';
		document.getElementById('main').style.marginLeft = '0';
	}
	
</script>

</head>
<body><!-- 해더 필요기능? 사이드 메뉴  로그인 버튼 -->
		<div id="mainmenu">			
			<a id="openBtn" onclick="openSideMenu()">메뉴</a>

			<div id="sideMenu" class="sideMenu">
				<a href="#" class="closeBtn" onclick="closeSideMenu()">닫기</a>
			<%
			String userId=(String)session.getAttribute("userId");
			if(userId==null){ 
			%>
				<a href="/spring_myprj/login/login">로그인</a>
				<a href="/spring_myprj/login/login">질문게시판</a>
				<a href="/spring_myprj/login/login">공지게시판</a>
				<a href="/spring_myprj/login/login">마이페이지</a>
				<a href="/spring_myprj/masterpage">관리자페이지</a>
			<%}
			if(userId!=null){
			%>
				<a href="/spring_myprj/login/login">로그아웃</a>
				<a href="/spring_myprj/qna/qlist">질문게시판</a>
				<a href="/spring_myprj/notice/list">공지게시판</a>
				<a href="#">마이페이지</a>
				<a href="/spring_myprj/masterpage">관리자페이지</a>
			<%} %>
			</div>
			<div id="logo">
			<a href="/spring_myprj/">
				<img alt="logoImage" src="resources/image/logo.PNG">
			</a>
			</div>

			<div id="selectmenu">
				<form action="serchVideo">
					<input type="text" name="sVideo" value="검색">
					<input type="submit" value="검색">
				</form>
			</div>		
		
			<div id="loginmenu">
			<%
			if(userId==null){ 
			%>
			<a href="/spring_myprj/login/login">login</a>
			<%} 
			if(userId!=null){
			%>
			<input type="text" id="check" value="<%=userId%>님 환영합니다." disabled />
			<form action="/spring_myprj/login/login">
			<input type="submit" value="로그아웃">
			</form>
			<%} %>
			</div>
		</div>
