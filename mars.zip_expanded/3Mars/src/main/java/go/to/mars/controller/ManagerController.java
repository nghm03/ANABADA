package go.to.mars.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.to.mars.service.ManagerService;
import go.to.mars.vo.BuyinfoVO;
import go.to.mars.vo.ProductVO;

@Controller
public class ManagerController {

	@Autowired
	ManagerService service;

	@RequestMapping(value = "manager/addProduct", method = RequestMethod.POST)
	public String addProduct(ProductVO productVO, Model model) {

		productVO.setProduct_category(productVO.getProduct_category().replace(",", ""));

		if (service.addProduct(productVO)) {
			model.addAttribute("num", 2);
			model.addAttribute("key", 0);
		} else {
			model.addAttribute("num", -1);
			model.addAttribute("key", 0);
		}

		return "redirect:/manager/managerProductTable";
	}

	@RequestMapping(value = "manager/updateProduct", method = RequestMethod.POST)
	public String updateProduct(ProductVO productVO, Model model) {
		// System.out.println(pv);

		productVO.setProduct_category(productVO.getProduct_category().replace(",", ""));

		if (service.updateProduct(productVO)) {
			model.addAttribute("num", 2);
			model.addAttribute("key", 0);
		} else {
			model.addAttribute("num", -1);
			model.addAttribute("key", 0);
		}

		return "redirect:/manager/managerProductTable";
	}
	
	@RequestMapping(value = "manager/updateProductStock_0", method = RequestMethod.GET)
	public String updateProductStock_0(int product_num, Model model) {
		
		System.out.println("확인1" + product_num);
		if(service.updateProductStock_0(product_num)) {
			model.addAttribute("num", 2);
			model.addAttribute("key", 0);
		} else {
			model.addAttribute("num", -1);
			model.addAttribute("key", 0);
		}

		return "redirect:/manager/managerProductTable";
	}
	
	@RequestMapping(value = "manager/updateProductstock_1", method = RequestMethod.GET)
	public String updateProductstock_1(int product_num, Model model) {
		
		System.out.println("확인" + product_num);
		if(service.updateProductStock_1(product_num)) {
			model.addAttribute("num", 2);
			model.addAttribute("key", 0);
		} else {
			model.addAttribute("num", -1);
			model.addAttribute("key", 0);
		}

		return "redirect:/manager/managerProductTable";
	}


	@RequestMapping(value = "manager/addProduct", method = RequestMethod.GET)
	public String addProductPage(Model model) {

		model.addAttribute("num", 0);

		System.out.println(2);
		return "manager/addProduct";
	}

	@RequestMapping(value = "manager/managerPage", method = RequestMethod.GET)
	public String managerPage(Model model) {

		return "manager/managerPage";
	}

	@RequestMapping(value = "manager/managerProductTable", method = RequestMethod.GET)
	public String managerProductTable(int num, int key, Model model) {

		model.addAttribute("pvl", service.selectProductList());
		model.addAttribute("num", num);
		model.addAttribute("key", key);

		return "manager/managerPage";
	}

	@RequestMapping(value = "manager/managerTable", method = RequestMethod.GET)
	public String managerTable(int num, Model model) {

		if (num == 1) {
			model.addAttribute("uvl", service.selectUserList());
		} else if (num == 2) {
			model.addAttribute("pvl", service.selectProductList());
		} else if (num == 3) {
			model.addAttribute("bvl", service.selectBuyinfoList());
		} else if (num == 4) {
			model.addAttribute("svl", service.selectSellList());
		} else if (num == 5) {
			model.addAttribute("contactList", service.selectContactList());
		}

		model.addAttribute("num", num);

		return "manager/managerPage";
	}

	@RequestMapping(value = "manager/deleteUser", method = RequestMethod.GET)
	public String deleteUser(String id, Model model) {

		service.deleteUser(id);
		model.addAttribute("num", 1);

		return "redirect:/manager/managerTable";
	}

	@RequestMapping(value = "manager/deleteProduct", method = RequestMethod.GET)
	public String deleteProduct(int product_num, Model model) {

		service.deleteProduct(product_num);
		model.addAttribute("num", 2);
		model.addAttribute("key", 0);

		return "redirect:/manager/managerProductTable";
	}

	@RequestMapping(value = "manager/deleteBuyInfo", method = RequestMethod.GET)
	public String deleteBuyInfo(int buyinfo_num, int product_num, Model model) {

		service.deleteBuyinfo(buyinfo_num);
		service.updateProductStock_1(product_num);
		
		model.addAttribute("num", 3);
		return "redirect:/manager/managerTable";
	}

	@RequestMapping(value = "manager/deleteSell", method = RequestMethod.GET)
	public String deleteSell(int sell_num, int product_num, Model model) {
		
		service.deleteProduct(product_num); //프로덕트 지워지면서 하위 테이블 다 지워짐
		//service.deleteSell(sell_num);
		
		model.addAttribute("num", 4);
		return "redirect:/manager/managerTable";
	}
	
	@RequestMapping(value = "manager/deleteContact", method = RequestMethod.GET)
	public String deleteContact(int contact_num, Model model) {
		
		service.deleteContact(contact_num);
		
		model.addAttribute("num", 5);
		return "redirect:/manager/managerTable";
	}
	

	@RequestMapping(value = "manager/updateProduct", method = RequestMethod.GET)
	public String updateProductPage(int product_num, Model model) {
		// service.updateProduct(num);

		model.addAttribute("pv", service.selectProduct(product_num));
		model.addAttribute("num", product_num);

		return "manager/addProduct";
	}

	@RequestMapping(value = "manager/completeBuyInfo", method = RequestMethod.GET)
	public String completeBuyInfo(int buyinfo_num, Model model) {
		// System.out.println("컴플릿바이" + num);

		BuyinfoVO bv = new BuyinfoVO();
		bv = service.selectBuyinfo(buyinfo_num);
		//int product_num = bv.getProduct_num();
		System.out.println("나는 구매번호 " + bv);

		if (service.addSellInfo(bv)) {
			// service.deleteBuyinfo(num);
			//service.deleteProduct(product_num); 풀면 암튼 ㅇㅋ
			service.updateBuyInfoStock(buyinfo_num);

			model.addAttribute("num", 4);
			return "redirect:/manager/managerTable";
		}

		return "redirect:/manager/managerTable";
	}
}
