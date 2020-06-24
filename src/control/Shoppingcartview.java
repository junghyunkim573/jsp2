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
import model.Shoppingcart;


@WebServlet("/Shoppingcartview.do")
public class Shoppingcartview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       


    public Shoppingcartview() {
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
      
      ShoppingcartDao dao=new ShoppingcartDao();      

      ArrayList<Shoppingcart> v=new ArrayList<Shoppingcart>();
      
      v= dao.viewShoppingcart(request.getParameter("email"));
      
      request.setAttribute("shoppingcart", v);
      
      RequestDispatcher dis = request.getRequestDispatcher("/shoppingcart/shoppingcartview.jsp");
      dis.forward(request , response);
      
   }
}