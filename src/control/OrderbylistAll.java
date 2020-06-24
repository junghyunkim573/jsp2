package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingcartDao;
import model.Buy;


@WebServlet("/OrderbylistAll.do")
public class OrderbylistAll extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public OrderbylistAll() {
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
      
      //페이징 처리
  		
		int count=0;
		int number=0;
		
		//한페이지 출력할 갯수
		int pageSize=10;
		//현재 보여지는 페이지의 넘버값 처리
		int pageNum=1;
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
		}
		
		ShoppingcartDao dao=new ShoppingcartDao();
		
		count=dao.AllorderCount();
		number=count - (pageNum - 1) * pageSize;
		request.setAttribute("count", count);
		request.setAttribute("pageSize", pageSize);
		request.setAttribute("number", number);
		request.setAttribute("pageNum", pageNum);
		
		//limit 값 설정
		int startRow=(pageNum - 1) * pageSize;
		int endRow=pageNum * pageSize;
      
      //판매자 정보
	  ShoppingcartDao dao1=new ShoppingcartDao();	
      ArrayList<Buy> buy_list=new ArrayList<Buy>();
      String email= request.getParameter("");
      System.out.println(request.getParameter("product_account1"));
     
      
      
      buy_list=dao1.allorderlist(startRow , pageSize);
      
      request.setAttribute("buy_list", buy_list);
      System.out.println(request.getParameter("product_account1"));
      System.out.println(request.getParameter("product_price"));
      //계좌불러오기
      ShoppingcartDao dao3 = new ShoppingcartDao(); 
      ArrayList<Buy> buy_a = new ArrayList<Buy>();
      	email= request.getParameter("");
		String product_account1=request.getParameter("product_account1");
		String product_account2=request.getParameter("product_account2");
		
		buy_a = dao3.viewBuy2(email);
      
		request.setAttribute("buy", buy_a);
      
   
      
   
      RequestDispatcher dis=request.getRequestDispatcher("/admin/orderbylistall.jsp");
      dis.forward(request, response);
   }

}