package control;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;	
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.ProductDao;
import model.Product;


@WebServlet("/Productmodify.do")
public class Productmodify extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
 
    public Productmodify() {
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
         
      Product pro=new Product();
      ProductDao dao= new ProductDao();
      pro=dao.viewProduct(Integer.parseInt(request.getParameter("uid")));
   
      request.setAttribute("view", pro);   
      RequestDispatcher dis=request.getRequestDispatcher("/bbs/productmodify.jsp");
      dis.forward(request,response);
      
   }
}