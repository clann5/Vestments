package command.board;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.Paging;
import common.ViewAndForward;
import dao.BoardDao;
import dto.BoardDto;

public class QueryBoardListCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String column = request.getParameter("column");
		String query = request.getParameter("query");
		String page = request.getParameter("page");
		if (page == null || page.isEmpty()) {
			page = "1";
		}
		
		int recordPerPage = 5;
		int begin = (Integer.parseInt(page)-1)*recordPerPage +1;
		int end = begin + recordPerPage -1;
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("begin", begin + "");
		map.put("end", end + "");
		map.put("column", column);
		map.put("query", query);
		
		List<BoardDto> list = BoardDao.getInstance().selectQueryBoardList(map);
		
		int totalQueryRecord = BoardDao.getInstance().selectQueryBoardCount(map);
		
		String paging = Paging.getPaging("/Home/queryBoardList.board?column="+column+"&query="+query, Integer.parseInt(page), recordPerPage, totalQueryRecord);
		
		request.setAttribute("list", list);
		request.setAttribute("totalRecord", totalQueryRecord);
		request.setAttribute("paging", paging);
		request.setAttribute("page", page);
		
		HttpSession session = request.getSession();
		if (session.getAttribute("open") != null) {
			session.removeAttribute("open");
		}
		
		ViewAndForward vf = new ViewAndForward();
		vf.setPath("board/boardList.jsp");
		vf.setRedirect(false);
		return vf;
	}

}
