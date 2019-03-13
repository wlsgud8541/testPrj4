<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
	/* function pageChange1() {
		document.getElementById("infoPage").src = "http://localhost:8900/spring_myprj/master/enUserVideo"
	}
	function pageChange2() {
		document.getElementById("infoPage").src = "http://localhost:8900/spring_myprj/master/memberInfo"
	} */
	function btn_comResult() {
		document.all.userNick.style.border = "1px solid #dddddd";
		document.all.userNick.readOnly = false;
		document.all.comResultOk.style.display = "inline";
		document.all.comResult.style.display = "none";
	}
	function btn_comResultOk() {
		document.all.comResultOk.style.display = "none";
		document.all.comResult.style.display = "inline";
		document.all.userNick.readOnly = true;
	}
	function master_userSelect() {
		var div1 = document.getElementById('m_userSelect');
		var div2 = document.getElementById('m_userNotice');
		if(div1.style.display == 'none'){
			div1.stlte.display = 'inline';
		}
		if(div2.style.display == 'inline'){
			div2.style.display = 'none';
		}
	}
	function master_userNotice() {
		var div1 = document.getElementById('m_userSelect');
		var div2 = document.getElementById('m_userNotice');
		if (div1.style.display == 'inline') {
			div1.style.display = 'none';
		}
		if(div2.style.display == 'none'){
			div2.stlye.display = 'inline';
		}
	}

	/* $(function() {
		$("#comResultOk").click(
				function() {

					//confirm->확인alert
					if (confirm("수정하시겠습니까?")) {
						var compulsionModifyForm = $(
								"[id='compulsionModifyForm']").serialize();
						$.ajax({
							url : "nickModify",
							type : "post",
							data : compulsionModifyForm,

							error : function() {
								alert("시스템 오류입니다.");
							},
							success : function(comResultData) {
								if (comResultData == "2") {
									alert("수정실패");
									false;
								} else if (comResultData == "1") {
									alert("수정완료");
									location.href = "mpSelectUser?userNum="
											+ $("#userNum").val();
								}
							}
						});
					}
				});
	}); */
</script>
<style>
#pageChange {
	display: inline;
}

#infoPage {
	display: block;
}
-
</style>
<body>
	<h3>mpSelectUser.jsp-회원관리</h3>
	<form action="serchUser">
		<input type="text" name="sUser" placeholder="아이디 또는 이름으로 회원찾기">
		<input type="submit" value="검새끼">
	</form>
	<table border="1">
		<caption>회원 리스트</caption>
		<tr>
			<th>이름</th>
			<th>아이디</th>
			<th>닉네임</th>
		</tr>
		<c:forEach items="${selectAll}" var="sa">
			<%-- <input type="hidden" name="choiceUserNum" value="${sa.userNum}"> --%>
			<tr>
				<td>${sa.userName}</td>
				<td>${sa.userId}</td>
				<td>${sa.userNick}</td>
				<td><a href="choiceUser?choiceUserNum=${sa.userNum}">정보조회</a></td>
			</tr>
		</c:forEach>

	</table>
	<table border="1">
		<c:forEach items="${seUser}" var="se">
			<tr>
				<td>${se.userName}</td>
				<td>${se.userId}</td>
				<td>${se.userNick}</td>
				<td><a href="choiceUser?choiceUserNum=${se.userNum}">정보조회</a></td>
			</tr>
		</c:forEach>
	</table>
	<br>
	<hr>
	<br>

	<input type="button" value="회원 정보보기" onclick="master_userSelect()"
		id="userSelect" />
	<input type="button" value="회원 게시물보기" onclick="master_userNotice()"
		id="userNotice" />
	<input type="button" value="회원 댓글보기" onclick="master_userComment()"
		id="userComment" /><br><br>
	<div id="m_userSelect">
		<fieldset>
			<br> <br>
			<form action="nickModify">
				<input type="hidden" name="userNum" value="${cUser.userNum }" />
				<table>
					<caption>회원 정보 조회</caption>
					<tr>
						<td>이름 :</td>
						<td><input type="text" name="userName"
							value="${cUser.userName}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>아이디 :</td>
						<td><input type="text" id="userId" name="userId"
							value="${cUser.userId}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>닉네임 :</td>
						<td><input type="text" name="userNick"
							value="${cUser.userNick}" readonly="readonly"></td>
						<td><input type="button" value="강제 정보수정" id="comResult"
							onclick="btn_comResult()" /></td>
						<td><input type="submit" value="저장" id="comResultOk"
							onclick="btn_comResultOk()" style="display: none;" /></td>
					</tr>
					<tr>
						<td>가입날짜 :</td>
						<td><input type="text" name="userNum"
							value="${cUser.userJoin}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>주소 :</td>
						<td><input type="text" name="userAddr"
							value="${cUser.userAddr}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>핸드폰번호 :</td>
						<td><input type="text" name="userphone"
							value="${cUser.userPhone}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>이메일 :</td>
						<td><input type="text" name="eMail" value="${cUser.eMail}"
							readonly="readonly"></td>
					</tr>
					<tr>
						<td>성별 :</td>
						<td><input type="text" name="userGender"
							value="${cUser.userGender}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>생년월일 :</td>
						<td><input type="text" name="userIden"
							value="${cUser.userIden}" readonly="readonly"></td>
					</tr>
					<tr>
						<td>관심분야 :</td>
						<td><input type="text" name="userInterests"
							value="${cUser.userInterests}" readonly="readonly"></td>
					</tr>
				</table>
			</form>
			<form action="mpUserDelete">
				<input type="hidden" value="${cUser.userId }" name="userId">
				<input type="submit" value="탈퇴시키기" id="deleteBtn" />
			</form>
		</fieldset>
	</div>
	<div style="display: none;" id="m_userNotice">
		<fieldset>
			<!-- <input type="button" value="회원 정보보기" onclick="master_userSelect()" />
			<input type="button" value="회원 게시물보기" onclick="master_userNotice()" />
			<input type="button" value="회원 댓글보기" onclick="master_userComment()" /> -->
			<form action="mUserVideo">
				<table>
					<h3>master_userNotice.jsp-회원게시물보기</h3>
				</table>
			</form>
		</fieldset>
	</div>

</body>
</html>