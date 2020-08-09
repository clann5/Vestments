package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class AjaxFindIdCommand implements AjaxMemberCommand {
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mEmail = request.getParameter("mEmail");
		
		MemberDto mDto = MemberDao.getInstance().selectBymEmail(mEmail);
		
		JSONObject obj = new JSONObject();
		if (mDto != null) {
			obj.put("isSuccess", true);
			obj.put("rId",mDto.getmId());
		} else {
			obj.put("isSuccess", false);
		}
		return obj.toJSONString();
	}

}
