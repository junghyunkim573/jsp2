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


@WebServlet("/Allmemberlist.do")
public class Allmemberlist extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public Allmemberlist() {
        super();
        
    }

   
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   
   protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
      doAll(request, response);
   }

   protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      MemberDao dao=new MemberDao();
      
      //총 상품수
      
            int count=0;
            
            count=dao.getAllCount();
            
            //한페이지 출력할 갯수
            int pageSize=10;
            
            //현재 보여지는 페이지의 넘버값 처리
            
            int pageNum=1;
            if(request.getParameter("pageNum")!=null) {
               pageNum=Integer.parseInt(request.getParameter("pageNum"));
            }
            
            
            
            //NO 넘버링 처리
            int number=0;
            number=count - (pageNum - 1) * pageSize;
            
            //limit 값 설정
            int startRow=(pageNum - 1) * pageSize;
            int endRow=pageNum * pageSize;
            
            //총 멤버
            ArrayList<Member> v=new ArrayList<Member>();
            
            v= dao.getAllMember(startRow,pageSize);
            
            request.setAttribute("list", v);
            request.setAttribute("count", count);
            request.setAttribute("pageSize", pageSize);
            request.setAttribute("number", number);
            request.setAttribute("pageNum", pageNum);
            
            
            RequestDispatcher dis=request.getRequestDispatcher("/admin/allmemberlist.jsp");
            dis.forward(request,response);
   }

}