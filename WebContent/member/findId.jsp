<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 팝업창</title>
<script src="/Home/assets/js/jquery-3.5.1.min.js"></script>
</head>
<body>

<script>

	$(function(){
		$('#findIdBtn').click(function(){
			$.ajax({
				url:'/Home/findId.member',
				type:'get',
				data: 'mEmail=' + $('#mEmail').val(),
				dataType:'json',
				success:function(obj){
					if (obj.isSuccess) {
						alert('회원님의 가입 아이디는 ' + obj.rId + '입니다');
						$('#findIdResult').text('회원님의 가입 아이디는 ' + obj.rId + ' 입니다');
						$('#findIdResult').css('color','red');
					} else {
						alert('일치하는 이메일이 없습니다.');
						$('#findIdResult').text('일치하는 이메일이 없습니다.');
						$('#findIdResult').css('color','red');
					}
				},
				error:function(){
					alert('에러');
				}
			});
		});
	});

	
</script>

<span>가입시 사용한 E-mail을 통하여 아이디를 찾아보세요</span>
<form>
	가입 당시 이메일<br/>
	<input id="mEmail" type="text" name="mEmail" autofocus /> <br/>
	<input id="findIdBtn" type="button" value="아이디찾기" />
</form>
<div id="findIdResult"></div>


<br/><br/>

</body>
</html>