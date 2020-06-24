package dao;

import java.util.ArrayList;

import model.Comment;
import model.Product;

public class CommentDao extends Dao {
	
	//코멘트 삽입
	public void insertComment(Comment co) {
		getCon();
		
		try {
			String sql="insert into comment (tb_uid, email, name, comment, data) values (?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, co.getTb_uid());
			pstmt.setString(2, co.getEmail());
			pstmt.setString(3, co.getName());
			pstmt.setString(4, co.getComment());
			pstmt.setString(5, co.getData());
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	
	public ArrayList<Comment> viewComment(int uid) {
		getCon();
		
		ArrayList<Comment> v=new ArrayList<Comment>();
			
			try {
				String sql="select * from comment where tb_uid=?";
				
				pstmt=conn.prepareStatement(sql);
				pstmt.setInt(1, uid);
				rs=pstmt.executeQuery();
				
				while(rs.next()) {
					Comment co = new Comment();
					co.setUid(rs.getInt(1));
					co.setTb_uid(rs.getInt(2));
					co.setEmail(rs.getString(3));
					co.setName(rs.getString(4));
					co.setComment(rs.getString(5));
					co.setData(rs.getString(6));
					
					
					v.add(co);
				}
				
				rs.close();
				pstmt.close();
				if(conn!=null) {conn.close();}
				
			}catch(Exception e) {
				e.printStackTrace();
			}
			return v;
	}
	
	// 코멘트삭제
	
		public void deleteComment(int uid) {
			getCon();
			
				try {
					String sql="delete from comment where uid=?";
					
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
