<%-- <%@page import="com.java.spring_myprj.dao.home_dao.HomeDao"%>
<%@page import="com.java.spring_myprj.dao.VideoDao"%> --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="header.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">


//유튜브 플레이어 사용부
var player;
    function onYouTubeIframeAPIReady() {
    	console.log("check onYouTubeIframeAPIReady");
		player = new YT.Player('player', {
			 events: {
		       'onReady': onPlayerReady,
		       'onStateChange': onPlayerStateChange
		     }
		 });
	}
	//비디오 플레이어가 준비되면 비디오 재생
	function onPlayerReady(event) {
		console.log("onPlayerReady");
        event.target.playVideo(); 
    }
	//비디오 상태가 변경될 때마다 실행
	function onPlayerStateChange(event) {
		console.log("StateChange"+event.data);
		if (event.data == YT.PlayerState.ENDED) {
			console.log("동영상 종료됨");
		}
		if (event.data == YT.PlayerState.PLAYING) {
			console.log("동영상 재생중");
		}
		if (event.data == YT.PlayerState.PAUSED) {
			console.log("동영상 일시중지 됨");
		}
		if (event.data == YT.PlayerState.BUFFERING) {
			console.log("동영상 버퍼링중");
		}
		if (event.data == YT.PlayerState.CUED) {
			console.log("동영상 재생준비 완료됨");
		}
		if (event.data == -1) {
			console.log("동영상 시작되지 않음");
		}
	}
	//youtube api가져오기
	var tag = document.createElement('script');
	tag.src = "https://www.youtube.com/iframe_api";
	var firstScriptTag = document.getElementsByTagName('script')[0];
	firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

//댓글부	
$(function(){
	$("#reviewModifyBtn").click(function () {
	
		//confirm->확인alert
		if(confirm("수정하시겠습니까?")){
			var reviewModifyForm = $("[id='reviewModifyForm']").serialize();
			$.ajax({
				url:"vrModify",/* 컨트롤러에 있는 vrModify로 맵핑*/
				type:"post",
				data: reviewModifyForm,
				error: function () {
					alert("시스템 오류입니다. 관리자에게 문의하세요.");
				},
				success: function (resultData) {
					if(resultData=="2"){
						alert("수정실패");
						false;
					}else if(resultData=="1"){
						alert("수정완료");
						location.href="videoView?vNum="+$("#vNum").val();
					}
				}
			});
		}
	});
});
</script>
<style>
body {
	background-color: gray;
}

#all {
	outline: 1px solid black;
	width: 100%;
	height: 450px;
}

#contents {
	float: left;
	display: inline-block;
	outline-offset: -10px;
	text-align: center;
	width: 60%;
	height: 450px;
	background-color: gray;
}
#contents_table{
	text-align: center;
	width: 50%;
}
#vlist {
	float: left;
	display: inline-block;
	outline: 2px solid #92b0b3;
	outline-offset: -10px;
	text-align: center;
	width: 40%;
	height: 450px;
	background-color: white;
}
ul li{
	list-style: none;
}

</style>
</head>
<body id="main">
	<h3>${vView.vTitle}</h3>
	<div id="all">
		<div id="contents">
			<iframe id="player" 
					width="100%" 
					height="100%" 
					type="text/html"
					src="${vView.vContent}?rel=0&amp;autoplay=1&amp;enablejsapi=1&amp;version=3&amp;playerapiid=player"
					allowfullscreen></iframe>
		</div>
		<div id="vlist" style="overflow:scroll;">
			<br>play list
				<table border="1" >
					<c:forEach var="ran" items="${randomList}">
					<tr>
						<td><img alt="notfound" src="${ran.vImage}" width="100px" height="50px"></td>
						<td>${ran.vTitle}</td>
					</tr>
					</c:forEach>
				</table>
		</div>
	</div>
	<hr>
	
	
	<!-- 글수정 -->
	<div id="div2">
		<form id="reviewModifyForm">
			<table border="1">
				<colgroup>
					<col width="60%">
					<col width="20%">
					<col width="20%">
				</colgroup>
				<tr>
					<th>글내용</th>
					<th>아이디</th>
					<th>작성일</th>
				</tr>
				<c:forEach var="vre" items="${vReview}">
					<c:choose>
						<c:when test="${vre.rNum eq reNum }">
							<tr>
								<td>
								<input type="text"  value="${vre.rContent}" name="revContent">
								<input type="hidden" value="${vre.rNum}" name="rNum">
								<input type="hidden" value="${vView.vNum}" name="vNum">
								<input type="hidden" value="${vView.userInterests}" id="userInterests" name="userInterests">
								<input type="button" id="reviewModifyBtn" value="확인">
								</td>
								<td>${vre.userNick}</td>
								<td>${vre.rDate}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td>${vre.rContent} 
								<%
								String uId=(String)session.getAttribute("userId");//로그인 되어있는 아이디.
								String checkUserNick=(String)session.getAttribute("checkUserNick"); //게시글에 작성되어있는 아이디.
								if(uId.equals(checkUserNick)){
								%>
									<a href="vrModifyView?rNum=${vre.rNum}&vNum=${vView.vNum}&userInterests=${vView.userInterests}">수정</a>
									<a href="vrDelete?rNum=${vre.rNum}&vNum=${vView.vNum}&userInterests=${vView.userInterests}">삭제</a>
								<%}%>
								</td>
								<td>${vre.userNick}</td>
								<td>${vre.rDate}</td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</table>
		</form>
	<form action="rWrite">
			<table border="1">
				<colgroup>
					<col width="20%">
					<col width="70%">
					<col width="10%">
				</colgroup>
				<tr>
					<!-- 로그인시에만 활성화 되게끔하기 -->
					<!-- 댓글내용, 댓글쓴사람, 댓쓴날짜  -->
					<td>댓글입력</td>
					<td><input type="text" name="reply" > 
					<input type="hidden" name="vNum" value="${vView.vNum}" >
					<input type="hidden" name="userInterests" value="${vView.userInterests}" ></td>
					<td><input type="submit" value="입력"></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>
<%@include file="footer.jsp"%>