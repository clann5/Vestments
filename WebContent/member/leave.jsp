<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/template/header.jsp">
	<jsp:param value="로그인" name="title"/>
</jsp:include>
<br/><br/>

<script>
	$(document).ready(function(){
		$('#leaveBtn').click(function(){

			if ( $('#mId').val() == '' ) {
				alert('아이디를 입력하세요.');
				$('#mId').focus();
				return false;
			} else if ( $('#mId').val() != '${loginUser.mId}' ) {
				alert('아이디를 확인하세요.');
				return false;
			}
			
			if ( $('#mPw').val() == '' ) {
				alert('비밀번호를 입력하세요.');
				$('#mPw').focus();
				return false;
			} else if ( $('#mPw').val() != '${loginUser.mPw}' ) {
				alert('비밀번호를 확인하세요.');
				return false;
			}
			
			if (!confirm('탈퇴하시겠습니까?')) {
				return false;
			}
			$.ajax({
				url: '/Home/leave.member',
				dataType: 'json',
				success: function(obj) {
					if ( obj.isSuccess ) {
						alert('탈퇴되었습니다. 이용해 주셔서 감사합니다.');
						location.href = '/Home/index.member';
					} else {
						alert('탈퇴되지 않았습니다.');
						history.back();
					}
				},
				error: function() {
					alert('실패');
				}
			});
		});
	});
	
</script>

	<form method="post">
		<h3> 탈퇴할 아이디와 비밀번호를 입력하세요</h3>
		
		<input id="mId"  type="text" name="mId" placeholder="아이디" /><br>
		<input id="mPw"  type="password" name="mPw" placeholder="****" /><br><br>
		<input id="leaveBtn" type="button" value="회원탈퇴" />
		<br><br>
	</form>

<%@ include file="/template/footer.jsp" %>
