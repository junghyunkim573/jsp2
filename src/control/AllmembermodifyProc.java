package control;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.MemberDao;
import model.Member;

@WebServlet("/AllmembermodifyProc.do")
@MultipartConfig(
      fileSizeThreshold=0,
      location="E:\\jsp\\lupang\\WebContent\\upload"
)
public class AllmembermodifyProc extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public AllmembermodifyProc() {
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
      
      
      String companynumber="x";
      String account1="";
      String account2="";
      String company="";
      String f_name1 = "";
      System.out.println(request.getParameter("company"));
      /*사업자 일반회원 구분*/
      if(request.getParameter("companynumber")!=null) {
      companynumber = request.getParameter("companynumber");
      company = request.getParameter("company");
      account1 =  request.getParameter("account1");
      account2 =  request.getParameter("account2");

      }
      //파일 첨부
      for(Part part: request.getParts()) {
         if(part.getName().equals("file1")) {
            //오늘 날짜
            java.util.Date today = new java.util.Date();
            SimpleDateFormat cal = new SimpleDateFormat("yyyyMMdd_HHmmss_");
            String signdate = cal.format(today);
            
            String contentDisposition = part.getHeader("content-disposition");
            String uploadFileName = getUploadFileName(contentDisposition);
            uploadFileName = signdate+uploadFileName;
            
            if(part.getName().equals("file1")) {
               f_name1 = uploadFileName;
            }
            
            //날짜형 이름으로 파일명 지정 했기 때문에 파일크기 비교
            if(part.getSize() > 0) {
               try {
                  part.write(uploadFileName);//파일첨부 실행 코드
               }catch(Exception e) {
                  e.printStackTrace();
               }
            }
         }
      }
      
      
   
   Member bean = new Member();
   System.out.println(request.getParameter("email"));
   bean.setEmail(request.getParameter("email"));
   bean.setPass(request.getParameter("pass"));
   bean.setName(request.getParameter("name"));
   bean.setMobile1(request.getParameter("mobile1"));
   bean.setMobile2(request.getParameter("mobile2"));
   bean.setLevel(request.getParameter("level"));
   bean.setCompanynumber(companynumber);
   bean.setCompany(company);
   bean.setAccount1(account1);
   bean.setAccount2(account2);
   bean.setFile1(f_name1);   

   
   
   MemberDao dao = new MemberDao();
   
   
   
   bean=dao.memberUpdate(bean);
   
   
   System.out.println(bean.getEmail() +","+ bean.getName());
    request.setAttribute("email",bean.getEmail());
    request.setAttribute("name",bean.getName());
    request.setAttribute("level",bean.getLevel());
    
    request.setAttribute("all_view", bean);
    System.out.println(request.getParameter("name"));
   RequestDispatcher dis = request.getRequestDispatcher("/Allmemberlist.do");
      
   dis.forward(request , response);
}
//크롬인 경우
public String getUploadFileName(String contentDisposition) {
   String uploadFileName = null;
   String[] contentSplitStr = contentDisposition.split(";");
   int firstQutosIndex = contentSplitStr[2].indexOf("\"");
   int lastQutosIndex = contentSplitStr[2].lastIndexOf("\"");
   uploadFileName = contentSplitStr[2].substring(firstQutosIndex + 1,lastQutosIndex);
   return uploadFileName;
}
   
}