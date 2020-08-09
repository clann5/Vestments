<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/template/header.jsp">
	<c:param name="title" value="비밀번호 찾기" ></c:param>
</c:import>
<br/><br/>
 
<script type="text/javascript">

	$(function(){
		$('#findPwBtn').click(function(){
			$.ajax({
				url:'/Home/findPw.member',
				type:'post',
				data:$('#f').serialize(),
				dataType:'json',
				success:function(obj){
					if (obj.isSuccess) {
						alert('임시 비밀번호를 발송했습니다.');
						$('#findResult').text('임시 비밀번호는 ' + obj.ranPw + ' 입니다.');
					} else {
						alert('일치하는 계정이 없습니다.');
					}
				},
				error:function(){
					alert('에러');
				}
			});
		});
	});
</script>

<h3>비밀번호 찾기</h3>
입력하는 개인정보가 일치한다면 임시 비밀번호를 발급해드립니다.<br/><br/>
<form id="f" method="post">
	비밀번호를 찾고자 하는 아이디를 입력해주세요<br/>
	<input id="mId" name="mId"  type="text" autofocus/><br/>
	가입시 사용한 이메일을 입력해주세요<br/>
	<input id="mEmail" name="mEmail" /><br/>
	<input id="findPwBtn" type="button" value="임시비밀번호 발급">
</form>
<div id="findResult"></div><br/><br/>

<jsp:include page="/template/footer.jsp"></jsp:include>