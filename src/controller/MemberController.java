package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.member.AjaxFindIdCommand;
import command.member.AjaxFindPwCommand;
import command.member.AjaxIdCheckCommand;
import command.member.AjaxMemberCommand;
import command.member.AjaxSignupCommand;
import common.ViewAndForward;

@WebServlet("*.member")
public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MemberController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		String requestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String mapping = requestURI.substring(contextPath.length());
		
		ViewAndForward vaf = null;
		
		// ajax -> response
		AjaxMemberCommand aCommand = null;
		String aResult = null;
		PrintWriter out = response.getWriter();
		
		try {
			
			switch (mapping) {
			// 기능성 이동
			case "/signup.member":
				aCommand = new AjaxSignupCommand();
				aResult = aCommand.execute(request, response);
				out.println(aResult);
				break;
			case "/findId.member":
				aCommand = new AjaxFindIdCommand();
				aResult = aCommand.execute(request, response);
				out.println(aResult);
				break;
			case "/findPw.member":
				aCommand = new AjaxFindPwCommand();
				aResult = aCommand.execute(request, response);
				out.println(aResult);
				break;
			case "/idCheck.member":
				aCommand = new AjaxIdCheckCommand();
				aResult = aCommand.execute(request, response);
				out.println(aResult);
				break;
				
			// 단순 이동
			case "/index.member":
				vaf = new ViewAndForward();
				vaf.setPath("index.jsp");
				vaf.setRedirect(true);
				break;
			case "/signupPage.member":
				vaf = new ViewAndForward();
				vaf.setPath("member/signupPage.jsp");
				vaf.setRedirect(true);
				break;
			case "/loginPage.member":
				vaf = new ViewAndForward();
				vaf.setPath("member/loginPage.jsp");
				vaf.setRedirect(true);
				break;
			case "/findIdPage.member":
				vaf = new ViewAndForward();
				vaf.setPath("member/findId.jsp");
				vaf.setRedirect(true);
				break;
			case "/findPwPage.member":
				vaf = new ViewAndForward();
				vaf.setPath("member/findPw.jsp");
				vaf.setRedirect(true);
				break;
			}
			
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		// vaf
		if (vaf != null) {
			if (vaf.isRedirect()) {
				response.sendRedirect(vaf.getPath());
			} else {
				request.getRequestDispatcher(vaf.getPath()).forward(request, response);
			}
		}
		// path
//		if (path != null) {
//			request.getRequestDispatcher(path).forward(request, response);
//			System.out.println("path log : " + path);
//		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
