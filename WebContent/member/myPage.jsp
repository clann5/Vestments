<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/template/header.jsp">
	<jsp:param value="회원가입" name="title" />
</jsp:include>
<br/><br/>

	<script>
		$(function(){
			$('#updateInfoBtn').click(function(){
				$.ajax({
					url: '/Home/updateInfo.member',
					type: 'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success:function(obj){
						if (obj.isSuccess) {
							alert('회원정보가 수정되었습니다.');
						} else {
							alert('회원 정보가 수정되지 않았습니다.');
						}
						location.href = '/Home/myPage.member';
					},
					error:function(){
						alert('실패!');
					}
				})
			});
			$('#updatePwBtn').click(function(){
				location.href='/Home/changePw.member';
			});
		});
	</script>

	<form id="f" method="post">
		<h3>마이페이지</h3>
	
		아이디<br/>
		<input id="mId" type="text" name="mId" value="${loginUser.mId}" readonly /><br/>
		이름<br/>	
		<input id="mName" type="text" name="mName" value="${loginUser.mName}" /><br/><br/>
		이메일<br/>	
		<input id="mEmail" type="text" name="mEmail" value="${loginUser.mEmail}" /><br/>
		전화<br/>	
		<input id="mPhone" type="text" name="mPhone" value="${loginUser.mPhone}" /><br/>
		주소<br/>	
		<input id="mAddress" type="text" name="mAddress" value="${loginUser.mAddress}" /><br/><br/>
		가입일<br/>
		<input id="mRegDate" type="text" name="mRegDate" value="${loginUser.mRegDate}" readonly /><br/><br/>
		
		<input id="updateInfoBtn" type="button" value="회원정보수정하기" />
		<input id="updatePwBtn" type="button" value="비밀번호수정하기" />
	</form>
	

<%@ include file="/template/footer.jsp" %>
