package control;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.ShoppingcartDao;


@WebServlet("/ShoppingcartUpdate.do")
public class ShoppingcartUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ShoppingcartUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doAll(request, response);
	}
	protected void doAll(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		String email = request.getParameter("email");
		
		ShoppingcartDao dao = new ShoppingcartDao();
		for(int i = 1 ; i< 10 ; i++) {
			
		if(request.getParameter("uid_"+i) != null){ 
			int uid=Integer.parseInt(request.getParameter("uid_"+i));
			int count=Integer.parseInt(request.getParameter("count_"+i));
			int num=Integer.parseInt(request.getParameter("num"));
			int pt_uid=Integer.parseInt(request.getParameter("pt_uid"+i));
			
			
				//수량 1개 이하러 안내려가게 하는 구문
				if(num==-1) {
					if(count==1) {
						num=0;
					}				
				}
			int cancel = dao.cartUpdate(uid , num ,pt_uid );
			
			if(cancel == 1) {
			 request.setAttribute("cancel", cancel);
			 System.out.println("cancel" + 11111);
			}else {
				cancel=0;
				System.out.println("cancel" + 10000);
			}
			
			break;			
			}
		}
		
	      RequestDispatcher dis=request.getRequestDispatcher("/Shoppingcartview.do?email="+email);
	      dis.forward(request,response);
	      
		
	
		
		
	}

}
