package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;


@WebServlet("/Productdel.do")
public class Productdel extends HttpServlet {
   private static final long serialVersionUID = 1L;
   
    public Productdel() {
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

      
      
      ProductDao dao=new ProductDao();
      
      dao.deleteproduct(uid);
      
      RequestDispatcher dis=request.getRequestDispatcher("/Productlist.do");
      dis.forward(request, response);
   }

}