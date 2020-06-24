package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;


@WebServlet("/Allmembermodify.do")
public class Allmembermodify extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public Allmembermodify() {
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
      System.out.println("11111");
      
      
      bean=dao.memberview(request.getParameter("email"));
      
      request.setAttribute("all_view", bean);
      System.out.println("22222");
      RequestDispatcher dis=request.getRequestDispatcher("/admin/allmembermodify.jsp");
      dis.forward(request, response);
   }

}