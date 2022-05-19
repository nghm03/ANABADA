package go.to.mars.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import go.to.mars.dao.ProductDAO;
import go.to.mars.dao.ProductMapper;
import go.to.mars.vo.CartVO;
import go.to.mars.vo.ProductVO;

@Service
public class ProductService {

	@Autowired
	ProductDAO dao;

	@Autowired
	HttpSession session;

	
	public ArrayList<ProductVO> selectProductList() {
		ArrayList<ProductVO> pvl = new ArrayList<>();
		
		pvl = dao.selectProductList();
		
		return pvl;
	}

	public ProductVO selectBuy(int p) {
		ProductVO pv = new ProductVO();
		
		pv = dao.selectBuy(p);
		
		return pv;
	}
	
	//장바구니 (추가 및 출력)
    public String addnum(int product_num, String user_id) {
        //장바구니 추가
        int result = dao.addnum(product_num,user_id);
        //장바구니 출력
        if (result == 1) { session.setAttribute("cartList", dao.cartList(user_id)); }
        return "redirect:NewFile";
    }
    
    //장바구니 (유저캐시,토탈)
    public HashMap<String, Integer> priceInfo() {
        String user_id = (String) session.getAttribute("user_id");
        return dao.priceInfo(user_id);
    }

    //작은 카트에서 삭제눌렀을때
    public String deleteCart(int value) {
        String user_id = (String) session.getAttribute("user_id");
        dao.deleteCart(value,user_id);
        session.setAttribute("cartList", dao.cartList(user_id));
        return "redirect:NewFile";
    }

    //큰 카트에서 삭제눌렀을때
    public String deleteCart2(int value) {
        String user_id = (String) session.getAttribute("user_id");
        dao.deleteCart(value,user_id);
        session.setAttribute("cartList", dao.cartList(user_id));
        return "redirect:payment";
    }

    //구매하기 눌렀을 때
    public void checkOut() {
        String user_id = (String) session.getAttribute("user_id");
        int result = dao.checkOut(user_id);
        
        if (result >= 1) {
            session.removeAttribute("cartList");
            session.setAttribute("cartList", dao.cartList(user_id));
        }
        
    }

    public HashMap<String, Object> userOrderInfo(String user_id) {
        return dao.userOrderInfo(user_id);
    }
	
    public boolean cartCheck(int product_num, String user_id) {
    	CartVO cartVO = new CartVO();
    	cartVO.setProduct_num(product_num);
    	cartVO.setUser_id(user_id);
    	
    	
    	System.out.println("하아" + dao.cartCheck(cartVO));
    	
    	if(dao.cartCheck(cartVO) == null) {
        	return true;
    	} else {
    		return false;
    	}
    }
    
    public ArrayList<ProductVO> search(String search) {
    	ArrayList<ProductVO> ProductVOList = new ArrayList<>(); 
    	
    	ProductVOList = dao.search(search);
        
    	return ProductVOList;	
    }
}
