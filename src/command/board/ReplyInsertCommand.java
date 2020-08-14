package command.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewAndForward;
import dao.BoardDao;
import dto.BoardDto;

public class ReplyInsertCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bIp = request.getRemoteAddr();
		
		int bNo = Integer.parseInt(request.getParameter("bNo"));
		String page = request.getParameter("page");
		
		BoardDto rDto = new BoardDto();
		rDto.setmId(mId);
		rDto.setbTitle(bTitle);
		rDto.setbContent(bContent);
		rDto.setbIp(bIp);
		
		BoardDto bDto = BoardDao.getInstance().selectBybNo(bNo);
		
		rDto.setbGroup(bDto.getbGroup());
		rDto.setbGroupOrd(bDto.getbGroupOrd()+1);
		rDto.setbDepth(bDto.getbDepth()+1);
		
		BoardDao.getInstance().replyUpdateGroupOrd(bDto);
		
		int result = BoardDao.getInstance().replyInsert(rDto);
		
		ViewAndForward vf = new ViewAndForward();
		if (result > 0) {
			vf.setPath("/Home/boardList.board?page=" + page);
			vf.setRedirect(true);
		} else {
			response.setHeader("Content-Type", "text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('댓글이 등록되지 않았습니다.')");
			out.println("history.back()");
			out.println("</script>");
			out.close();
		}
		
		return vf;
	}
}
