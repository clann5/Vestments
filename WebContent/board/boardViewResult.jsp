<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<script type="text/javascript">
		vaf f = document.forms.f;
		if (${bDto} == null) {
			alert('게시글의 정보를 확인할 수 없습니다.');
			history.back();
		} else {
			f.action = 'board/boardView.jsp';
			f.submit();
		}
	</script>
	<form name="f">
		<input type="hidden" name="bDto" value="${bDto}" />
	</form>
</body>
</html>