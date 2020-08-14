package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ViewAndForward;
import dao.BoardDao;
import dto.BoardDto;

public class BoardViewCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		BoardDto bDto = BoardDao.getInstance().selectBybNo(bNo);
		request.setAttribute("bDto", bDto);
		request.setAttribute("page", page);

		HttpSession session = request.getSession();
		String open = (String)session.getAttribute("open");
		if (open == null || open.isEmpty()) {
			session.setAttribute("open", "true");
			BoardDao.getInstance().boardUpdatebHit(bNo);
		}
		
		ViewAndForward vf = new ViewAndForward();
		if (bDto != null) {
			vf.setPath("board/boardView.jsp?bNo="+bNo);
			vf.setRedirect(false);
		} else {
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시글의 정보를 확인할 수 없습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		return vf;
	}
}
