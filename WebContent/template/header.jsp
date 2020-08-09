<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><c:out value="${param.title}"></c:out></title>
<link type="text/css" rel="stylesheet" href="/Home/assets/css/style.css">
<link type="text/css" rel="stylesheet" href="/Home/assets/css/reset.css">
<script src="/Home/assets/js/jquery-3.5.1.min.js"></script>
<!--
<script src="https://code.jquery.com/jquery-migrate-3.3.1.min.js"></script>
-->
</head>
<body>
	<div id="wrap">
		<header id="header-wrap">
			<ul class="header_list">
				<li><a href="/Home/index.member">홈으로</a></li> 
				<li><a href="">2</a></li>
				<li><a href="">3</a></li>
				<li><a href="/Home/guide/roadmap.jsp">찾아오는 길</a></li>
				<li><a href="">5</a></li>
				<li><a href="">6</a></li>
				<li><a href="/Home/signupPage.member">회원가입</a></li>
				<li>
					<c:if test="${sessionScope.loginuser eq null }">
						<a href="/Home/loginPage.member">로그인페이지</a>
					</c:if>
					<c:if test="${sessionScope.loginuser ne null }">
						<a href="">로그아웃</a>
					</c:if>
				</li>
			</ul>
		</header>
		
		<div id="main-wrap">
