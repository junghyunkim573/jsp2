package sitemove;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.ProductDao;
import model.Member;
import model.Picture;
import model.Product;


@WebServlet("/home.do")
public class HomeSite extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");

		String email =request.getParameter("email");
		String desc = "desc";
		
		//메인바디 배너불러오기
        
        Picture pic=new Picture();         
        ProductDao dao123=new ProductDao();
        pic=dao123.bannerlist();
        request.setAttribute("banner", pic);
		//불법적인 접속 방법 막기위해
		 if(email != null) {
				
				Member bean = new Member();
				MemberDao dao = new MemberDao();
				bean = dao.home(email);
				
			 request.setAttribute("email",bean.getEmail());
			 request.setAttribute("name",bean.getName());
			 request.setAttribute("level",bean.getLevel());
			 
		      
		      	String orderby = "ref";
		  		if(request.getParameter("oderby")!=null) {
		  			 orderby = request.getParameter("orderby");
		  		}
		      
		      	//카테고리 상품별 불러오기
				ArrayList<Product> category_list=new ArrayList<Product>();
		      	
		      	ProductDao dao1 = new ProductDao();
		      	category_list= dao1.categorylist( "1" , "1" , orderby , desc , 60 , ""  , "");
		      	
		      	
		      	request.setAttribute("list", category_list);
		      	
		      	
			 
			RequestDispatcher dis = request.getRequestDispatcher("/index1.jsp");
			dis.forward(request , response);
		 }else {
			 String category = request.getParameter("category");
		      	String orderby = "ref";
		  		if(request.getParameter("oderby")!=null) {
		  			 orderby = request.getParameter("orderby");
		  		}
		      
		      	//카테고리 상품별 불러오기
				ArrayList<Product> category_list=new ArrayList<Product>();
		      	String a = "|| '1' = '1'";
		      	ProductDao dao1 = new ProductDao();
		      	category_list= dao1.categorylist( "1" ,  "1", orderby , desc , 60, ""  , "");
		      	
		      	
		      	request.setAttribute("list", category_list);
			 
		     
				
			 
			 
			 
			 
			 
			RequestDispatcher dis = request.getRequestDispatcher("/index1.jsp");
			dis.forward(request , response);
			 
		 }
		
		

		
		
		
	}	
}
