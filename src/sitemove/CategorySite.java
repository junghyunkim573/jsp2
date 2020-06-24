package sitemove;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;


@WebServlet("/Category.do")
public class CategorySite extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    public CategorySite() {
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
	   String category = request.getParameter("category");
     	String orderby = "ref";
     	String desc = "desc"; 	
     	String field = "";
     	String search = "";
     	String kinds="kinds";
     	//검색필터링
     	if(request.getParameter("search")!=null) {
     		
     		field =  request.getParameter("field");
     		search =  request.getParameter("search");
     		if(request.getParameter("field").equals("전체")) {
     			field = "1";
         		kinds = "1";
     		}
     		
		}
     	//순서 나열
 		if(request.getParameter("orderby")!=null) {
 			 orderby = request.getParameter("orderby");
 			 if(request.getParameter("desc")!=null) {
  				desc = request.getParameter("desc");
  			 }
 		}
 		ProductDao dao = new ProductDao();
     	//카테고리 상품별 불러오기
		ArrayList<Product> category_list=new ArrayList<Product>();
		
     	
     	category_list = dao.categorylist( kinds ,category, orderby , desc , 4 , field , search);
      	request.setAttribute("list", category_list);
      	request.setAttribute("category", category);
      	request.setAttribute("field", field);
      	request.setAttribute("search", search);
      	
      	
            
            	
            	
      	
      
	  RequestDispatcher dis = request.getRequestDispatcher("/bbs/category.jsp");
      dis.forward(request, response);
      
   }
}