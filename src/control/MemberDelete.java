package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;


@WebServlet("/MemberDelete.do")
public class MemberDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public MemberDelete() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		MemberDao dao = new MemberDao();
		
		dao.memberDelete((request.getParameter("email")));
		
	
		RequestDispatcher dis = request.getRequestDispatcher("/home.do");
		
		dis.forward(request , response);
		
	}

}
