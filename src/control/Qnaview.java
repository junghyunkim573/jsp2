package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.QnaDao;
import model.Qna;


@WebServlet("/Qnaview.do")
public class Qnaview extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
   
    public Qnaview() {
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
      
      

   
   
      
      Qna q=new Qna();
      
      
      QnaDao dao=new QnaDao();
      
      q=dao.viewQna(Integer.parseInt(request.getParameter("uid")));
      
      
      
      request.setAttribute("view", q);
      

      RequestDispatcher dis=request.getRequestDispatcher("/bbs/qnaview.jsp");
      dis.forward(request, response);      
   }

}