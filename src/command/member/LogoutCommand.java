package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import common.ViewAndForward;

public class LogoutCommand implements MemberCommand {

	@Override
	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if (session != null) {
			session.invalidate();
		}
		
		ViewAndForward vaf = new ViewAndForward();
		vaf.setPath("index.jsp");
		vaf.setRedirect(true);
		return vaf;
	}

}
