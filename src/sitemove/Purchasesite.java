package sitemove;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import dao.ShoppingcartDao;

import model.Member;
import model.Product;
import model.Shoppingcart;


@WebServlet("/Purchasesite.do")
public class Purchasesite extends HttpServlet {
   private static final long serialVersionUID = 1L;
    
    public Purchasesite() {
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
         
               request.setAttribute("purchase_member", bean);
         
         String email = request.getParameter("email");
            String orderby = "email";
            
           if(request.getParameter("oderby")!=null) {
               orderby = request.getParameter("orderby");
           }
         
            //바로 구매 버튼을 누른경우
         if(request.getParameter("uid") !=null) {
               
               ArrayList<Product> purchase_list=new ArrayList<Product>();
                int uid = Integer.parseInt(request.getParameter("uid"));
                int amount= 1;
                if(request.getParameter("amount") != null) {
                   amount=Integer.parseInt(request.getParameter("amount"));
                }
                ShoppingcartDao dao1 = new ShoppingcartDao();
                purchase_list= dao1.nowpurchase(uid , amount);
                System.out.println("111111");
               
                 request.setAttribute("purchase", purchase_list);
            
            
         }else {
            //장바구니 목록 불러오기
             ArrayList<Shoppingcart> purchase_list=new ArrayList<Shoppingcart>();
               
             ShoppingcartDao dao1 = new ShoppingcartDao();
             purchase_list= dao1.purchaselist(email, orderby);
                
               System.out.println("xxxxxxxxxxxxxxx");
                request.setAttribute("purchase", purchase_list);

            
         }
           
           
         
         RequestDispatcher dis=request.getRequestDispatcher("/bbs/purchase.jsp");
         dis.forward(request,response);
      
   }

}