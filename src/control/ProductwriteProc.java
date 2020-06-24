package control;

import java.awt.Image;
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

import com.sun.jimi.core.Jimi;
import com.sun.jimi.core.JimiUtils;

import dao.ProductDao;
import model.Product;


@WebServlet("/ProductwriteProc.do")
@MultipartConfig(
		fileSizeThreshold=0,
		location="E:\\jsp\\lupang\\WebContent\\upload"
)
public class ProductwriteProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    public ProductwriteProc() {
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
		
		Product pro= new Product();
		pro.setEmail(request.getParameter("email"));
		pro.setPrice(Integer.parseInt(request.getParameter("price")));
		pro.setName(request.getParameter("name"));
		pro.setContent(request.getParameter("content"));
		pro.setKinds(request.getParameter("kinds"));
		pro.setDelivery(request.getParameter("delivery"));
		pro.setAmount(Integer.parseInt(request.getParameter("amount")));
		pro.setDelivery_company(request.getParameter("delivery_company"));
		pro.setCompany(request.getParameter("company"));
		
		
		String f_name1="";
		String f_name2="";
		String f_name3="";
		String f_name4="";
		String f_name5="";
		
		for(Part part:request.getParts()) {
			if(part.getName().equals("file1") || part.getName().equals("file2") || part.getName().equals("file3") || part.getName().equals("file4") || part.getName().equals("file5")) {
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
				if(part.getName().equals("file5") && part.getSize() >0){
					f_name5=uploadFileName;
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
			//썸네일 처리부분
			String uploadPath = "E:\\jsp\\lupang\\WebContent\\upload";
			String orgImg = uploadPath+"\\"+f_name1;//원본파일
			String thum_name = "thum_"+f_name1;//섬네일 파일 이름
			String thumbImg = uploadPath+"\\thum_"+f_name1;//썸네일파일 저장
			int thumbWidth = 100 ;//썸네일 가로
			int thumbHeight = 100 ;//썸네일 세로
	
			Image thumbnail = JimiUtils.getThumbnail(orgImg, thumbWidth, thumbHeight, Jimi.IN_MEMORY);// 썸네일 설정
			try {
				Jimi.putImage(thumbnail, thumbImg);// 썸네일 생성
			}catch(Exception e) {
				e.printStackTrace();
			}		

						
			pro.setFile1(f_name1);
			pro.setFile2(f_name2);
			pro.setFile3(f_name3);
			pro.setFile4(f_name4);
			pro.setFile5(f_name5);
			pro.setSum_file(thum_name);
			ProductDao dao = new ProductDao();		
			dao.insertProduct(pro);			
			
			
			RequestDispatcher dis=request.getRequestDispatcher("/Productlist.do");
			dis.forward(request, response);
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

