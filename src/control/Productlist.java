package control;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ProductDao;
import model.Product;


@WebServlet("/Productlist.do")
public class Productlist extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Productlist() {
        super();
        
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}
	
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		ProductDao dao=new ProductDao();
		
		//총 상품수
				int count=0;
				int number=0;
				
				//한페이지 출력할 갯수
				int pageSize=10;
				//현재 보여지는 페이지의 넘버값 처리
				int pageNum=1;
				if(request.getParameter("pageNum")!=null) {
					pageNum=Integer.parseInt(request.getParameter("pageNum"));
				}
			
				//limit 값 설정
				int startRow=(pageNum - 1) * pageSize;
				int endRow=pageNum * pageSize;
				String email= request.getParameter("email");
				String level= "10";
				if(request.getParameter("level") != null) {
					//관리자 상품 불러올때
					
					count=dao.AllCount(email , level);
					ArrayList<Product> v=new ArrayList<Product>();
					v= dao.AllProduct(email , level ,startRow,pageSize);
					
					request.setAttribute("list", v);
					//NO 넘버링 처리
					number=count - (pageNum - 1) * pageSize;
				}
				
				
				request.setAttribute("count", count);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("number", number);
				request.setAttribute("pageNum", pageNum);
				
				
				RequestDispatcher dis=request.getRequestDispatcher("/bbs/productlist.jsp");
				dis.forward(request,response);
	}

}
