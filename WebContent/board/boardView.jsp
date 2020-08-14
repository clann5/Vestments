<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/template/header.jsp">
	<jsp:param value="게시판 작성" name="title"/>
</jsp:include>

<script>
	// 게시글 작성
	function fn_boardInsert(f){
		f.action = '/Home/boardInsert.board';
		f.submit();
	}
	// 게시글 목록
	function fn_boardList(f){
		f.action = '/Home/boardList.board';
		f.submit();
	}
	// 댓글 작성 화면으로 이동
	function fn_replyInsertPage(f){
		f.action = '/Home/replyInsertPage.board';
		f.submit();
	}
	// 댓글삭제
	function fn_boardDelete(f){
		if (confirm('삭제할까요?')) {
			f.action = '/Home/boardDelete.board';
			f.submit();
		}
	}
</script>

	<form method="post">
		<h3>${bDto.bNo}번 게시글</h3>
		
		작성자<br/>
		${bDto.mId}<br/><br/>
		
		제목<br/>
		${bDto.bTitle}<br/><br/>
		
		작성일<br/>
		${bDto.bRegDate}<br/><br/>
		
		최종 수정일<br/>
		${bDto.bLastModify}<br/><br/>
		
		작성 IP<br/>
		${bDto.bIp}<br/><br/>
		
		조회수<br/>
		${bDto.bHit}<br/><br/>
		
		내용<br/>
		<pre>${bDto.bContent}</pre><br/><br/>
		

		<input type="hidden" name="page" value="${page}" >
		<input type="hidden" name="bNo" value="${bDto.bNo}" >		
		
		<input type="button" value="목록으로 이동하기" onclick="fn_boardList(this.form)"/>
		<!-- 로그인 상태일 때만 댓글을 달 수 있다. -->
		<!-- 대댓글 방지를 위해서 원글에만 댓글 달기를 표시한다. -->
		<c:if test="${loginUser ne null and bDto.bDepth eq 0}">
			<input type="button" value="댓글달기" onclick="fn_replyInsertPage(this.form)"/>
		</c:if>
		
		<!-- 작성자만 삭제가능 -->
		<c:if test="${loginUser.mId eq bDto.mId }">
			<input type="button" value="삭제하기" onclick="fn_boardDelete(this.form)" />
		</c:if>
	</form>
	
	
<br/><br/>
<%@ include file="/template/footer.jsp" %>