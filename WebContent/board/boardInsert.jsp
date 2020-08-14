<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/template/header.jsp">
	<jsp:param value="게시판 작성" name="title"/>
</jsp:include>

<script>

	function fn_boardInsert(f){
		f.action = '/Home/boardInsert.board';
		f.submit();
	}

</script>

	<form method="post">
		<h3>게시글 작성</h3>
		
		작성자<br/>
		<input type="text" name="mId" value="${loginUser.mId}" readonly /><br/><br/>
		
		제목<br/>
		<input type="text" name="bTitle" autofocus /><br/><br/>
		
		내용<br/>
		<textarea name="bContent" rows="5" cols="30" placeholder="매너있게!" ></textarea><br/><br/>
		
		<input type="button" value="등록하기" onclick="fn_boardInsert(this.form)"/>
		<input type="reset" value="다시작성"/>
		<input type="button" value="목록으로 이동하기" onclick="location.href='/Home/boardList.board'"/>
			
	</form>
	
	<!-- 게시판 목록 -->
	전체 ${totalRecord}개<br/>
	<table>
		<thead>
			<tr>
				<td>제목</td>
				<td>작성자</td>
				<td>작성일</td>
				<td>조회수</td>
			</tr>
		</thead>
		<tbody>
			<c:if test="${empty list}">
				<tr>
					<td colspan="4">작성된 게시글이 없습니다.</td>
				</tr>
			</c:if>
		
			<c:if test="${not empty list}">
				<c:forEach var="bDto" items="${list}">
					<tr>
						<td>${bDto.bTitle}</td>
						<td>${bDto.mId}</td>
						<td>${bDto.bRegDate}</td>
						<td>${bDto.bHit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">페이징 표시할 영역</td>
			</tr>
		</tfoot>
	</table>


<br/><br/>
<%@ include file="/template/footer.jsp" %>