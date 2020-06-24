package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDao;
import model.Qna;


@WebServlet("/Adminqnalist.do")
public class Adminqnalist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adminqnalist() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}
	
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		QnaDao dao=new QnaDao();
		
		//총 게시글수
			
			int count=0;
			
			count=dao.getAllCount();
			
			//한페이지 출력할 갯수
			
			int pageSize=10;
			
			//현재 보여주는 페이지의 넘버값 처리
			
			int pageNum=1;
			
			if(request.getParameter("pageNum")!=null) {
				pageNum=Integer.parseInt(request.getParameter("pageNum"));
			}
			
			//NO 넘버링 처리
			
			int number=0;
			number=count - (pageNum - 1) * pageSize;
			
			//limit 값 설정
			
			int startRow=(pageNum - 1) * pageSize;
			int endRow=pageNum * pageSize;
			
			//총 게시글
			
			ArrayList<Qna> v=new ArrayList<Qna>();
			
			v=dao.getAllQna(startRow,pageSize);
			
			//공지게시글
			
			ArrayList<Qna> v1=new ArrayList<Qna>();
			
			v1=dao.gongjiQna();
			
			request.setAttribute("gongji", v1);
			
			
			request.setAttribute("list", v);
			request.setAttribute("count", count);
			request.setAttribute("pageSize", pageSize);
			request.setAttribute("number", number);
			request.setAttribute("pageNum", pageNum);
			
			
			
			RequestDispatcher dis=request.getRequestDispatcher("/admin/adminqnalist.jsp");
			dis.forward(request, response);
	}

}
