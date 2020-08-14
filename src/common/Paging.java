package common;

public class Paging {

	// path : 페이징 처리할 페이지를 표시하는 mapping 값 
	// int page : 현재 페이지 번호
	// int recordPerPage : 1페이지에 출력할 게시물의 개수
	// int totalRecord : 전체 게시물의 게수
	public static String getPaging(String path, int page, int recordPerPage, int totalRecord) {
		
		StringBuffer sb = new StringBuffer();
		
		// page : 현재 페이지 번호
		// recordPerPage : 한 페이지에 표시할 레코드(게시글) 개수
		// totalRecord : 전체 레코드 개수
		int totalPage = 0; // 전체 페이지 개수
		int pagePerBlock = 3; // 한 블록에 표시할 페이지 개수
		int beginPage = 0; // 블록의 시작 페이지 번호
		int endPage = 0; // 블록의 끝 페이지 번호
		
		// 전체 레코드 개수와 한 페이지에 표시할 레코드 개수를 알면 전체 페이지 개수를 알 수 있다.
		totalPage = (int)(totalRecord / recordPerPage);
		if ( totalRecord % recordPerPage != 0 ) {
			totalPage++;
		}
		
		// totalPage 조정
		if ( page > totalPage ) {
			totalPage = page;
		}
		
		// 블록에 표시할 시작 페이지 번호와 끝 페이지 번호 계산
		beginPage = (int)(((page - 1) / pagePerBlock) * pagePerBlock) + 1;
		endPage = beginPage + pagePerBlock - 1;
		
		// endPage 조정
		if ( endPage > totalPage ) {
			endPage = totalPage;
		}
		
		// 페이징 만들기
		
		// 1. 이전 버튼 표시
		// 이전 버튼의 링크 필요 유무에 따라 if 처리
		//   1) 이전 버튼의 링크가 필요 없는 경우 : beginPage < pagePerBlock
		//   2) 이전 버튼의 링크가 필요한 경우 : 그 이외의 경우
		if ( beginPage < pagePerBlock ) {
			sb.append("<span style='color: lightgray;'>◀</span>&nbsp;&nbsp;");
		} else {
			if (path.indexOf("?") > 0) {
				sb.append("<a href='" + path + "&page=" + (beginPage - 1) + "'>◀</a>&nbsp;&nbsp;");
			} else {
				sb.append("<a href='" + path + "?page=" + (beginPage - 1) + "'>◀</a>&nbsp;&nbsp;");
			}
		}
		
		// 2. 페이지 번호 표시
		// 페이지 번호의 링크 필요 유무에 따라 if 처리
		//   1) 페이지 번호의 링크가 필요 없는 경우 : page == nowPage
		//   2) 페이지 번호의 링크가 필요한 경우 : 그 이외의 경우
		for ( int p = beginPage; p <= endPage; p++ ) {
			if ( p == page ) {
				sb.append("<span style='color: lightgray;'>" + p + "</span>&nbsp;&nbsp;");
			} else {
				if (path.indexOf("?") > 0) {
					sb.append("<a href='" + path + "&page=" + p + "'>" + p + "</a>&nbsp;&nbsp;");
				} else {
					sb.append("<a href='" + path + "?page=" + p + "'>" + p + "</a>&nbsp;&nbsp;");
				}
			}
		}
		
		// 3. 다음 버튼 표시
		// 다음 버튼의 링크 필요 유무에 따라 if 처리
		//   1) 다음 버튼의 링크가 필요 없는 경우 : endPage == totalPage
		//   2) 다음 버튼의 링크가 필요한 경우 : 그 이외의 경우
		if ( endPage == totalPage ) {
			sb.append("<span style='color: lightgray;'>▶</span>");
		} else {
			if (path.indexOf("?") > 0) {
				sb.append("<a href='" + path + "&page=" + (endPage + 1) + "'>▶</a>");
			} else {
				sb.append("<a href='" + path + "?page=" + (endPage + 1) + "'>▶</a>");
			}
		}
		return sb.toString();
	}
}
