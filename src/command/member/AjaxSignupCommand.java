package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dao.MemberDao;
import dto.MemberDto;

public class AjaxSignupCommand implements AjaxMemberCommand {

	@SuppressWarnings("unchecked")
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("utf-8");
		String mId = request.getParameter("mId");
		String mPw = request.getParameter("mPw");
		String mName = request.getParameter("mName");
		String mEmail = request.getParameter("mEmail");
		String mPhone = request.getParameter("mPhone");
		String mAddress = request.getParameter("mAddress");
		
		MemberDto mDto = new MemberDto();
		mDto.setmId(mId);
		mDto.setmPw(mPw);
		mDto.setmName(mName);
		mDto.setmEmail(mEmail);
		mDto.setmPhone(mPhone);
		mDto.setmAddress(mAddress);
		
		int result = MemberDao.getInstance().insertMember(mDto);
		System.out.println("command log : 회원가입 성공");
		// 데이터 호출 끝
		
		// Ajax Message 준비
		JSONObject obj = new JSONObject();
		if (result > 0) {
			obj.put("isSuccess", true);
		} else {
			obj.put("isSuccess", false);
		}
		
		return obj.toJSONString();
	}

}
