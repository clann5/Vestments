<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<c:import url="/template/header.jsp" charEncoding="utf-8" >
	<c:param name="title" value="메인화면"></c:param>
</c:import>

<section class="gallery_section">
	2
</section>
<section class="info_section">
	<a href="/Home/boardList.board">게시판으로 이동</a>
</section>
<section class="popular_section">
	4
</section>
<section class="latest_section">
	5
</section>

<jsp:include page="template/footer.jsp"></jsp:include>