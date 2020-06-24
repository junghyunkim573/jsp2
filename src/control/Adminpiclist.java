package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Picture;
import model.Qna;


@WebServlet("/Adminpiclist.do")
public class Adminpiclist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adminpiclist() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doAll(request, response);
	}
	
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Picture pic=new Picture();
		ProductDao dao=new ProductDao();
		
	
			
			
			pic=dao.AllPicture();

			request.setAttribute("picture", pic);
			
			
			
			RequestDispatcher dis=request.getRequestDispatcher("/admin/adminpiclist.jsp");
			dis.forward(request, response);
	}

}
