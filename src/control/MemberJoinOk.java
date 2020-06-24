package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import dao.MemberDao;
import model.Member;


@WebServlet("/LupangLoginOK.do")
public class MemberJoinOk extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		Member bean = new Member();
		
		String email =request.getParameter("email");
		String pass =request.getParameter("pass");
		MemberDao dao = new MemberDao();
		bean = dao.joinok(email,pass);
		HttpSession Session = request.getSession();
		
		//불법적인 접속 방법 막기위해
		 if(email.equals(bean.getEmail())) {
			 Session.setAttribute("email",bean.getEmail());
			 Session.setAttribute("name",bean.getName());
			 Session.setAttribute("level",bean.getLevel());
			 if(bean.getCompany()!= "" || bean.getCompany() != null ){
			 Session.setAttribute("company",bean.getCompany());
			
			 }
			RequestDispatcher dis = request.getRequestDispatcher("/home.do");
				
			dis.forward(request , response);
		 }else {
			 JOptionPane.showMessageDialog(null,"아이디나 비번이 틀립니다 확인해주세요");
			
			 RequestDispatcher dis = request.getRequestDispatcher("/lupanglogin.do");
				
			 dis.forward(request , response);
		 }
		
	}	
	
}