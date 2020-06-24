package control;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.CommentDao;
import model.Comment;



@WebServlet("/Commentupdate.do")
public class Commentupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Commentupdate() {
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
		
				//오늘 날짜
				java.util.Date today = new java.util.Date();
				SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
				String signdate = cal.format(today);//yyyy-MM-dd
		
			Comment co=new Comment();
			
			co.setTb_uid(Integer.parseInt(request.getParameter("uid")));
			co.setEmail(request.getParameter("email"));
			co.setName(request.getParameter("name"));
			co.setComment(request.getParameter("view_comment"));
			co.setData(signdate);
			
			
			
			int uid=Integer.parseInt(request.getParameter("uid"));
		

		
		
		CommentDao dao=new CommentDao();
		dao.insertComment(co);
		
		response.sendRedirect("/lupang/Productpageview.do?uid="+uid);
	}

}
