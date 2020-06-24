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

import dao.ProductDao;
import model.Picture;


@WebServlet("/AdminpicwriteProc.do")
@MultipartConfig(
		fileSizeThreshold=0,
		location="E:\\jsp\\lupang\\WebContent\\upload"
)
public class AdminpicwriteProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public AdminpicwriteProc() {
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
		
		Picture pic= new Picture();
				
		pic.setPass1(request.getParameter("pass1"));
		pic.setPass2(request.getParameter("pass2"));
		pic.setPass3(request.getParameter("pass3"));
		pic.setPass4(request.getParameter("pass4"));
		
		
		String f_name1="";
		String f_name2="";
		String f_name3="";
		String f_name4="";
		
		
		for(Part part:request.getParts()) {
			if(part.getName().equals("file1") || part.getName().equals("file2") || part.getName().equals("file3") || part.getName().equals("file4")) {
			//오늘 날짜
			java.util.Date today = new java.util.Date();
			SimpleDateFormat cal = new SimpleDateFormat("yyyy-MM-dd");
			String signdate = cal.format(today);
			
			//첨부파일 
			String contentDisposition=part.getHeader("content-disposition");
			String uploadFileName=getUploadFileName(contentDisposition);
			uploadFileName=signdate+"_"+uploadFileName;
			
				if(part.getName().equals("file1") && part.getSize() >0){
					f_name1=uploadFileName;
				}
				if(part.getName().equals("file2") && part.getSize() >0){
					f_name2=uploadFileName;
				}
				if(part.getName().equals("file3") && part.getSize() >0){
					f_name3=uploadFileName;
				}
				if(part.getName().equals("file4") && part.getSize() >0){
					f_name4=uploadFileName;
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
									
			pic.setFile1(f_name1);
			pic.setFile2(f_name2);
			pic.setFile3(f_name3);
			pic.setFile4(f_name4);
			
			ProductDao dao = new ProductDao();		
			dao.insertPicture(pic);			
			
			
			response.sendRedirect("/lupang/Adminpiclist.do");
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

