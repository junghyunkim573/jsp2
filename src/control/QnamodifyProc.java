package control;

import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import dao.QnaDao;
import model.Qna;


@WebServlet("/QnamodifyProc.do")
@MultipartConfig(
      fileSizeThreshold=0,
      location="E:\\jsp\\lupang\\WebContent\\upload"
)
public class QnamodifyProc extends HttpServlet {
   private static final long serialVersionUID = 1L;
       
    
    public QnamodifyProc() {
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
            
      q.setEmail(request.getParameter("email"));
      q.setName(request.getParameter("name"));
      q.setSubject(request.getParameter("subject"));
      q.setComment(request.getParameter("comment"));
      q.setGongji(request.getParameter("gongji"));
      q.setUid(Integer.parseInt(request.getParameter("uid")));

         String f_name1="";
         
         
         for(Part part:request.getParts()) {
            if(part.getName().equals("file1")) {
            //오늘 날짜
            java.util.Date today = new java.util.Date();
            SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
            String signdate = cal.format(today);
            
            //첨부파일 
            String contentDisposition=part.getHeader("content-disposition");
            String uploadFileName=getUploadFileName(contentDisposition);
            uploadFileName=signdate+"_"+uploadFileName;
            
               if(part.getName().equals("file1")){
                  f_name1=uploadFileName;
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
         q.setFile1(f_name1);
            QnaDao dao = new QnaDao();      
            dao.updateQna(q);         
        
            
            response.sendRedirect("/lupang/Qnalist.do");   
      }
      
      //크롬인 경우
      public String getUploadFileName(String contentDisposition) {
         String uploadFileName=null;
         String[] contentSpitStr=contentDisposition.split(";");
         int firstQutosIndex=contentSpitStr[2].indexOf("\"");
         int lastQutosIndex=contentSpitStr[2].lastIndexOf("\"");
         uploadFileName=contentSpitStr[2].substring(firstQutosIndex +1, lastQutosIndex);
         return uploadFileName;
      }

   }

         
         