<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/template/header.jsp">
	<c:param name="title" value="로그인페이지" ></c:param>
</c:import>
<br/><br/>

<script>
	
	
	function popupId(){
		var action = '/Home/findIdPage.member';
		var popOption = 'width = 500, height = 300, top = 150';
		window.open(action, "test", popOption);
		
	}
	
</script>

<h3>로그인 페이지입니다.</h3>
<form method="post">
	<table>
		<tr>
			<td><input type="text" name="mId" placeholder="아이디" /><br/></td>
			<td rowspan="2" style="vertical-align: middle;">
			<input type="button"value="로그인" onclick="fn_login(this.form)"/></td>
		</tr>
		<tr>
			<td><input type="password" name="mPw" placeholder="****" /></td>
		</tr>
	</table>
		<input type="button" value="아이디 찾기" onclick="popupId()">
		<input type="button" value="비밀번호 찾기" onclick="location.href='/Home/findPwPage.member'">
</form>
<br/><br/>

<jsp:include page="/template/footer.jsp"></jsp:include>