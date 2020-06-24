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
import model.Buy;


@WebServlet("/Orderbylist.do")
public class Ordebyrlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Ordebyrlist() {
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
		
		//총 게시글수
        
        int count=0;
        String email = request.getParameter("email");
        ShoppingcartDao dao=new ShoppingcartDao();
        
        count=dao.orderCount(email);
        
        //한페이지 출력할 갯수
        
        int pageSize=10;
        
        //현재 보여주는 페이지의 넘버값 처리
        
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
        
		//구매자 정보
		ArrayList<Buy> buy_list=new ArrayList<Buy>();
		
		
		
		ShoppingcartDao dao1=new ShoppingcartDao();
		
		buy_list=dao1.viewBuy1(email,startRow,pageSize);
		
		request.setAttribute("buy_list", buy_list);
		System.out.println(request.getParameter("product_account"));
		request.setAttribute("count", count);
        request.setAttribute("pageSize", pageSize);
        request.setAttribute("number", number);
        request.setAttribute("pageNum", pageNum);
		
		
		RequestDispatcher dis=request.getRequestDispatcher("/bbs/orderbylist.jsp");
		dis.forward(request, response);
	}

}
