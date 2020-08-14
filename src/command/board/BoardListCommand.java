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

public class BoardListCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		request.setCharacterEncoding("utf-8");
		String page = request.getParameter("page");
		if (page == null || page.isEmpty()) {
			page = "1";
		}
		
		int recordPerPage = 5;
//		int begin = page * recordPerPage -4;
		int begin = (Integer.parseInt(page)-1)*recordPerPage +1;
//		int end = page * recordPerPage;
		int end = begin + recordPerPage -1;
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("begin", begin);
		map.put("end", end);

		List<BoardDto> list = BoardDao.getInstance().selectBoardList(map);

		int totalRecord = BoardDao.getInstance().selectBoardCount();
		
		String paging = Paging.getPaging("/Home/boardList.board", Integer.parseInt(page), recordPerPage, totalRecord);
		
		request.setAttribute("list", list);
		request.setAttribute("totalRecord", totalRecord);
		request.setAttribute("paging", paging);
		request.setAttribute("page", page);
		
		HttpSession session = request.getSession();
		session.removeAttribute("open");
		
		ViewAndForward vf = new ViewAndForward();
		vf.setPath("board/boardList.jsp");
		vf.setRedirect(false);
		return vf;
	}

}
