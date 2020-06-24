package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingcartDao;


@WebServlet("/Shoppingcartdel.do")
public class Shoppingcartdel extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public Shoppingcartdel() {
        super();
        
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   
   protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      int uid=Integer.parseInt(request.getParameter("uid"));
      String email=request.getParameter("email");
      ShoppingcartDao dao=new ShoppingcartDao();
      
      dao.deleteshoppingcart(uid);
      
      response.sendRedirect("/lupang/Shoppingcartview.do?email="+email);
      
   }
}