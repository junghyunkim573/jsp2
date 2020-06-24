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


@WebServlet("/CategoryAll.do")
public class CategorySiteAll extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    public CategorySiteAll() {
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
     		field = request.getParameter("field");
     		search = request.getParameter("search");
     		if(request.getParameter("field").equals("전체")) {
     			field="1";
     			kinds="1";
     		}
		}
     	
 		if(request.getParameter("orderby")!=null) {
 			 orderby = request.getParameter("orderby");
 			 if(request.getParameter("desc")!=null) {
 				desc = request.getParameter("desc");
 			 }
 			 
 		}
     
     	//카테고리 상품별 불러오기
		ArrayList<Product> category_list=new ArrayList<Product>();
     	System.out.println(field);
     	System.out.println("kinds");
     	ProductDao dao = new ProductDao();
     	category_list = dao.categorylist( "kinds" ,category, orderby , desc , 1111 , field , search);
      	request.setAttribute("list", category_list);
      	request.setAttribute("category", category);
      	request.setAttribute("field", field);
      	request.setAttribute("search", search);
      
	  RequestDispatcher dis = request.getRequestDispatcher("/bbs/categoryAll.jsp");
      dis.forward(request, response);
      
   }
}