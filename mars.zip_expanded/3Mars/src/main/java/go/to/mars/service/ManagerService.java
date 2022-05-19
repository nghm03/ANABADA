package go.to.mars.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import go.to.mars.dao.ManagerDAO;
import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.ProductVO;
import go.to.mars.vo.SellVO;
import go.to.mars.vo.UserVO;

@Service
public class ManagerService {

	@Autowired
	ManagerDAO dao;

	@Autowired
	HttpSession session;

	public boolean addProduct(ProductVO productVO) {

		if (dao.addProduct(productVO) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean addSellInfo(BuyinfoVO buyinfoVO) {

		if (dao.addSellInfo(buyinfoVO) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateProduct(ProductVO productVO) {

		if (dao.updateProduct(productVO) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateProductStock_0 (int product_num) {
		
		if (dao.updateProductStock_0(product_num) == 1) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean updateProductStock_1 (int product_num) {
		
		if (dao.updateProductStock_1(product_num) == 1) {
			return true;
		} else {
			return false;
		}
	}

	public boolean updateBuyInfoStock (int buyInfo_num) {
		
		if (dao.updateBuyInfoStock(buyInfo_num) == 1) {
			return true;
		} else {
			return false;
		}
		
	}
	
	public ArrayList<UserVO> selectUserList() {
		ArrayList<UserVO> uvl = new ArrayList<>();
		uvl = dao.selectUserList();

		return uvl;
	}

	public ArrayList<ProductVO> selectProductList() {
		ArrayList<ProductVO> pvl = new ArrayList<>();
		pvl = dao.selectProductList();

		return pvl;
	}

	public ArrayList<BuyinfoVO> selectBuyinfoList() {
		ArrayList<BuyinfoVO> bvl = new ArrayList<>();
		bvl = dao.selectBuyinfoList();

		return bvl;
	}

	public ArrayList<SellVO> selectSellList() {
		ArrayList<SellVO> svl = new ArrayList<>();
		svl = dao.selectSellList();

		return svl;
	}

	public ArrayList<ContactVO> selectContactList() {
		ArrayList<ContactVO> contactList = new ArrayList<>();
		contactList = dao.selectContactList();

		return contactList;
	}

	public ProductVO selectProduct(int num) {
		ProductVO pv = new ProductVO();
		pv = dao.selectProduct(num);

		return pv;
	}

	public BuyinfoVO selectBuyinfo(int num) {
		BuyinfoVO bv = new BuyinfoVO();
		bv = dao.selectBuyinfo(num);

		return bv;
	}

	public boolean deleteUser(String id) {

		if (dao.deleteUser(id) == 1) {
			return true;
		}
		return false;
	}

	public boolean deleteProduct(int product_num) {
		if (dao.deleteProduct(product_num) == 1) {
			return true;
		}
		return false;
	}

	public boolean deleteBuyinfo(int buy_num) {
		if (dao.deleteBuyinfo(buy_num) == 1) {
			return true;
		}
		return false;
	}

	public boolean deleteSell(int sell_num) {
		if (dao.deleteSell(sell_num) == 1) {
			return true;
		}
		return false;
	}
	
	public boolean deleteContact(int contact_num) {
		if (dao.deletecontact(contact_num) == 1) {
			return true;
		}
		return false;
	}

}
