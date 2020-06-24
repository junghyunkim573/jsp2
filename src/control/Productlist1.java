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


@WebServlet("/Productlist1.do")
public class Productlist1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Productlist1() {
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
				count=dao.AllCount1(email);
				String level= "5";
				if(request.getParameter("level") != null) {
					
					ArrayList<Product> v=new ArrayList<Product>();
					v=dao.AllProduct1(email , level ,startRow,pageSize);
					
					request.setAttribute("pro", v);
					//NO 넘버링 처리
					number=count - (pageNum - 1) * pageSize;
				}
				
				
				request.setAttribute("count", count);
				request.setAttribute("pageSize", pageSize);
				request.setAttribute("number", number);
				request.setAttribute("pageNum", pageNum);
				
				
				RequestDispatcher dis=request.getRequestDispatcher("/bbs/productlist1.jsp");
				dis.forward(request,response);
	}

}
