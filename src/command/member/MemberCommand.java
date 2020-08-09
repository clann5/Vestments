package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberCommand {

	public String execute(HttpServletRequest request, HttpServletResponse response);
}
