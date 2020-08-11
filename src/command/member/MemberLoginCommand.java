package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import common.ViewAndForward;
import dao.MemberDao;
import dto.MemberDto;

public class MemberLoginCommand implements MemberCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		
		MemberDto mDto = new MemberDto();
		mDto.setmId(mId);
		mDto.setmPw(mPw);
		
		HttpSession session = request.getSession();
		MemberDto loginuser = MemberDao.getInstance().selectBymIdmPw(mDto);
		if (loginuser != null) {
			session.setAttribute("loginuser", loginuser);
		}
		
		ViewAndForward vaf = new ViewAndForward();
		vaf.setPath("index.jsp");
		vaf.setRedirect(true);
		
		return vaf;
	}

}
