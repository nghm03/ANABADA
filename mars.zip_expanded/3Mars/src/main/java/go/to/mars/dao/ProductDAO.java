package go.to.mars.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.CartVO;
import go.to.mars.vo.ProductVO;

@Repository
public class ProductDAO {

	@Autowired
	private SqlSession session;
	
	public ArrayList<ProductVO> selectProductList() {
		ArrayList<ProductVO> pvl = new ArrayList<>();
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			pvl = mapper.selectProductList();
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return pvl;
	}
	
	public ProductVO selectBuy(int product_num) {
		ProductVO pv = new ProductVO();
		
		try {
			ProductMapper mapper = session.getMapper(ProductMapper.class);
			pv = mapper.selectBuy(product_num);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return pv;
	}
	
	   //장바구니 추가
    public int addnum(int product_num, String user_id) {
        CartVO cartvo = new CartVO();
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            cartvo = mapper.selectProduct(product_num);
            cartvo.setUser_id(user_id);
            // 장바구니 추가
            int result = mapper.plusCart(cartvo);
            System.out.println("장바구니 등록여부 = " + result);
            if(result >= 1) {
                return result;
            }
        }catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    //장바구니 출력
    public List<CartVO> cartList(String user_id) {
        List<CartVO> list = new ArrayList<>();    
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            list = mapper.cartlist(user_id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //장바구니 (유저캐시,토탈)
    public HashMap<String, Integer> priceInfo(String user_id) {
        HashMap<String, Integer> priceInfo = new HashMap<>();
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            priceInfo.put("Cash", mapper.getCash(user_id));
            priceInfo.put("Total", mapper.getTotal(user_id));
            return priceInfo;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return priceInfo;
    }

    //장바구니 삭제
    public int deleteCart(int value, String user_id) {
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            HashMap<String, Object> info = new HashMap<>();
            info.put("user_id", user_id);
            info.put("product_num", value);
            if (mapper.deleteCart(info) >= 1) {
                return mapper.deleteCart(info);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }
    
    //구매하기 눌렀을 때
    public int checkOut(String user_id) {
        int result = 0;
        
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            ManagerMapper M_mapper = session.getMapper(ManagerMapper.class);
            UserMapper U_mapper = session.getMapper(UserMapper.class);
            
            ArrayList<BuyinfoVO> buyinfo = new ArrayList<>();
            
            buyinfo = mapper.getCartInfo(user_id);
            System.out.println("장바구니 결과" + buyinfo);
            
            
            for (BuyinfoVO buyinfoVO : buyinfo) {
                result += mapper.insertBuyInfo(buyinfoVO);
                M_mapper.updateProductStock_0(buyinfoVO.getProduct_num());
            }
            
            System.out.println("인설트 결과" + result);
            
            int cash = (mapper.getCash(user_id) - mapper.getTotal(user_id));
            HashMap<String, Object> userCash = new HashMap<>();
            userCash.put("user_id", user_id);
            userCash.put("cash", cash);
            result = U_mapper.cashUpdate(userCash);
            System.out.println("유저캐시 결과" + result);
            
            result = mapper.deleteCartinfo(user_id);
            
            System.out.println("딜리트 결과" + result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public HashMap<String, Object> userOrderInfo(String user_id) {
        HashMap<String, Object> userOrderInfo = new HashMap<>();
        ArrayList<BuyinfoVO> buyinfo = new ArrayList<>();
        
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            buyinfo = mapper.userOrderInfo(user_id);
            userOrderInfo.put("userOrderInfo", buyinfo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userOrderInfo;
    }
	
    public CartVO cartCheck(CartVO cartvo) {
    	CartVO cartVO = null; 
    	
        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            cartVO = mapper.cartCheck(cartvo);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
        System.out.println("11"+ cartvo);
        
    	return cartVO;
    }
    
    public ArrayList<ProductVO> search(String search) {
    	ArrayList<ProductVO> ProductVOList = new ArrayList<>(); 

        try {
            ProductMapper mapper = session.getMapper(ProductMapper.class);
            ProductVOList = mapper.search(search);
        } catch (Exception e) {
            e.printStackTrace();
        }
        
    	return ProductVOList;	
    }
}
