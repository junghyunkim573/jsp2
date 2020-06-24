package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ShoppingcartDao;
import model.Product;

		@WebServlet("/Shoppingcartinsert.do")
		@MultipartConfig(
				fileSizeThreshold=0,
				location="E:\\jsp\\lupang\\WebContent\\upload"
		)
		public class Shoppingcartinsert extends HttpServlet {
			private static final long serialVersionUID = 1L;       
		    
		    public Shoppingcartinsert() {
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
				 
				  
			      			      
			      ProductDao dao=new ProductDao();
			      Product pro=new Product();
			      //pt_uid로 기존 상품 가격 내용 부러오기 
			      pro=dao.viewProduct(Integer.parseInt(request.getParameter("pt_uid")));
			      int count = Integer.parseInt(request.getParameter("count"));
			      String email=request.getParameter("email");
			      
			      
	 
	
			      			         
			         ShoppingcartDao dao1 = new ShoppingcartDao();
			        
			        int cancel=dao1.insertShoppingcart(email,count ,pro);
			         
			         if(cancel==1) {
			     		request.setAttribute("cancel", 1);
			     		request.setAttribute("amount", pro.getAmount());
			     		
			   	      RequestDispatcher dis=request.getRequestDispatcher("/Productpageview.do?uid="+pro.getUid());
			   	      dis.forward(request,response);		        	 
			         }else{		     		
			   	      RequestDispatcher dis=request.getRequestDispatcher("/Shoppingcartview.do?email="+email);
			   	      dis.forward(request,response);      
			         }
			         
			         
			         
			         
			   }
			   
			

			}
