package dao;

import java.util.ArrayList;

import model.Member;

public class MemberDao extends Dao {
	
	//회원 생성
	public void memberinsert(Member bean) {
		getCon();
		
		try {
			String sql="insert into member2 values (?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, bean.getEmail());
			pstmt.setString(2, bean.getPass());
			pstmt.setString(3, bean.getName());
			pstmt.setString(4, bean.getMobile1());
			pstmt.setString(5, bean.getMobile2());
			pstmt.setString(6, bean.getLevel());
			pstmt.setString(7, bean.getCompanynumber());
			pstmt.setString(8, bean.getCompany());
			pstmt.setString(9, bean.getAccount1());
			pstmt.setString(10, bean.getAccount2());
			pstmt.setString(11, bean.getFile1());
			
			System.out.println(sql);
			pstmt.executeUpdate();
			
			pstmt.close();
			if(conn != null) {conn.close();}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	//로그인 확인 
	public Member joinok(String email , String pass) {
		getCon();
		Member bean = new Member();
		
		try {
			
			String sql = "select * from member2 where email = ? and pass = ? ";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, pass);
			rs = pstmt.executeQuery();
		
			 if(rs.next()) {				
				bean.setEmail(rs.getString("Email"));
				bean.setName(rs.getString("Name"));
				bean.setLevel(rs.getString("level"));	
				bean.setCompany(rs.getString("company"));
			}
			 rs.close();
			 pstmt.close();
			 if(conn!=null) {conn.close();}
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return bean;
	}
	//회원삭제
	public void memberDelete(String email) {
		getCon();
		
		
		try {
		String sql = "delete from member2 where email = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		pstmt.executeUpdate();
		
		pstmt.close();
		if(conn !=null) {conn.close();}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	//회원 정보 불러올기
	public Member memberview(String email) {
		getCon();
		
		Member bean= new Member();
		try {
		String sql = "select * from member2 where email = ? ";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		rs = pstmt.executeQuery();
		
		if(rs.next()) {
			bean.setEmail(rs.getString("email"));
			bean.setPass(rs.getString("pass"));
			bean.setName(rs.getString("name"));
			bean.setMobile1(rs.getString("mobile1"));
			bean.setMobile2(rs.getString("mobile2"));
			bean.setCompanynumber(rs.getString("companynumber"));
			bean.setCompany(rs.getString("company"));
			bean.setFile1(rs.getString("file1"));
			bean.setAccount1(rs.getString("account1"));
			bean.setAccount2(rs.getString("account2"));
			
			
		}
		
		rs.close();
		pstmt.close();
		if(conn !=null) {conn.close();}
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	//회원 정보 수정
	public Member memberUpdate(Member bean) {
		getCon();
		
		
		try {

		String sql = "update member2 set pass=? , name=? , mobile1 = ? , mobile2 = ?, companynumber = ? ,company =? ,account1=? , account2=? ,file1=? ,level = ?  where email = ?";

		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, bean.getPass());
		pstmt.setString(2, bean.getName());
		pstmt.setString(3, bean.getMobile1());
		pstmt.setString(4, bean.getMobile2());
		pstmt.setString(5, bean.getCompanynumber());
		pstmt.setString(6, bean.getCompany());
		pstmt.setString(7, bean.getAccount1());
		pstmt.setString(8, bean.getAccount2());
		pstmt.setString(9, bean.getFile1());
		pstmt.setString(10, bean.getLevel());
		pstmt.setString(11, bean.getEmail());
		pstmt.executeUpdate();
		
		pstmt.close();
		if(conn !=null) {conn.close();}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	public Member home(String email) {
		getCon();
		Member bean = new Member();
		
		try {
			
			String sql = "select * from member2 where email = ?";
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, email);
			rs = pstmt.executeQuery();
		
			 if(rs.next()) {				
				bean.setEmail(rs.getString("Email"));
				bean.setName(rs.getString("Name"));
				bean.setLevel(rs.getString("level"));	
			}
			 rs.close();
			 pstmt.close();
			 if(conn!=null) {conn.close();}
				
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return bean;
		
	}
	   //총 회원수
    
    public int getAllCount() {
       getCon();
       
       int count=0;
       
       try {
          String sql="select count(*) from member2";
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
    
    //총 회원 리스트
    
    public ArrayList<Member> getAllMember(int startRow, int pageSize){
       getCon();
       
       ArrayList<Member> v=new ArrayList<Member>();
       
       try {
          String sql="select * from member2 where (1) order by email desc limit ?,?";
          pstmt=conn.prepareStatement(sql);
          pstmt.setInt(1,  startRow);
          pstmt.setInt(2, pageSize);
          rs=pstmt.executeQuery();
          
             while(rs.next()) {
                Member bean=new Member();
                bean.setEmail(rs.getString(1));
                bean.setPass(rs.getString(2));
                bean.setName(rs.getString(3));
                bean.setMobile1(rs.getString(4));
                bean.setMobile2(rs.getString(5));
                bean.setLevel(rs.getString(6));
                bean.setCompanynumber(rs.getString(7));
                bean.setCompany(rs.getString(8));
                bean.setAccount1(rs.getString(9));
                bean.setAccount2(rs.getString(10));
                bean.setFile1(rs.getString(11));
                                  
                v.add(bean);
                
                
                
                
             }
       }catch(Exception e) {
          e.printStackTrace();
       }
       return v;
    }
}



















