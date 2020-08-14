package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewAndForward;
import dao.BoardDao;

public class BoardDeleteCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		int result = BoardDao.getInstance().boardDelete(bNo);
		
		ViewAndForward vf = new ViewAndForward();
		
		vf.setPath("board/boardDeleteResult.jsp?result=" + result + "&page=" + page);
		vf.setRedirect(true);
		return vf;
	}

}
