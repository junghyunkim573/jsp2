package dao;

import java.io.File;
import java.util.ArrayList;

import model.Picture;
import model.Product;

public class ProductDao extends Dao {
	
	//상품등록
	public void insertProduct(Product pro) {
		getCon();
		
		try {
			String sql="insert into product (email,delivery_company,price,name,content,kinds,delivery,amount,file1,file2,file3,file4,file5,sum_file,company) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
			
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1,pro.getEmail());
			pstmt.setString(2,pro.getDelivery_company());
			pstmt.setInt(3,pro.getPrice());
			pstmt.setString(4,pro.getName());
			pstmt.setString(5,pro.getContent());
			pstmt.setString(6,pro.getKinds());
			pstmt.setString(7,pro.getDelivery());
			pstmt.setInt(8,pro.getAmount());
			pstmt.setString(9,pro.getFile1());
			pstmt.setString(10,pro.getFile2());
			pstmt.setString(11,pro.getFile3());
			pstmt.setString(12,pro.getFile4());
			pstmt.setString(13,pro.getFile5());
			pstmt.setString(14,pro.getSum_file());
			pstmt.setString(15,pro.getCompany());
			
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
			
			}catch(Exception e) {
			e.printStackTrace();
		}
		
	}
	//상품삭제
	   
	   public void deleteproduct(int uid) {
	      getCon();
	      
	         try {
	        	
	        	 
	             String file1_name = "";
	             String file2_name = "";
	             String file3_name = "";
	             String file4_name = "";
	             String file5_name = "";
	             String sum_file_name = "";
	             
	 

	             String uploadPath = "E:\\jsp\\lupang\\WebContent\\upload";
	            
	        	 String sql = "select * from product where uid=? ";
	        	 pstmt=conn.prepareStatement(sql);
	        	 pstmt.setInt(1, uid);
	        	 rs= pstmt.executeQuery();
	        	 
	        	 if(rs.next()) {
	        		 
	        		 file1_name = rs.getString("file1");
	        		 file2_name=rs.getString("file2");
	        		 file3_name =rs.getString("file3");
	        		 file5_name =rs.getString("file4");
	        		 file5_name =rs.getString("file5");
	        		 sum_file_name = rs.getString("sum_file");
	        		 
	        	 }
	        	 
	        	 File aa = new File(uploadPath + "\\" + file1_name);
	        	 File bb = new File(uploadPath + "\\" + file2_name);
	        	 File cc = new File(uploadPath + "\\" + file3_name);
	        	 File dd = new File(uploadPath + "\\" + file4_name);
	        	 File ee = new File(uploadPath + "\\" + file5_name);
	        	 File ff = new File(uploadPath + "\\" + sum_file_name);
	        	 
	        	
	        	 if(aa.exists()){//파일이 존재 한다면
		                aa.delete();//파일 삭제
		             }
	        	 if(bb.exists()){//파일이 존재 한다면
		                bb.delete();//파일 삭제
		             }
	        	 if(cc.exists()){//파일이 존재 한다면
		                cc.delete();//파일 삭제
		             }
	        	 if(dd.exists()){//파일이 존재 한다면
		                dd.delete();//파일 삭제
		             }
	        	 if(ee.exists()){//파일이 존재 한다면
		                ee.delete();//파일 삭제
		             }
	        	 if(ff.exists()){//파일이 존재 한다면
		                ff.delete();//파일 삭제
		             }
	        	 
	             sql="delete from product where uid=?";
	            
	            pstmt=conn.prepareStatement(sql);
	           
	            pstmt.setInt(1, uid);
	            pstmt.executeUpdate();
	            
	            pstmt.close();
	            conn.close();
	                        
	           
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	        
	   }
	
	 //총 상품수
		
		public int AllCount(String email ,String level) {
			getCon();
			
			int count=0;
			
			try {
				String sql="";
				if(level.equals("10")){
					sql="select count(*) from product where (1)";
					pstmt=conn.prepareStatement(sql);
				
				}
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
		
 //총 상품수
		
		public int AllCount1(String email) {
			getCon();
			
			int count=0;
			
			try {
				String sql="select count(*) from product where email=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, email);
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
		//상품리스트
		
		public ArrayList<Product> AllProduct( String email,String level, int startRow, int pageSize){
			getCon();
			
			ArrayList<Product> v=new ArrayList<Product>();
			
			try {
				String sql="";
				if(level.equals("10")) {
					sql="select * from product where (1) order by uid desc limit ?,?";
						pstmt=conn.prepareStatement(sql);
						pstmt.setInt(1,  startRow);
						pstmt.setInt(2, pageSize);
				}
				


				rs=pstmt.executeQuery();
				
					while(rs.next()) {
						Product pro=new Product();
						pro.setUid(rs.getInt(1));
						pro.setEmail(rs.getString(2));
						pro.setPrice(rs.getInt(3));
						pro.setRef(rs.getInt(4));
						pro.setName(rs.getString(5));
						pro.setContent(rs.getString(6));
						pro.setKinds(rs.getString(7));
						pro.setDelivery(rs.getString(8));
						pro.setAmount(rs.getInt(9));
						pro.setFile1(rs.getString(10));
						pro.setFile2(rs.getString(11));
						pro.setFile3(rs.getString(12));
						pro.setFile4(rs.getString(13));
						pro.setFile5(rs.getString(14));
						pro.setSum_file(rs.getString(15));
						pro.setDelivery_company(rs.getString(16));
						pro.setCompany(rs.getString(17));

						v.add(pro);		
						
					}
			}catch(Exception e) {
				e.printStackTrace();
			}
			return v;
		}

		//상품리스트
		
		public ArrayList<Product> AllProduct1( String email,String level, int startRow, int pageSize){
					getCon();
					
					ArrayList<Product> v=new ArrayList<Product>();
					
					try {
						String sql="";
						if(level.equals("5")) {
							sql="select * from product where email=? order by uid desc limit ?,?";
								pstmt=conn.prepareStatement(sql);
								pstmt.setString(1,  email);
								pstmt.setInt(2,  startRow);
								pstmt.setInt(3, pageSize);
						}
						


						rs=pstmt.executeQuery();
						
							while(rs.next()) {
								Product pro = new Product();
								pro.setUid(rs.getInt(1));
								pro.setEmail(rs.getString(2));
								pro.setPrice(rs.getInt(3));
								pro.setRef(rs.getInt(4));
								pro.setName(rs.getString(5));
								pro.setContent(rs.getString(6));
								pro.setKinds(rs.getString(7));
								pro.setDelivery(rs.getString(8));
								pro.setAmount(rs.getInt(9));
								pro.setFile1(rs.getString(10));
								pro.setFile2(rs.getString(11));
								pro.setFile3(rs.getString(12));
								pro.setFile4(rs.getString(13));
								pro.setFile5(rs.getString(14));
								pro.setSum_file(rs.getString(15));
								pro.setDelivery_company(rs.getString(16));
								pro.setCompany(rs.getString(17));
								
								v.add(pro);	
															
							}
					}catch(Exception e) {
						e.printStackTrace();
					}
					return v;
				}

		
		//상품보기
		
		public Product viewProduct(int uid) {
			getCon();
			
				Product pro=new Product();
				
				try {
					String sql= "update product set ref= ref+1 where uid=?";
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, uid);
					pstmt.executeUpdate();
					
					
					sql="select * from product where uid=?";
					
					pstmt=conn.prepareStatement(sql);
					pstmt.setInt(1, uid);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						pro.setUid(rs.getInt(1));
						pro.setEmail(rs.getString(2));
						pro.setPrice(rs.getInt(3));
						pro.setRef(rs.getInt(4));
						pro.setName(rs.getString(5));
						pro.setContent(rs.getString(6));
						pro.setKinds(rs.getString(7));
						pro.setDelivery(rs.getString(8));
						pro.setAmount(rs.getInt(9));
						pro.setFile1(rs.getString(10));
						pro.setFile2(rs.getString(11));
						pro.setFile3(rs.getString(12));
						pro.setFile4(rs.getString(13));
						pro.setFile5(rs.getString(14));
						pro.setSum_file(rs.getString(15));
						pro.setDelivery_company(rs.getString(16));
						pro.setCompany(rs.getString(17));
						
						rs.close();
						pstmt.close();
						if(conn!=null) {conn.close();}
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				return pro;
		}
	
	//카테고리 리스트 출력
	public ArrayList<Product> categorylist( String kinds, String category , String orderby ,String desc, int amount, String field , String search){
			getCon();
			ArrayList<Product> category_list=new ArrayList<Product>();
					
		try {
			String sql ="";
			if(search=="") {
				 sql="select * from product where  "+kinds+"  =  '"+category +"' and amount != 0  order by "+orderby+" "+desc+" limit 0,? ";
			}else {
				 sql="select * from product where  "+kinds+"  =  '"+field +"' and amount != 0 and name like '%"+search+"%' order by "+orderby+" "+desc+" limit 0,?  ";
			}
			
			pstmt=conn.prepareStatement(sql);
		
			
			pstmt.setInt(1, amount);

			rs=pstmt.executeQuery();

				while(rs.next()) {
					Product pro=new Product();
					pro.setUid(rs.getInt(1));
					pro.setEmail(rs.getString(2));
					pro.setPrice(rs.getInt(3));
					pro.setRef(rs.getInt(4));
					pro.setName(rs.getString(5));
					pro.setContent(rs.getString(6));
					pro.setKinds(rs.getString("kinds"));
					pro.setDelivery(rs.getString(8));
					pro.setAmount(rs.getInt(9));
					pro.setFile1(rs.getString(10));
					pro.setFile2(rs.getString(11));
					pro.setFile3(rs.getString(12));
					pro.setFile4(rs.getString(13));
					pro.setFile5(rs.getString(14));
					pro.setSum_file(rs.getString(15));
					pro.setDelivery_company(rs.getString(16));
					pro.setCompany(rs.getString(17));
				
					category_list.add(pro);	
				}
		}catch(Exception e) {
			e.printStackTrace();
		}

		return category_list;
	}
	
	
	//상품수정
	   
	   public Product productUpdate(Product pro) {
	      getCon();
	      
	      try {
	         String sql="update product set email=?, price=?, name=?, content=?, kinds=?, delivery=?, amount=?, file1=?, file2=?, file3=?, file4=?, file5=?, sum_file=?, delivery_company=?, company=?  where uid=?";
	         pstmt=conn.prepareStatement(sql);
	         
	         pstmt.setString(1, pro.getEmail());
	         pstmt.setInt(2, pro.getPrice());
	         pstmt.setString(3, pro.getName());
	         pstmt.setString(4, pro.getContent());
	         pstmt.setString(5, pro.getKinds());
	         pstmt.setString(6, pro.getDelivery());
	         pstmt.setInt(7, pro.getAmount());
	         pstmt.setString(8, pro.getFile1());
	         pstmt.setString(9, pro.getFile2());
	         pstmt.setString(10, pro.getFile3());
	         pstmt.setString(11, pro.getFile4());
	         pstmt.setString(12, pro.getFile5());
	         pstmt.setString(13, pro.getSum_file());
	         pstmt.setString(14, pro.getDelivery_company());
	         pstmt.setString(15, pro.getCompany());
	         pstmt.setInt(16, pro.getUid());
	         
	         pstmt.executeUpdate();
	         
	         pstmt.close();
	         if(conn !=null) {conn.close();}
	         
	               
	      }catch(Exception e) {
	         e.printStackTrace();
	      }
	      return pro;
	   }
	   
	   
	 //구매 리스트 출력
	   
	   public ArrayList<Product> orderbylist(String orderby, int uid){
	      getCon();
	      
	      ArrayList<Product> orderby_list=new ArrayList<Product>();
	      
	         try {
	            String sql="select * from product where email=? and uid=?";
	            
	            pstmt=conn.prepareStatement(sql);
	            pstmt.setString(1, orderby);
	            pstmt.setInt(2, uid);
	            rs=pstmt.executeQuery();
	            
	               while(rs.next()) {
	                  Product pro=new Product();
	                  pro.setUid(rs.getInt(1));
	                  pro.setAmount(rs.getInt(2));
	                  pro.setPrice(rs.getInt(3));
	                  pro.setDelivery(rs.getString(4));
	                  pro.setDelivery_company(rs.getString(5));
	                  pro.setEmail(rs.getString(6));
	                  pro.setName(rs.getString(7));
	                  
	                  orderby_list.add(pro);
	                  
	                  
	               }
	         }catch(Exception e) {
	            e.printStackTrace();
	         }
	      return orderby_list;
	      
	   }
	   
	   
		//배너등록
		public void insertPicture(Picture pic) {
			getCon();
			
			try {
				String sql="insert into picture (file1, file2, file3, file4, pass1, pass2, pass3, pass4) values (?,?,?,?,?,?,?,?)";
				
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1,pic.getFile1());
				pstmt.setString(2,pic.getFile2());
				pstmt.setString(3,pic.getFile3());
				pstmt.setString(4,pic.getFile4());
				pstmt.setString(5,pic.getPass1());
				pstmt.setString(6,pic.getPass2());
				pstmt.setString(7,pic.getPass3());
				pstmt.setString(8,pic.getPass4());
				
								
				pstmt.executeUpdate();
				
				pstmt.close();
				conn.close();
				
				}catch(Exception e) {
				e.printStackTrace();
			}
			
		}
		
		//배너보기
		
		public Picture viewPicture() {
			getCon();
			
				Picture pic=new Picture();
				
				try {
									
					
					String sql="select * from picture where (1)"; 
					
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
					if(rs.next()) {
						pic.setFile1(rs.getString(1));
						pic.setFile2(rs.getString(2));
						pic.setFile3(rs.getString(3));
						pic.setFile4(rs.getString(4));
						pic.setPass1(rs.getString(5));
						pic.setPass2(rs.getString(6));
						pic.setPass3(rs.getString(7));
						pic.setPass4(rs.getString(8));
											
						rs.close();
						
						if(conn!=null) {conn.close();}
					}
					
				}catch(Exception e) {
					e.printStackTrace();
				}
				return pic;
		}
	   
		//배너수정
		   
		   public Picture updatePicture(Picture pic) {
		      getCon();
		      
		      try {
		    	  	 		        	 
		         String sql="update picture set file1=?, file2=?, file3=?, file4=?, pass1=?, pass2=?, pass3=?, pass4=? where (1)";
		         pstmt=conn.prepareStatement(sql);
		         
		         pstmt.setString(1, pic.getFile1());
		         pstmt.setString(2, pic.getFile2());
		         pstmt.setString(3, pic.getFile3());
		         pstmt.setString(4, pic.getFile4());
		         pstmt.setString(5, pic.getPass1());
		         pstmt.setString(6, pic.getPass2());
		         pstmt.setString(7, pic.getPass3());
		         pstmt.setString(8, pic.getPass4());
		         
		         
		         pstmt.executeUpdate();
		         
		         
		         pstmt.close();
		         if(conn !=null) {conn.close();}
		         
		               
		      }catch(Exception e) {
		         e.printStackTrace();
		      }
		      return pic;


		   }
		
		   	//배너수정2
		   
		   public void updatePicture1(Picture pic,int i) {
			      getCon();
			      
			      String sql="";

			      try {
			    	  
			    	  if(i == 1) {
			    		   sql="update picture set file1=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getFile1());
			    		   System.out.println("i값은" +i);

					    	  
			    	  }
			    	  if(i == 2) {
			    		   sql="update picture set file2=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getFile2());
			    		   System.out.println("i값은" +i);
			    		   
			    	  }
			    	  if(i == 3) {
			    		   sql="update picture set file3=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getFile3());
			    		   
			    		   
			    	  }
			    	  if(i == 4) {
			    		   sql="update picture set file4=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getFile4());
			    		   
			    		   
			    	  }
			    	  if(i == 5) {
			    		   sql="update picture set pass1=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getPass1());
			    		   System.out.println("i값은" +i);
			    		   
			    	  }
			    	  if(i == 6) {
			    		   sql="update picture set pass2=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getPass2());
			    		
			    		   
			    	  }
			    	  if(i == 7) {
			    		   sql="update picture set pass3=? where (1)";
			    		   pstmt=conn.prepareStatement(sql);
			    		   pstmt.setString(1, pic.getPass3());
			    	  }	   
			    		   
			    	  if(i == 8) {
				    		   sql="update picture set pass4=? where (1)";
				    		   pstmt=conn.prepareStatement(sql);
				    		   pstmt.setString(1, pic.getPass4());
				    }  
			    	  pstmt.executeUpdate();
			    	  
			    	  pstmt.close();
			          if(conn !=null) {conn.close();}
			         
			               
			      }catch(Exception e) {
			         e.printStackTrace();
			      }
			      }    
			      
			
		   
		   
		 //배너리스트
			
			public Picture AllPicture(){
				getCon();
				
				Picture pic=new Picture();
				
				try {
					String sql="select * from picture where (1)";
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();
					
						if(rs.next()) {
							
							pic.setFile1(rs.getString("file1"));
							pic.setFile2(rs.getString("file2"));
							pic.setFile3(rs.getString("file3"));
							pic.setFile4(rs.getString("file4"));
							pic.setPass1(rs.getString("pass1"));
							pic.setPass2(rs.getString("pass2"));
							pic.setPass3(rs.getString("pass3"));
							pic.setPass4(rs.getString("pass4"));
							
							rs.close();
							if(conn!=null) {conn.close();}
							
							
						}
				}catch(Exception e) {
					e.printStackTrace();
				}
				return pic;
			}
			
			
			
			//메인바디 리스트 출력
			public Picture bannerlist(){
					getCon();
					Picture pic=new Picture();
							
				try {
					String sql ="select * from picture";
										
					pstmt=conn.prepareStatement(sql);
					rs=pstmt.executeQuery();

						if(rs.next()) {
							
							pic.setFile1(rs.getString("file1"));
							pic.setFile2(rs.getString("file2"));
							pic.setFile3(rs.getString("file3"));
							pic.setFile4(rs.getString("file4"));
							pic.setPass1(rs.getString("pass1"));
							pic.setPass2(rs.getString("pass2"));
							pic.setPass3(rs.getString("pass3"));
							pic.setPass4(rs.getString("pass4"));
													
								
						}
						
						rs.close();
						conn.close();
				}catch(Exception e) {
					e.printStackTrace();
				}

				return pic;
			}
		
}

