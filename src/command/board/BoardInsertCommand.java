package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewAndForward;
import dao.BoardDao;
import dto.BoardDto;

public class BoardInsertCommand implements BoardCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String bTitle = request.getParameter("bTitle");
		String bContent = request.getParameter("bContent");
		String bIp = request.getRemoteAddr();
		
		BoardDto bDto = new BoardDto();
		bDto.setmId(mId);
		bDto.setbTitle(bTitle);
		bDto.setbContent(bContent);
		bDto.setbIp(bIp);
		
		int result = BoardDao.getInstance().boardInsert(bDto);
		
		ViewAndForward vf = new ViewAndForward();
		vf.setPath("board/boardInsertResult.jsp?result=" + result);
		vf.setRedirect(true);
		return vf;
	}

}
