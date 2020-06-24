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
import dao.ShoppingcartDao;
import model.Buy;
import model.Product;
import model.Shoppingcart;


@WebServlet("/Orderview.do")
public class Orderview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public Orderview() {
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
      
      //구매자 정보
      Buy buy= new Buy();
      Product pro = new Product();
      
      int uid= Integer.parseInt(request.getParameter("uid"));
      
      ShoppingcartDao dao=new ShoppingcartDao();
      ProductDao dao1 = new ProductDao();
      //구매한 상품 일련번호로 찾아오기
      buy=dao.view(uid);
      //일련번호로 찾아온 상품 uid 값으로 상품 정보 검색
      int pro_uid = buy.getProduct_uid();
      pro = dao1.viewProduct(pro_uid);
      
      request.setAttribute("buy", buy);
      request.setAttribute("pro", pro);
      
   
      RequestDispatcher dis=request.getRequestDispatcher("/bbs/orderbyview.jsp");
      dis.forward(request, response);
   }

}