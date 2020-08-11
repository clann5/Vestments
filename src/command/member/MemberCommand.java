package command.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewAndForward;

public interface MemberCommand {

	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
}
