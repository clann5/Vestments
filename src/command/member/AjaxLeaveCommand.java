package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class AjaxLeaveCommand implements AjaxMemberCommand {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		String mId = ((MemberDto)session.getAttribute("loginUser")).getmId();
		
		int result = MemberDao.getInstance().deleteMember(mId);
		
		JSONObject obj = new JSONObject();
		
		if (result > 0) {
			obj.put("isSuccess", true);
			session.invalidate();
		} else {
			obj.put("isSuccess", false);
		}
		
		return obj.toJSONString();
	}
}
