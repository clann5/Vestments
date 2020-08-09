package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface AjaxMemberCommand {

	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
