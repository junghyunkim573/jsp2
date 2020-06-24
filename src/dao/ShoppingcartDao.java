package dao;

import java.util.ArrayList;

import model.Buy;
import model.Member;
import model.Product;
import model.Shoppingcart;

public class ShoppingcartDao extends Dao {
   
   //장바구니 삽입
   public int insertShoppingcart(String email,int count ,Product pro) {
      getCon();
      int pt_amount=0;
      int ptuid =0;
      int cancel=0;
      int sp_amount=0;
      
      try {
       
         //같은상품 장바구니 등록시 비교후 업데이트처리
        String sql ="select * from shoppingcart where email= ? and pt_uid = ? ";
        pstmt=conn.prepareStatement(sql);
        pstmt.setString(1,email);
        pstmt.setInt(2,pro.getUid());
        
        rs=pstmt.executeQuery();
        
        if(rs.next()) {
           ptuid =rs.getInt("pt_uid");
           sp_amount=rs.getInt("amount");
        }
        //구매 수량이 상품 수량보다 많을 경우 되돌리 처리하기
         sql="select * from product where uid= ?";
        pstmt=conn.prepareStatement(sql);
        pstmt.setInt(1, pro.getUid());
        rs=pstmt.executeQuery();
        
        if(rs.next()) {
           pt_amount=rs.getInt("amount");
        }
         rs.close();
        
        //장바구니 수량이 상품 수량보다 많은 경우
        if(count+sp_amount > pt_amount  ) {
           cancel=1;
        } else { 
           
        //같은 상품이 있을경우
        if(ptuid == pro.getUid() ) {
           
           sql="update shoppingcart set amount = amount + ? where pt_uid = ? and email= ? ";
           pstmt=conn.prepareStatement(sql);
           pstmt.setInt(1, count);
             pstmt.setInt(2,pro.getUid());
             pstmt.setString(3,email);
           
             pstmt.executeUpdate();
        }else {//같은 상품이 없을 경우
           sql="insert into shoppingcart (pt_uid,email,price,name,delivery,amount,file1) values (?,?,?,?,?,?,?)";
             pstmt=conn.prepareStatement(sql);
             
             pstmt.setInt(1,pro.getUid());
             pstmt.setString(2,email);
             pstmt.setInt(3,pro.getPrice());
             pstmt.setString(4,pro.getName());
             pstmt.setString(5,pro.getDelivery());
             pstmt.setInt(6,count);
             pstmt.setString(7,pro.getSum_file());

             pstmt.executeUpdate();

           
           }      
        }
         pstmt.close();
         conn.close();
         
         }catch(Exception e) {
         e.printStackTrace();
         }
      return cancel;
   }
   
   
   
   //상품보기
   public ArrayList<Shoppingcart> viewShoppingcart(String email) {
      getCon();
      
      ArrayList<Shoppingcart> v=new ArrayList<Shoppingcart>();
         
      try {
         String sql="select * from shoppingcart where email=?";
         
         pstmt=conn.prepareStatement(sql);
         pstmt.setString(1, email);
         rs=pstmt.executeQuery();
         
         while(rs.next()) {
            Shoppingcart cart = new Shoppingcart();
            
            cart.setUid(rs.getInt(1));
            cart.setPt_uid(rs.getInt(2));
            cart.setEmail(rs.getString(3));
            cart.setPrice(rs.getInt(4));
            cart.setName(rs.getString(5));
            cart.setDelivery(rs.getString(6));
            cart.setAmount(rs.getInt(7));
            cart.setFile1(rs.getString(8));
            v.add(cart);
         }
        
         
         if(rs!=null) {rs.close();}
         if(pstmt!=null) {pstmt.close();}
         if(conn!=null) {conn.close();}
         
      }catch(Exception e) {
         e.printStackTrace();
      }
      return v;
   }
   
   //상품삭제      
   public void deleteshoppingcart(int uid) {
      getCon();
      
         try {
            String sql="delete from shoppingcart where uid=?";
            
            pstmt=conn.prepareStatement(sql);
            
            pstmt.setInt(1,uid);
            pstmt.executeUpdate();
            
            pstmt.close();
            conn.close();
                        
            
         }catch(Exception e) {
            e.printStackTrace();
         }
   }      
   
   //상품 리스트 출력
      public ArrayList<Shoppingcart> purchaselist(String email , String orderby){
            getCon();
            ArrayList<Shoppingcart> purchase_list=new ArrayList<Shoppingcart>();
        
                 
         try {
            
            String sql="select * from shoppingcart where email = ? order by ? desc limit 0,9";
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, orderby);
            rs=pstmt.executeQuery();
         
               while(rs.next()) {
                  Shoppingcart cart=new Shoppingcart();
                  
                  cart.setPt_uid(rs.getInt(2));
                  cart.setEmail(rs.getString(3));
                  cart.setPrice(rs.getInt(4));
                  cart.setName(rs.getString(5));
                  cart.setDelivery(rs.getString(6));
                  cart.setAmount(rs.getInt(7));
                  cart.setFile1(rs.getString(8));
                  
                  
                  purchase_list.add(cart);   
                  
               }
               rs.close();
               pstmt.close();
               conn.close();
         }catch(Exception e) {
            e.printStackTrace();  
         }
         return purchase_list;
      }
      //바로 구매 상품 출력
      
      public ArrayList<Product> nowpurchase( int uid, int amount){
          getCon();
          ArrayList<Product>  now_purchase=new ArrayList<Product>();         
       try {
          
          String sql="select * from product where uid= ? ";
          pstmt=conn.prepareStatement(sql);
          pstmt.setInt(1, uid);
          rs=pstmt.executeQuery();
          
             while(rs.next()) {
                Product cart=new Product();
                cart.setUid(rs.getInt("uid"));
                cart.setEmail(rs.getString("email"));
                cart.setPrice(rs.getInt("price"));
                cart.setName(rs.getString("name"));
                cart.setDelivery(rs.getString("delivery"));
                cart.setAmount(amount);
                cart.setFile1(rs.getString("sum_file"));
                
                now_purchase.add(cart);         
             }
             rs.close();
             pstmt.close();
             conn.close();
       }catch(Exception e) {
          e.printStackTrace();  
       }
       return now_purchase;
    }
      
      //장바구니 페이지 상품 수량 설정
      public int cartUpdate(int uid , int num , int pt_uid) {
         getCon();        
         int cancel=0;
         String sql="";
         try {
            int pt_amount=0;
            int sp_amount=0;
            if(num ==  1 ) {      
            //구매 수량이 상품 수량보다 많을 경우 수량 못올리게 처리하기
             sql="select * from product where uid= ?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, pt_uid);
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
               pt_amount=rs.getInt("amount");
            }
            }
            sql="select * from shoppingcart where uid= ?";
            pstmt=conn.prepareStatement(sql);
            pstmt.setInt(1, uid);
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
               sp_amount=rs.getInt("amount");
            }
             rs.close();
             System.out.println(pt_amount);
             System.out.println(sp_amount);
            
            //
            if(pt_amount == sp_amount) {
               cancel=1;
            }else {
                sql = "update shoppingcart set amount = amount +? where uid= ?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setInt(1, num);
                pstmt.setInt(2, uid);
               
               pstmt.executeUpdate();
               
            }
            
              pstmt.close();
              conn.close();
            
            
            
         }catch(Exception e) {
            e.printStackTrace();
         }
        
      return cancel;
         
      }
      //상품 구매 등록및 상품 개수 -처리
      public void buyinsert(Buy buy) {
         getCon();
            
         String sql="";
         try {
        	 
            //상품 정보 불러오기
            String price="";
            String product_name="";
            String delivery="";
            sql="select * from product where uid= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, buy.getProduct_uid());
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
               product_name=rs.getString("name");
               price=rs.getString("price");
               delivery=rs.getString("delivery");
            }
            rs.close();
            //구매한 상품 등록
             sql= "insert into buy (email,buyer_name,buyer_mobile1,buyer_mobile2,delivery_name,delivery_mobile1,delivery_mobile2,addr1,addr2,addr3,addr4,content,buy_date,method,product_uid,amount) value (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
            pstmt = conn.prepareStatement(sql);
            
            pstmt.setString(1, buy.getEmail());
            pstmt.setString(2, buy.getBuyer_name());
            pstmt.setString(3, buy.getBuyer_mobile1());
            pstmt.setString(4, buy.getBuyer_mobile2());
            pstmt.setString(5, buy.getDelivery_name());
            pstmt.setString(6, buy.getDelivery_mobile1());
            pstmt.setString(7, buy.getDelivery_mobile2());
            pstmt.setString(8, buy.getAddr1());
            pstmt.setString(9, buy.getAddr2());
            pstmt.setString(10, buy.getAddr3());
            pstmt.setString(11, buy.getAddr4());
            pstmt.setString(12, buy.getContent());
            pstmt.setString(13, buy.getBuy_date());
            pstmt.setString(14, buy.getMethod());
//            pstmt.setString(15, delivery);
            pstmt.setInt(15, buy.getProduct_uid());
//            pstmt.setString(17, product_name);
//            pstmt.setString(18, price);
            pstmt.setInt(16, buy.getAmount());
            

            pstmt.executeUpdate();
            
            //구매한 만큼의 수량 빼기
            sql="update product set amount = amount-? where uid= ?";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, buy.getAmount());
            pstmt.setInt(2, buy.getProduct_uid());
            
            pstmt.executeUpdate();
             
            // 구매한 물품 장바구니에서 제거 하기
            sql="delete from shoppingcart where pt_uid= ? and email= ? ";
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, buy.getProduct_uid());
            pstmt.setString(2, buy.getEmail());
            pstmt.executeUpdate(); 
             System.out.println( buy.getProduct_uid());
             pstmt.close();
             if(conn !=null) {
                conn.close();
             }      
         }catch(Exception e) {
            e.printStackTrace();
         }
      }
//구매리스트 사용자 정보 출력
      
      public ArrayList<Buy> viewBuy(String email) {
         getCon();
         ArrayList<Buy> buy_list=new ArrayList<Buy>(); 
            try {
               String sql="select * from buy where email=?";
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, email);
               rs=pstmt.executeQuery();
               
               while(rs.next()) {
            	   Buy buy=new Buy();
	            	   
            	   		
	                	  buy.setProduct_account1("account1");
	                	  buy.setProduct_account2("account2");
	                	  buy.setUid(rs.getInt("uid"));
		            	  buy.setProduct_uid(rs.getInt("product_uid"));
		            	  buy.setAmount(rs.getInt("amount"));
		                  buy.setEmail(rs.getString("email"));
		                  buy.setDelivery_name(rs.getString("delivery_name"));
		                  buy.setDelivery_mobile1(rs.getString("delivery_mobile1"));
		                  buy.setDelivery_mobile2(rs.getString("delivery_mobile2"));
		                  buy.setAddr1(rs.getString("addr1"));
		                  buy.setAddr2(rs.getString("addr2"));
		                  buy.setAddr3(rs.getString("addr3"));
		                  buy.setAddr4(rs.getString("addr4"));
		                  buy.setContent(rs.getString("content"));
		                  buy.setBuy_date(rs.getString("buy_date"));
		                  buy.setMethod(rs.getString("method"));
	                  
                  buy_list.add(buy);
                  
               }
                     
               
               
            }catch(Exception e) {
               e.printStackTrace();
            }
            return buy_list;
      }
      
      
//구매리스트 사용자 정보 출력
      
      public ArrayList<Buy> viewBuy1(String email,int startRow, int pageSize) {
         getCon();
         ArrayList<Buy> buy_list=new ArrayList<Buy>(); 
            try {
               String sql="select * from buy where email=? limit ?,?";
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, email);
               pstmt.setInt(2, startRow);
               pstmt.setInt(3, pageSize);
               rs=pstmt.executeQuery();
               
               while(rs.next()) {
            	   Buy buy=new Buy();
	            	   
            	   		
	                	  buy.setProduct_account1("account1");
	                	  buy.setProduct_account2("account2");
	                	  buy.setUid(rs.getInt("uid"));
		            	  buy.setProduct_uid(rs.getInt("product_uid"));
		            	  buy.setAmount(rs.getInt("amount"));
		                  buy.setEmail(rs.getString("email"));
		                  buy.setDelivery_name(rs.getString("delivery_name"));
		                  buy.setDelivery_mobile1(rs.getString("delivery_mobile1"));
		                  buy.setDelivery_mobile2(rs.getString("delivery_mobile2"));
		                  buy.setAddr1(rs.getString("addr1"));
		                  buy.setAddr2(rs.getString("addr2"));
		                  buy.setAddr3(rs.getString("addr3"));
		                  buy.setAddr4(rs.getString("addr4"));
		                  buy.setContent(rs.getString("content"));
		                  buy.setBuy_date(rs.getString("buy_date"));
		                  buy.setMethod(rs.getString("method"));
	                  
                  buy_list.add(buy);
                  
               }
                     
               
               
            }catch(Exception e) {
               e.printStackTrace();
            }
            return buy_list;
      }
      
      
    //개인구매 상품수
      public int orderCount(String email) {
          getCon();
          int count=0;
             try {
                String sql="select count(*) from buy where email=?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setString(1, email);
                rs= pstmt.executeQuery();
                
                if(rs.next()) {
                	count=rs.getInt(1);
                }
             }catch(Exception e){
            	 e.printStackTrace();
            	 
             }
             return count;
      }

      //구매 상품수
      public int AllorderCount() {
          getCon();
          int count=0;
             try {
                String sql="select count(*) from buy";
                pstmt=conn.prepareStatement(sql);
                rs= pstmt.executeQuery();
                
                if(rs.next()) {
                	count=rs.getInt(1);
                }
             }catch(Exception e){
            	 e.printStackTrace();
            	 
             }
             return count;
      }
      public ArrayList<Buy> allorderlist(int startRow , int pageSize) {
          getCon();
          ArrayList<Buy> buy_list=new ArrayList<Buy>();
             try {
                String sql="select * from buy where (1) limit ?,?";
                pstmt=conn.prepareStatement(sql);
                pstmt.setInt(1, startRow);
                pstmt.setInt(2, pageSize);
                rs=pstmt.executeQuery();
                
                while(rs.next()) {
                    
              	    Buy buy= new Buy();
              	   
	              	   
                	sql="select * from product where uid=?";
                    pstmt=conn.prepareStatement(sql);
                    pstmt.setInt(1,rs.getInt("product_uid"));
                    rs2=pstmt.executeQuery();
                	String pt_name = "";  //상품 이름  이메일 가격 불러오기
                	int pt_price=0;
                	String pt_email = "";
                    while(rs2.next()) {
                    	pt_name = rs2.getString("name");
                    	pt_price = rs2.getInt("price");
                    	pt_email = rs2.getString("email");
                    }
                   buy.setProduct_uid(rs.getInt("product_uid"));
              	   buy.setProduct_name(pt_name);
              	   buy.setProduct_price(pt_price);
              	   //불러온 판매자 이메일로 판매자 계좌번호 찾기
              	 sql="select account1,account2 from member2 where email=?";
                 pstmt=conn.prepareStatement(sql);
                 pstmt.setString(1, pt_email);
                 rs2=pstmt.executeQuery();
                 System.out.println("111111");
                 String user_account1 = "";  //판매자 계좌 은행
                 String user_account2 = "";  //판매자 계좌 부르기
                 while(rs2.next()) {
                	 user_account1=rs2.getString("account1");
                	 user_account2=rs2.getString("account2");
                 }
                   
              	   
              	   
             	   buy.setUid(rs.getInt("uid")); 
             	   buy.setAmount(rs.getInt("amount"));
                   buy.setEmail(rs.getString("email"));
                   buy.setBuyer_name(rs.getString("buyer_name"));
                   buy.setBuy_date(rs.getString("buy_date"));
                   buy.setMethod(rs.getString("method"));
                   buy.setProduct_account1(user_account1);
                   buy.setProduct_account2(user_account2);
                   buy_list.add(buy);
                   
                }
                      
                rs.close();
                pstmt.close();
                conn.close();
                
                
             }catch(Exception e) {
                e.printStackTrace();
             }
             return buy_list;
      }  

      
      //결제 사이트 상품불러오기
      
      public ArrayList<Buy> viewProduct(String email){
         getCon();


         ArrayList<Buy> pro_list=new ArrayList<Buy>();
            try {
               String sql="select * from buy where email=?";
               
               pstmt=conn.prepareStatement(sql);
               pstmt.setString(1, email);
               rs=pstmt.executeQuery();
                  
                  while(rs.next()){
                     Buy buy=new Buy();
                     
                     
               	   
               	   
               	   
              	   buy.setUid(rs.getInt("uid")); 
              	  
                    pro_list.add(buy);
                  }
                  
                  
                  
               
                     
            }catch(Exception e) {
               e.printStackTrace();
            }
            return pro_list;
      }
      
      
      //일련번호 구매한 상품 뷰
      
      public Buy view(int uid){
    	  getCon();

    	  Buy buy=new Buy();
    	  	try {
    	  		String sql="select * from buy where uid=?";
    	  		
    	  		pstmt=conn.prepareStatement(sql);
    	  		pstmt.setInt(1, uid);
    	  		rs=pstmt.executeQuery();
    	  			
    	  			while(rs.next()){
    	  				    	  				
    	  				buy.setUid(rs.getInt("uid"));
    	  				buy.setProduct_uid(rs.getInt("product_uid"));
    	  				buy.setAmount(rs.getInt("amount"));
    	  				buy.setEmail(rs.getString("email"));
    	  				buy.setBuyer_name(rs.getString("buyer_name"));
    	  				buy.setBuyer_mobile1(rs.getString("buyer_mobile1"));
    	  				buy.setBuyer_mobile2(rs.getString("buyer_mobile2"));
    	  				buy.setDelivery_name(rs.getString("delivery_name"));
    	  				buy.setDelivery_mobile1(rs.getString("delivery_mobile1"));
    	  				buy.setDelivery_mobile2(rs.getString("delivery_mobile2"));
    	  				buy.setAddr1(rs.getString("addr1"));
    	  				buy.setAddr2(rs.getString("addr2"));
    	  				buy.setAddr3(rs.getString("addr3"));
    	  				buy.setAddr4(rs.getString("addr4"));
    	  				buy.setContent(rs.getString("content"));
    	  				buy.setBuy_date(rs.getString("buy_date"));
    	  				buy.setMethod(rs.getString("method"));
    	  			   	  				
    	  			}
    	  			
    	  			rs.close();
    	  			pstmt.close();
    	  			conn.close();
    	  			
    	  		
    	  				
    	  	}catch(Exception e) {
    	  		e.printStackTrace();
    	  	}
    	  	return buy;
      }
      
//계좌불러오기
      
      public Buy viewBuy1(String email) {
    	  getCon();
    	  
    	  Buy buy=new Buy();
    	  	try {
    	  		String sql="select * from buy where email=?";
    	  		pstmt=conn.prepareStatement(sql);
    	  		pstmt.setString(1, email);
    	  		rs=pstmt.executeQuery();
    	  			if(rs.next()) {
    	  				sql="select * from product where uid=?";
                     pstmt=conn.prepareStatement(sql);
                     pstmt.setInt(1,rs.getInt("product_uid"));
                     rs2=pstmt.executeQuery();
                 	String pt_name = "";  //상품 이름 상품 판매자 이메일 가격 불러오기
                 	String pt_email = "";
                 	int pt_price=0;
                     if(rs2.next()) {
                     	pt_name=rs2.getString("name");
                     	pt_price=rs2.getInt("price");
                     	pt_email=rs2.getString("email");
                     }
                    buy.setProduct_uid(rs.getInt("product_uid"));
               	   buy.setProduct_name(pt_name);
               	   buy.setProduct_price(pt_price);
               	   //불러온 판매자 이메일로 판매자 계좌번호 찾기
               	 sql="select * from member2 where email=?";
                  pstmt=conn.prepareStatement(sql);
                  pstmt.setString(1 , pt_email);
                  rs2=pstmt.executeQuery();
                  String account1 = "";  //판매자 계좌 은행
                  String account2 = "";  //판매자 계좌 부르기
                  if(rs2.next()) {
                 	 account1=rs2.getString("account1");
                 	 account2=rs2.getString("account2");
                  }
                  buy.setProduct_account1(account1);
                  buy.setProduct_account2(account2);
                  buy.setBuyer_name(rs.getString("buyer_name"));
    	  			}
    	  			
			rs.close();
			pstmt.close();
			conn.close();	
    	  	}catch(Exception e) {
    	  		e.printStackTrace();
    	  	}
    	  	return buy;
      }
      
//계좌불러오기2
      
      public ArrayList<Buy> viewBuy2(String email) {
    	  getCon();
    	  
    	  ArrayList<Buy> buy_a=new ArrayList<Buy>();
    	  	try {
    	  		String sql="select * from buy where email=?";
    	  		pstmt=conn.prepareStatement(sql);
    	  		pstmt.setString(1, email);
    	  		rs=pstmt.executeQuery();
    	  			while(rs.next()) {
    	  				Buy buy=new Buy();
    	  				
    	  			
	    	  			if(rs.next()) {
	    	  				sql="select * from product where uid=?";
	                     pstmt=conn.prepareStatement(sql);
	                     pstmt.setInt(1,rs.getInt("product_uid"));
	                     rs2=pstmt.executeQuery();
	                 	String pt_name = "";  //상품 이름 상품 판매자 이메일 가격 불러오기
	                 	String pt_email = "";
	                 	int pt_price=0;
	                     while(rs2.next()) {
	                     	pt_name=rs2.getString("name");
	                     	pt_price=rs2.getInt("price");
	                     	pt_email=rs2.getString("email");
	                     }
	                    buy.setProduct_uid(rs.getInt("product_uid"));
	               	   buy.setProduct_name(pt_name);
	               	   buy.setProduct_price(pt_price);
	               	   //불러온 판매자 이메일로 판매자 계좌번호 찾기
	               	 sql="select * from member2 where email=?";
	                  pstmt=conn.prepareStatement(sql);
	                  pstmt.setString(1 , pt_email);
	                  rs2=pstmt.executeQuery();
	                  String account1 = "";  //판매자 계좌 은행
	                  String account2 = "";  //판매자 계좌 부르기
	                  while(rs2.next()) {
	                 	 account1=rs2.getString("account1");
	                 	 account2=rs2.getString("account2");
	                  }
	                  buy.setProduct_account1(account1);
	                  buy.setProduct_account2(account2);
	                  buy_a.add(buy);
    	  			}
    	  			}	
			rs.close();
			pstmt.close();
			conn.close();	
    	  	}catch(Exception e) {
    	  		e.printStackTrace();
    	  	}
    	  	return buy_a;
      }
      
      
}   
      
  

   