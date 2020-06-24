package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import dao.ShoppingcartDao;
import model.Buy;
import model.Picture;


@WebServlet("/Adminpicmodify1.do")
public class Adminpicmodify1 extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public Adminpicmodify1() {
        super();
       
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      Picture pic=new Picture();
      
      ProductDao dao=new ProductDao();
      
      pic=dao.viewPicture();
      
      request.setAttribute("view", pic);
      
      int a=Integer.parseInt(request.getParameter("file"));
      
      request.setAttribute("count", a);
            
      RequestDispatcher dis=request.getRequestDispatcher("/admin/adminpicmodify1.jsp");
      dis.forward(request, response);
      
      
      
   }
   
}