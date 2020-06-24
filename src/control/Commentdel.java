package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;


@WebServlet("/Commentdel.do")
public class Commentdel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Commentdel() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}

	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int uid=Integer.parseInt(request.getParameter("uid"));
		
		CommentDao dao=new CommentDao();
		
		dao.deleteComment(uid);
		
		response.sendRedirect("/lupang/Productlist.do");
		
	}
	
}
