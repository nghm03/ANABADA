package go.to.mars.dao;

import java.util.ArrayList;

import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.ProductVO;
import go.to.mars.vo.SellVO;
import go.to.mars.vo.UserVO;

public interface ManagerMapper {
	public int addProduct(ProductVO productVO); // 상품 등록
	public int addSellInfo(BuyinfoVO buyinfoVO); // 판매 완료 등록
	public int updateProduct(ProductVO productVO); // 상품 업데이트
	public int updateProductStock_0(int product_num);
	public int updateProductStock_1(int product_num);
	public int updateBuyInfoStock(int buyInfo_num);
	
	public ArrayList<UserVO> selectUserList();
	public ArrayList<ProductVO> selectProductList();
	public ArrayList<BuyinfoVO> selectBuyinfoList();
	public ArrayList<SellVO> selectSellList();
	public ArrayList<ContactVO> selsctContactList();
	public ProductVO selectProduct(int num);
	public BuyinfoVO selectBuyinfo(int num);
	
	public int deleteUser(String id);
	public int deleteProduct(int product_num);
	public int deleteBuyinfo(int buy_num);
	public int deleteSell(int sell_num);
	public int deleteContact(int contact_num);
}
