<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<% request.setCharacterEncoding("utf-8"); %>
<jsp:include page="/template/header.jsp">
	<jsp:param value="게시판목록" name="title"/>
</jsp:include>

<script>

	function fn_boardInsertPage(f){
		f.action = "/Home/boardInsertPage.board";
		f.submit();
	}

	function fn_myBoardList(f){
		f.action = "/Home/myBoardList.board"
		f.submit();
	}
	
	function fn_boardList(f){
		f.action = "/Home/boardList.board";
		f.submit();
	}
	
	function fn_queryBoardList(f){
		f.action = "/Home/queryBoardList.board";
		f.submit();
	}
</script>

	<form>
		<!-- 게시판 검색  -->
		<select name="column">
			<option value="BTITLE">제목</option>	<!-- db 칼럼이름과 맞춤 -->
			<option value="BCONTENT">내용</option>
			<option value="BOTH">제목 + 내용</option>
		</select>
		<input type="text" name="query" />
		<input type="button" value="검색" onclick="fn_queryBoardList(this.form)" />
	</form>
	<br/><br/>
	<form>
		<br/><br/>
		
		<!-- 게시판 작성 버튼 : 로그인 해야 작성 가능 -->
		<input type="hidden" name="page" value="${page}" />
		<input type="button" value="전체목록보기" onclick="fn_boardList(this.form)" />
		<c:if test="${loginUser ne null}">
			<input type="button" value="새 게시글 작성하기" onclick="fn_boardInsertPage(this.form)" />
			<input type="button" value="내 게시글 보기" onclick="fn_myBoardList(this.form)" />
			<input type="hidden" name="mId" value="${loginUser.mId}"/>
		</c:if>
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
						<td>
							<!-- 1. 댓글은 bDepth 만큼 들여쓰기를 한다. -->
							<c:forEach begin="1" end="${bDto.bDepth}" step="1" >
								&nbsp;&nbsp;&nbsp;
							</c:forEach>
							
							<!-- 2. 댓글은 제목 앞에 ㄴRe. 를 표시한다. -->
							<c:if test="${bDto.bDepth ne 0 }">
								ㄴ Re : &nbsp;
							</c:if>
							
							<!-- 3. 삭제된 게시글은 링크를 제공하지 않는다. -->
							<c:if test="${bDto.bDelete eq 0}">
								<a href="/Home/boardView.board?bNo=${bDto.bNo}&page=${page}">${bDto.bTitle}</a>
							</c:if>
							
							<c:if test="${bDto.bDelete eq -1}">
								${bDto.bTitle}(삭제된 게시글입니다.)
							</c:if>
							
						</td>
						<td>${bDto.mId}</td>
						<td>${bDto.bRegDate}</td>
						<td>${bDto.bHit}</td>
					</tr>
				</c:forEach>
			</c:if>
		</tbody>
		<tfoot>
			<tr>
				<td colspan="4">${paging}</td>
			</tr>
		</tfoot>
	</table>


<br/><br/>
<%@ include file="/template/footer.jsp" %>