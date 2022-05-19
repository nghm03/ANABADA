package go.to.mars.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import go.to.mars.service.ProductService;

@RestController

public class AjaxProductController {

    @Autowired
    ProductService service;
    
    @Autowired
    HttpSession session;


    //장바구니 (추가 및 출력)
    @RequestMapping(value = "addnum", method = RequestMethod.POST)
    public String addnum(int product_num,String user_id) {
        return service.addnum(product_num, user_id);
    }
    
    //장바구니 (유저캐시,토탈)
    @RequestMapping(value = "priceInfo", method = RequestMethod.POST)
    public HashMap<String, Integer> priceInfo(Model model) {
        return service.priceInfo();
    }
    
    //작은 카트에서 삭제눌렀을때    
    @RequestMapping(value = "deleteCart", method = RequestMethod.POST)
    public String deleteCart(int value) {
        return service.deleteCart(value);
    }
    
    //큰 카트에서 삭제눌렀을때
    @RequestMapping(value = "deleteCart2", method = RequestMethod.POST)
    public String deleteCart2(int value) {
        return service.deleteCart2(value);
    }
    
    @RequestMapping(value = "userOrderInfo", method = RequestMethod.POST)
    public HashMap<String, Object> userOrderInfo(String user_id) {
        return service.userOrderInfo(user_id);
    }
    
    // 카트 중복 체크
    @RequestMapping(value = "cartCheck", method = RequestMethod.POST) 
	public boolean cartCheck(int product_num,String user_id) {
    	
    	System.out.println(service.cartCheck(product_num, user_id));
    	
    	return service.cartCheck(product_num, user_id);
    }
}