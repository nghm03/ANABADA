package go.to.mars.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.to.mars.service.ProductService;
import go.to.mars.vo.ProductVO;

@Controller
public class ProductController {

	@Autowired
	ProductService service;

	@RequestMapping(value = "ProductPage", method = RequestMethod.GET)
	public String ProductPage(Model model) {

		model.addAttribute("pvl", service.selectProductList());

		for (ProductVO pv : service.selectProductList()) {
			System.out.println(pv);
		}

		return "ProductPage";
	}

	@RequestMapping(value = "buy", method = RequestMethod.GET)
	public String buy(int p, Model model) {

		model.addAttribute("pv", service.selectBuy(p));

		return "buy";
	}

	@RequestMapping(value = "kategorieProcess", method = RequestMethod.GET)
	public String kategorieProcess(String pc, Model model) {

		model.addAttribute("pvl", service.selectProductList());

		System.out.println(pc);
		model.addAttribute("pc", pc);

		return "ProductPage";
	}

	// 구매하기 눌렀을 경우
	@RequestMapping(value = "checkOut", method = RequestMethod.GET)
	public String checkOut() {
		System.out.println("여기로 왔어요");
		service.checkOut();
		return "UserInfoPage";
	}
	
	@RequestMapping(value = "search", method = RequestMethod.POST)
	public String search(String search ,Model model) {
		ArrayList<ProductVO> ProductVOList = new ArrayList<>(); 
		
		ProductVOList = service.search(search);
		model.addAttribute("pvl", ProductVOList);
		model.addAttribute("pc", 0);
		
		return "ProductPage";
	}

}
