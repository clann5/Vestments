package command.member;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class AjaxFindPwCommand implements AjaxMemberCommand {
	
	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mPw = UUID.randomUUID().toString().replaceAll("-", "").substring(0, 8);
//		String mPw = request.getParameter("mPw");
		String mId = request.getParameter("mId");
		String mEmail = request.getParameter("mEmail");
		
		MemberDto mDto = new MemberDto();
		mDto.setmPw(mPw);
		mDto.setmId(mId);
		mDto.setmEmail(mEmail);
		
		int result = MemberDao.getInstance().updateMemberInmPw(mDto);
		
		JSONObject obj = new JSONObject();
		if (result > 0) {
			obj.put("isSuccess", true);
			obj.put("ranPw", mPw);
		} else {
			obj.put("isSuccess", false);
		}

		return obj.toJSONString();
	}

}
