package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDao;


@WebServlet("/Qnadel.do")
public class Qnadel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Qnadel() {
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
		
		RequestDispatcher dis=request.getRequestDispatcher("/Qnalist.do");
		dis.forward(request, response);
		
	}

}
