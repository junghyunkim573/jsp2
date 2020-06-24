package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Picture;


@WebServlet("/Adminpicmodify.do")
public class Adminpicmodify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adminpicmodify() {
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
		
		Picture pic=new Picture();
		ProductDao dao=new ProductDao();
		pic=dao.viewPicture();
		
		request.setAttribute("view", pic);
		
		
		
		RequestDispatcher dis=request.getRequestDispatcher("/admin/adminpicmodify.jsp");
		dis.forward(request, response);
		
		
	}
	
}
