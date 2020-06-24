package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;


@WebServlet("/Allmemberview.do")
public class Allmemberview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public Allmemberview() {
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
      
      Member bean=new Member();
      
      MemberDao dao=new MemberDao();
      
      
      
      bean=dao.memberview(request.getParameter("email"));
      
      request.setAttribute("all_view", bean);
      
      RequestDispatcher dis=request.getRequestDispatcher("/admin/allmemberview.jsp");
      dis.forward(request, response);      
            
      
   }

}