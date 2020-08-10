<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:import url="/template/header.jsp" charEncoding="utf-8" >
	<c:param name="title" value="회원가입화면"></c:param>
</c:import>

<script type="text/javascript">
	
	var idPass = false;
	var pwPass = false;
	
	$(function(){
		fn_signup();
		fn_idCheck();
		fn_pwCheck();
	});
	
	function fn_idCheck(){
		//	5 ~ 20 사이의 소문자나 숫자를 사용한다.
		//	첫 글자는 소문자이다.
		var regExpId = /^[a-z][a-z0-9]{4,19}$/;
		$('#mId').keyup(function(){
			$.ajax({
				url:'/Home/idCheck.member',
				type:'post',
				data:'mId=' + $('#mId').val(),
				dataType:'json',
				success:function(obj){
					if ( regExpId.test($('#mId').val()) ) {
						if (obj.isPossible) {
							$('#idCheckResult').text('가입이 가능한 아이디입니다.');
							$('#idCheckResult').css('color','blue');
							idPass = true;
						} else {
							$('#idCheckResult').text('이미 존재하는 아이디입니다.');
							$('#idCheckResult').css('color','red');
						}
					} else {
						$('#idCheckResult').text('아이디는 5~20자의 소문자/숫자만 가능합니다.');
						$('#idCheckResult').css('color','red');
					}
				},
				error:function(){
					$('#idCheckResult').text('알 수 없는 에러');
				}
			});
		});
	};
	
	function fn_pwCheck(){
		// 4~20자리 소문자,대문자,숫자 사용(필수 없음)
		var regExpPw = /[a-z0-9A-Z]{4,20}$/;
		$('#mPw').keyup(function(){
			if (regExpPw.test($('#mPw').val())) {
				$('#pwCheckResult').text('비밀번호 사용이 가능합니다.');
				$('#pwCheckResult').css('color','blue');
			} else {
				$('#pwCheckResult').text('비밀번호는 4자리 이상의 알파벳과 숫자만 가능합니다.');
				$('#pwCheckResult').css('color','red');
			}
		});
		$('#mPw2').keyup(function(){
			if ($('#mPw').val() == $('#mPw2').val()) {
				$('#pw2CheckResult').text('비밀번호가 일치합니다.');
				$('#pw2CheckResult').css('color','blue');
				pwPass = true;
			} else {
				$('#pw2CheckResult').text('비밀번호가 일치하지 않습니다.');
				$('#pw2CheckResult').css('color','red');
			}
		});
	};
	
	function fn_signup(){
		$('#signupBtn').click(function(){
			if (idPass == true && pwPass == true) {
				$.ajax({
					url:'/Home/signup.member',
					type:'post',
					data: $('#f').serialize(),
					dataType: 'json',
					success:function(obj){
						if (obj.isSuccess) {
							alert('회원가입을 환영합니다.');
							location.href = '/Home/loginPage.member';
						} else {
							alert('필수 입력 항목을 모두 채워주세요');
						}
					},
					error:function(){
						alert('정보를 바르게 입력해주세요');
					}
				});
			}
		});
	};
</script>

<form id="f" method="post">
		<h3>회원가입</h3>
		
		아이디<br/>
		<input id="mId" type="text" name="mId" autofocus /><br>
		<div id="idCheckResult"></div><br/>
		비밀번호<br>
		<input id="mPw" type="password" name="mPw" /><br><br>
		<div id="pwCheckResult"></div><br/>
		비밀번호 확인<br>
		<input id="mPw2" type="password" name="mPw2" /><br><br>
		<div id="pw2CheckResult"></div><br/>
		이름<br/>
		<input id="mName" type="text" name="mName" /><br><br>
		이메일<br/>
		<input id="mEmail" type="text" name="mEmail" /><br><br>
		전화<br/>
		<input id="mPhone" type="text" name="mPhone" /><br><br>
		주소<br/>
		<input id="mAddress" type="text" name="mAddress" /><br><br>
		
		<input id="signupBtn" type="button" value="회원가입"/>
		<input id="clearBtn" type="button" value="입력취소"/>
	</form>

</body>
</html>