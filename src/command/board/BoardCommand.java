package command.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.ViewAndForward;

public interface BoardCommand {

	public ViewAndForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}
