package go.to.mars.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.CartVO;
import go.to.mars.vo.ProductVO;

public interface ProductMapper {
	
	public ArrayList<ProductVO> selectProductList(); // 상품 리스트 불러오기
	public ProductVO selectBuy(int product_num); // 상품 판매 목록
	
    public CartVO selectProduct(int product_num); // 장바구니 select
    public int plusCart(CartVO cartvo); //장바구니에 insert
    public List<CartVO> cartlist(String user_id); //카트리스트 가져오기
    public int deleteCart(HashMap<String, Object> info); //카트 삭제
    
    public int getCash(String user_id); //유저 캐시 가져오기
    public int getTotal(String user_id); //카트 총 가격 가져오기
    
    public ArrayList<BuyinfoVO> getCartInfo(String user_id); //카트 정보 가져오기
    public int insertBuyInfo(BuyinfoVO buyinfo); //구매정보 테이블 담기
    public int deleteCartinfo(String user_id); // 장바구니 정보 삭제
    public ArrayList<BuyinfoVO> userOrderInfo(String user_id);
    
    public CartVO cartCheck(CartVO cartvo); // 카트체커
    public ArrayList<ProductVO> search(String search); //검색
}
