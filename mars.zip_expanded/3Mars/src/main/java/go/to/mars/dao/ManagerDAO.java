package go.to.mars.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.ProductVO;
import go.to.mars.vo.SellVO;
import go.to.mars.vo.UserVO;

@Repository
public class ManagerDAO {

	@Autowired
	private SqlSession session;

	public int addProduct(ProductVO productVO) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.addProduct(productVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int addSellInfo(BuyinfoVO buyinfoVO) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.addSellInfo(buyinfoVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int updateProduct(ProductVO productVO) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.updateProduct(productVO);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int updateProductStock_0(int product_num) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.updateProductStock_0(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int updateProductStock_1(int product_num) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.updateProductStock_1(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int updateBuyInfoStock(int buyInfo_num) {
		int conut = 0;
		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.updateBuyInfoStock(buyInfo_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}
	
	public ArrayList<UserVO> selectUserList() {
		ArrayList<UserVO> uvl = new ArrayList<>();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			uvl = mapper.selectUserList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return uvl;
	}

	public ArrayList<ProductVO> selectProductList() {
		ArrayList<ProductVO> pvl = new ArrayList<>();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			pvl = mapper.selectProductList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pvl;
	}

	public ArrayList<BuyinfoVO> selectBuyinfoList() {
		ArrayList<BuyinfoVO> bvl = new ArrayList<>();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			bvl = mapper.selectBuyinfoList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bvl;
	}

	public ArrayList<SellVO> selectSellList() {
		ArrayList<SellVO> svl = new ArrayList<>();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			svl = mapper.selectSellList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return svl;
	}

	public ArrayList<ContactVO> selectContactList() {

		ArrayList<ContactVO> contactList = new ArrayList<>();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			contactList = mapper.selsctContactList();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return contactList;
	};

	public ProductVO selectProduct(int num) {
		ProductVO pv = new ProductVO();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			pv = mapper.selectProduct(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return pv;
	}

	public BuyinfoVO selectBuyinfo(int num) {

		BuyinfoVO bv = new BuyinfoVO();

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			bv = mapper.selectBuyinfo(num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return bv;
	}

	public int deleteUser(String id) {
		int conut = 0;

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.deleteUser(id);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int deleteProduct(int product_num) {
		int conut = 0;

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.deleteProduct(product_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int deleteBuyinfo(int buy_num) {
		int conut = 0;

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.deleteBuyinfo(buy_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

	public int deleteSell(int sell_num) {
		int conut = 0;

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.deleteSell(sell_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}
	
	public int deletecontact(int contact_num) {
		int conut = 0;

		try {
			ManagerMapper mapper = session.getMapper(ManagerMapper.class);
			conut = mapper.deleteContact(contact_num);
		} catch (Exception e) {
			e.printStackTrace();
		}

		return conut;
	}

}
