package control;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingcartDao;
import model.Buy;

@WebServlet("/PurchaseProc.do")
public class PurchaseProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public PurchaseProc() {
        super();
     
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		daAll(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		daAll(request, response);
	}
	protected void daAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			request.setCharacterEncoding("utf-8");
	
	
			
	    //오늘 날짜
		Date today = new Date();
        SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
        String signdate = cal.format(today);    
		//오늘날짜 시분초 예제
//		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
//		SimpleDateFormat format2 = new SimpleDateFormat ( "yyyy년 MM월dd일 HH시mm분ss초");
//		Date time = new Date();
//		
//		String format_time1 = format1.format(time.getTime());
//		String time1 = format1.format(time);
//		String time2 = format2.format(time);			
		Buy buy = new Buy();
		
		
		
		
		System.out.println(request.getParameter("buyer_name"));
		System.out.println(request.getParameter("buyer_mobile1"));
		System.out.println(request.getParameter("buyer_mobile2"));
		System.out.println(request.getParameter("deliver_name"));
		System.out.println(request.getParameter("delivery_mobile1"));
		System.out.println(request.getParameter("delivery_mobile2"));
		System.out.println(request.getParameter("addr1"));
		System.out.println(request.getParameter("addr2"));
		System.out.println(request.getParameter("addr3"));
		System.out.println(request.getParameter("addr4"));
		System.out.println(request.getParameter("content"));
		System.out.println(request.getParameter("method"));
		System.out.println(request.getParameter("total_count"));
		buy.setEmail(request.getParameter("email"));
		buy.setBuyer_name(request.getParameter("buyer_name"));
		buy.setBuyer_mobile1(request.getParameter("buyer_mobile1"));
		buy.setBuyer_mobile2(request.getParameter("buyer_mobile2"));
		buy.setDelivery_name(request.getParameter("deliver_name"));
		buy.setDelivery_mobile1(request.getParameter("delivery_mobile1"));
		buy.setDelivery_mobile2(request.getParameter("delivery_mobile2"));
		buy.setAddr1(request.getParameter("addr1"));
		buy.setAddr2(request.getParameter("addr2"));
		buy.setAddr3(request.getParameter("addr3"));
		buy.setAddr4(request.getParameter("addr4"));
		buy.setContent(request.getParameter("content"));
		buy.setBuy_date(signdate);
		buy.setMethod(request.getParameter("method"));
		int total_count = Integer.parseInt(request.getParameter("total_count"));
		System.out.println("구매목록 총갯수"+ total_count);
		ShoppingcartDao dao = new ShoppingcartDao(); 
		for(int i=1; i<total_count+1 ; i++) {
			
			buy.setProduct_uid(Integer.parseInt(request.getParameter("product_"+i)));
			System.out.println("상품번호"+request.getParameter("product_"+i));
			buy.setAmount(Integer.parseInt(request.getParameter("amount_"+i)));
			System.out.println("총갯수"+request.getParameter("amount_"+i));
			dao.buyinsert( buy );
			
		}
        String email=request.getParameter("email");
        dao.viewBuy(email);
        
        
        
        request.setAttribute("view", buy);
        
        ShoppingcartDao dao3 = new ShoppingcartDao(); 
		
		String product_account1=request.getParameter("product_account1");
		String product_account2=request.getParameter("product_account2");
		
		buy=dao3.viewBuy1(email);
        
        request.setAttribute("buy", buy);
        
     ArrayList<Buy> pro_list=new ArrayList<Buy>();
        ShoppingcartDao dao2=new ShoppingcartDao();
       
        

        pro_list=dao2.viewProduct(email);
     
        request.setAttribute("paypro", pro_list);
       
        String addsum=request.getParameter("addsum");
     
        request.setAttribute("addsum", addsum);
     
     String buydelivery=request.getParameter("buydelivery");
           
        request.setAttribute("buydelivery", buydelivery);
     
		
		
		
		
		
	     RequestDispatcher dis=request.getRequestDispatcher("/bbs/payment.jsp");
         dis.forward(request,response);
		
		
		
	}
}
