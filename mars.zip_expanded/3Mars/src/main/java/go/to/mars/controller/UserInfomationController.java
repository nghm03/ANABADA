package go.to.mars.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import go.to.mars.service.UserService;
import go.to.mars.vo.ContactVO;
import go.to.mars.vo.UserVO;

@Controller
public class UserInfomationController {
	
	@Autowired
	UserService service;
	
	@RequestMapping(value = "CashPage", method = RequestMethod.GET)
	public String CashPage() {
		return "CashPage";
	}
	
	@RequestMapping(value = "UserInfoPage", method = RequestMethod.GET)
	public String UserInfoPage() {
		return "UserInfoPage";
	}
	
	@RequestMapping(value = "userUpdate", method = RequestMethod.POST)
	public String userUpdate(UserVO uservo) {
	    return service.userUpdate(uservo);
	}
	    
	@RequestMapping(value = "cashUpdate", method = RequestMethod.GET)
	public String cashUpdate(int cash) {
	    System.out.println("충전 : " + cash);
	    return service.cashUpdate(cash);
	}
	    
	@RequestMapping(value = "love", method = RequestMethod.POST)
	public String love(ContactVO contact) {
	    System.out.println("가져온 contact : " + contact);
	    int loveletter = service.love(contact);
	    if (loveletter == 1) {
	        System.out.println("정상적으로 contact 테이블에 등록됨");
	    }
	    return "UserInfoPage";
	}	

}
