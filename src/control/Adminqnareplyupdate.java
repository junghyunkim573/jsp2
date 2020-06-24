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


@WebServlet("/Adminqnareplyupdate.do")
@MultipartConfig(
		fileSizeThreshold=0,
		location="E:\\jsp\\lupang\\WebContent\\upload"
)
public class Adminqnareplyupdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public Adminqnareplyupdate() {
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
		
String f_name1="";

		
		Qna q=new Qna();
		
		QnaDao dao=new QnaDao();

		q.setEmail(request.getParameter("email"));
		q.setName(request.getParameter("name"));
		q.setGongji(request.getParameter("gongji"));
		q.setSubject(request.getParameter("subject"));
		q.setComment(request.getParameter("comment"));
		q.setFid(Integer.parseInt(request.getParameter("fid")));
		q.setThread(request.getParameter("thread"));
		
		String thread="";
		int fid=0;
		
		thread=request.getParameter("thread");
		fid=Integer.parseInt(request.getParameter("fid"));
		
		
		String th=dao.insertReply(thread,fid);
		
		System.out.println();
		
		
		
		for(Part part:request.getParts()) {
	         if(part.getName().equals("file1")) {
	         //오늘 날짜
	         java.util.Date today = new java.util.Date();
	         SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
	         String signdate = cal.format(today);
	         q.setSigndate(signdate);
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
		
	
		dao.replyupdateQna(q,th);
		
		
		
		System.out.println(Integer.parseInt(request.getParameter("fid")));
		response.sendRedirect("/lupang/Adminqnalist.do");
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


