package dao;

import java.io.File;
import java.util.ArrayList;

import model.Qna;

public class QnaDao extends Dao {
	
	

	//게시판글쓰기
		public void insertQna(Qna q) {
			getCon();
			
			try {
				
				int fid = 0;
				String sql = "select max(fid) as fid_max from qna" ;
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();//select
					
				
				if(rs.next()){
					if(rs.getInt("fid_max") > 0){//존재 할 경우
						fid = rs.getInt("fid_max") + 1;
					}else{//게시물 첫 글일 경우
						fid = 1;
					}
				}

				
				sql="insert into qna (email, name, subject, comment, signdate, gongji, file1, thread, fid) values (?, ?, ?, ?, ?, ?, ?, ?, ?)";
				
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,q.getEmail());
				pstmt.setString(2,q.getName());
				pstmt.setString(3,q.getSubject());
				pstmt.setString(4,q.getComment());
				pstmt.setString(5,q.getSigndate());
				pstmt.setString(6,q.getGongji());
				pstmt.setString(7,q.getFile1());
				pstmt.setString(8,q.getThread());
				pstmt.setInt(9,fid);
				
				
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
				
				}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
	
		//Qna뷰
		public Qna viewQna(int uid) {
			getCon();
				
				Qna q=new Qna();
			
				try {
					String sql= "update qna set ref= ref+1 where uid=?";
		            pstmt=conn.prepareStatement(sql);
		            pstmt.setInt(1, uid);
		            pstmt.executeUpdate();
					
					sql="select * from qna where uid=?";
					
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, uid);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						q.setUid(rs.getInt(1));
						q.setEmail(rs.getString(2));
						q.setName(rs.getString(3));
						q.setSubject(rs.getString(4));
						q.setComment(rs.getString(5));
						q.setSigndate(rs.getString(6));
						q.setRef(rs.getInt(7));
						q.setGongji(rs.getString(8));
						q.setFile1(rs.getString(9));
						q.setFid(rs.getInt(10));
						q.setThread(rs.getString(11));
						
						
						
						rs.close();
						pstmt.close();
						if(conn!=null) {conn.close();}
					}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return q;
				
		}
		
		//총게시글수
		
		public int getAllCount() {
			getCon();
			
			int count=0;
			
			try {
				String sql="select count(*) from qna";
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
					if(rs.next()) {
						count=rs.getInt(1);
					}
					rs.close();
					pstmt.close();
					conn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
			return count;
		}
		
		//총게시물리스트
		
		public ArrayList<Qna> getAllQna(int startRow, int pageSize){
			getCon();
			
			ArrayList<Qna> v=new ArrayList<Qna>();
			
			try {
				String sql="select * from qna where gongji != 1 order by fid desc, thread asc limit ?,?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, pageSize);
				rs=pstmt.executeQuery();
					while(rs.next()) {
						Qna q=new Qna();
						q.setUid(rs.getInt("uid"));
						q.setEmail(rs.getString("email"));
						q.setName(rs.getString("name"));
						q.setSubject(rs.getString("subject"));
						q.setComment(rs.getString("comment"));
						q.setSigndate(rs.getString("signdate"));
						q.setRef(rs.getInt("ref"));
						q.setGongji(rs.getString("gongji"));
						q.setFile1(rs.getString("file1"));
						q.setFid(rs.getInt("fid"));
						q.setThread(rs.getString("thread"));
						
						v.add(q);
						
					}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return v;
		}
	
		
		//공지불러오기
		public ArrayList<Qna> gongjiQna(){
			getCon();
			
			ArrayList<Qna> v1=new ArrayList<Qna>();
			
			try {
				String sql="select * from qna where gongji='1'"; 
				pstmt=conn.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
					while(rs.next()) {
						Qna q=new Qna();
						q.setUid(rs.getInt("uid"));
						q.setEmail(rs.getString("email"));
						q.setName(rs.getString("name"));
						q.setSubject(rs.getString("subject"));
						q.setComment(rs.getString("comment"));
						q.setSigndate(rs.getString("signdate"));
						q.setRef(rs.getInt("ref"));
						q.setGongji(rs.getString("gongji"));
						q.setFile1(rs.getString("file1"));
						q.setFid(rs.getInt("fid"));
						q.setThread(rs.getString("thread"));
						
						v1.add(q);
					}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return v1;
		}
		
		
		
		//수정하기
		public Qna updateQna(Qna q) {
			getCon();
			
				try {
					String sql="update qna set email=?, name=?, subject=?, comment=?, gongji=?, file1=? where uid=?";
					pstmt=conn.prepareStatement(sql);
					
					pstmt.setString(1, q.getEmail());
					pstmt.setString(2, q.getName());
					pstmt.setString(3, q.getSubject());
					pstmt.setString(4, q.getComment());
					pstmt.setString(5, q.getGongji());
					pstmt.setString(6, q.getFile1());
					pstmt.setInt(7, q.getUid());
					
					pstmt.executeUpdate();
					
					pstmt.close();
					if(conn != null) {conn.close();}
					
					
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				return q;
		}
		
		//답변 보기
		
		public Qna replyQna(int uid) {
			getCon();
				Qna q=new Qna();
				try {
					String sql="select * from qna where uid=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, uid);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						
						q.setSubject(rs.getString("subject"));
						q.setComment(rs.getString("comment"));
						q.setFid(rs.getInt("fid"));
						q.setThread(rs.getString("thread"));
						
						rs.close();
						pstmt.close();
						if(conn == null) {conn.close();}
						
					}
					
				}catch(Exception e){
					e.printStackTrace();
				}
				return q;
		}
		
		//thread 값 설정
		
		public String insertReply(String thread,int fid) {
			getCon();
				Qna q=new Qna();
				String new_thread="";
				try {
					String sql="select * ,right(thread,1) as thread_right from qna where fid=? AND length(thread) = length(?)+1"; 
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, fid);
					pstmt.setString(2, thread);
					rs=pstmt.executeQuery();
										
					String o_thread="";
					String r_thread="";
					String thread_head="";
					new_thread="";
					char thread_foot='a';

					if(rs.next()){
						o_thread = rs.getString("thread");
						r_thread = rs.getString("thread_right");
						thread_foot=(char)(r_thread.charAt(0)+1);
					}
					if(o_thread != null&& o_thread !=""){
						thread_head = o_thread.substring(0,o_thread.length()-1);
						new_thread = thread_head + thread_foot;
					}else{
						new_thread = thread + "A";
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
		return new_thread;
		}		

		
		//답변글쓰기
				public void replyupdateQna(Qna q,String th) {
					getCon();
					
					try {
																		
						String sql="insert into qna (email, name, subject, comment, signdate, file1, thread, fid) values (?, ?, ?, ?, ?, ?, ?, ?)";
						
						pstmt=conn.prepareStatement(sql);
						
						pstmt.setString(1,q.getEmail());
						pstmt.setString(2,q.getName());
						pstmt.setString(3,q.getSubject());
						pstmt.setString(4,q.getComment());
						pstmt.setString(5,q.getSigndate());
						pstmt.setString(6,q.getFile1());
						pstmt.setString(7,th);
						pstmt.setInt(8,q.getFid());
						
						
						pstmt.executeUpdate();
						
						pstmt.close();
						conn.close();
						
						}catch(Exception e) {
						e.printStackTrace();
					}
					
		}
				
				
		//게시판 삭제하기
			
		public void deleteQna(int uid) {
			getCon();
			
				try {
					
					
					String sql="delete from qna where uid=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, uid);
					pstmt.executeUpdate();
					
					pstmt.close();
					conn.close();
					
				}catch(Exception e) {
					e.printStackTrace();
				}
		}
}


