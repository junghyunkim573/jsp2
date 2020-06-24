package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDao;


@WebServlet("/Adminqnadel.do")
public class Adminqnadel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adminqnadel() {
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
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		QnaDao dao=new QnaDao();
		dao.deleteQna(uid);
		
		response.sendRedirect("/lupang/Adminqnalist.do");
		
	}

}
